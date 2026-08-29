#!/usr/bin/env sh
set -eu

with_caveman_proxy=0
install_caveman=1
language=en

while [ "$#" -gt 0 ]; do
  case "$1" in
    --with-caveman-proxy) with_caveman_proxy=1 ;;
    --no-caveman) install_caveman=0 ;;
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

case "$language" in
  en)
    set -- software-architecture cloud-architecture aws-architecture \
      gcp-architecture azure-architecture terraform-infrastructure \
      kubernetes-operations devops-cicd sre-incident-response \
      cloud-security-review finops-cost-review code-review
    ;;
  pt-br)
    set -- software-architecture-pt-br cloud-architecture-pt-br \
      aws-architecture-pt-br gcp-architecture-pt-br azure-architecture-pt-br \
      terraform-infrastructure-pt-br kubernetes-operations-pt-br \
      devops-cicd-pt-br sre-incident-response-pt-br \
      cloud-security-review-pt-br finops-cost-review-pt-br code-review-pt-br
    ;;
  *)
    printf 'Unsupported language: %s (use pt-br or en)\n' "$language" >&2
    exit 2
    ;;
esac

if ! command -v node >/dev/null 2>&1 || ! command -v npx >/dev/null 2>&1; then
  printf 'Node.js 22.20 or newer with npx is required: https://nodejs.org/\n' >&2
  exit 1
fi

if ! node -e 'const [a,b]=process.versions.node.split(".").map(Number); process.exit(a>22 || (a===22 && b>=20) ? 0 : 1)'; then
  printf 'Node.js 22.20 or newer is required; found %s\n' "$(node --version)" >&2
  exit 1
fi

npx --yes skills@1.5.23 add JonatanRocha2/vegapunk --skill "$@" -a codex -g --yes

if [ "$install_caveman" -eq 1 ]; then
  npx --yes skills@1.5.23 add \
    https://github.com/JuliusBrussee/caveman/tree/b5ec6351396b643a17cbbec4a6eee8b3fb9dd782 \
    --skill caveman -a codex -g --yes
fi

if [ "$with_caveman_proxy" -eq 1 ]; then
  npm install -g @caveman-ai/cli@1.2.5
  caveman setup --install
fi

printf 'Vegapunk %s skills installed for Codex. Restart Codex if needed.\n' "$language"
