#!/usr/bin/env sh
set -eu

with_caveman_proxy=0
install_caveman=1
install_aws_toolkit=1
language=en
allow_elevated=0

# renovate: datasource=npm depName=skills
skills_cli_version=1.5.23
# renovate: datasource=github-releases depName=JuliusBrussee/caveman
caveman_version=v2.3.1
caveman_commit=b5ec6351396b643a17cbbec4a6eee8b3fb9dd782
# renovate: datasource=npm depName=@caveman-ai/cli
caveman_cli_version=1.2.5
# renovate: datasource=github-digest depName=aws/agent-toolkit-for-aws
aws_toolkit_ref=main
aws_toolkit_commit=ed19c44c46c9c3a12ef0ff5bbf88161b75d3efbe

while [ "$#" -gt 0 ]; do
  case "$1" in
    --with-caveman-proxy) with_caveman_proxy=1 ;;
    --no-caveman) install_caveman=0 ;;
    --no-aws-toolkit) install_aws_toolkit=0 ;;
    --allow-elevated) allow_elevated=1 ;;
    --lang)
      if [ "$#" -lt 2 ]; then
        printf '%s\n' 'Option --lang requires pt-br or en.' >&2
        exit 2
      fi
      language=$2
      shift
      ;;
    --lang=*) language=${1#--lang=} ;;
    *) printf 'Unknown option: %s\n' "$1" >&2; exit 2 ;;
  esac
  shift
done

if [ "$(id -u)" -eq 0 ] && [ "$allow_elevated" -ne 1 ]; then
  printf '%s\n' 'Refusing elevated installation. Run as a normal user or pass --allow-elevated after reviewing the script.' >&2
  exit 1
fi

if [ "$with_caveman_proxy" -eq 1 ] && [ "$install_caveman" -ne 1 ]; then
  printf '%s\n' '--with-caveman-proxy cannot be combined with --no-caveman.' >&2
  exit 2
fi

case "$language" in
  en)
    set -- software-architecture cloud-architecture aws-architecture \
      gcp-architecture azure-architecture terraform-infrastructure \
      kubernetes-operations devops-cicd sre-incident-response \
      cloud-security-review finops-cost-review network-engineering \
      ansible-automation certification-study code-review semantic-commit
    ;;
  pt-br)
    set -- software-architecture-pt-br cloud-architecture-pt-br \
      aws-architecture-pt-br gcp-architecture-pt-br azure-architecture-pt-br \
      terraform-infrastructure-pt-br kubernetes-operations-pt-br \
      devops-cicd-pt-br sre-incident-response-pt-br \
      cloud-security-review-pt-br finops-cost-review-pt-br \
      network-engineering-pt-br ansible-automation-pt-br \
      certification-study-pt-br code-review-pt-br semantic-commit-pt-br
    ;;
  *)
    printf 'Unsupported language: %s (use pt-br or en)\n' "$language" >&2
    exit 2
    ;;
esac

if ! command -v node >/dev/null 2>&1 || \
   ! command -v npx >/dev/null 2>&1 || \
   ! command -v git >/dev/null 2>&1; then
  printf '%s\n' 'Node.js 22.20 or newer with npx and Git are required.' >&2
  exit 1
fi

if ! node -e 'const [a,b]=process.versions.node.split(".").map(Number); process.exit(a>22 || (a===22 && b>=20) ? 0 : 1)'; then
  printf 'Node.js 22.20 or newer is required; found %s\n' "$(node --version)" >&2
  exit 1
fi

npx --yes "skills@$skills_cli_version" add JonatanRocha2/vegapunk --skill "$@" -a codex -g --yes

if [ "$install_aws_toolkit" -eq 1 ]; then
  aws_toolkit_temp=$(mktemp -d)
  trap 'rm -rf "$aws_toolkit_temp"' EXIT HUP INT TERM
  git init --quiet "$aws_toolkit_temp"
  git -C "$aws_toolkit_temp" fetch --quiet --depth 1 \
    https://github.com/aws/agent-toolkit-for-aws.git "$aws_toolkit_commit"
  git -C "$aws_toolkit_temp" sparse-checkout init --cone
  git -C "$aws_toolkit_temp" sparse-checkout set skills/core-skills
  git -C "$aws_toolkit_temp" checkout --quiet --detach FETCH_HEAD
  npx --yes "skills@$skills_cli_version" add \
    "$aws_toolkit_temp/skills/core-skills" \
    --skill '*' -a codex -g --copy --yes
  rm -rf "$aws_toolkit_temp"
  trap - EXIT HUP INT TERM
fi

if [ "$install_caveman" -eq 1 ]; then
  caveman_temp=$(mktemp -d)
  trap 'rm -rf "$caveman_temp"' EXIT HUP INT TERM
  git init --quiet "$caveman_temp"
  git -C "$caveman_temp" fetch --quiet --depth 1 \
    https://github.com/JuliusBrussee/caveman.git "$caveman_commit"
  git -C "$caveman_temp" checkout --quiet --detach FETCH_HEAD
  npx --yes "skills@$skills_cli_version" add "$caveman_temp" \
    --skill caveman -a codex -g --copy --yes
  rm -rf "$caveman_temp"
  trap - EXIT HUP INT TERM
fi

if [ "$with_caveman_proxy" -eq 1 ]; then
  npm install -g "@caveman-ai/cli@$caveman_cli_version"
  caveman setup --install
fi

printf 'Vegapunk %s skills installed for Codex. Restart Codex if needed.\n' "$language"
