#!/usr/bin/env sh
set -eu

root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
mock_bin=$(mktemp -d)
trap 'rm -rf "$mock_bin"' EXIT HUP INT TERM

for command in npx git npm caveman; do
  printf '#!/usr/bin/env sh\ncat >/dev/null\n' > "$mock_bin/$command"
  chmod +x "$mock_bin/$command"
done

assert_completion() {
  expected=$1
  shift
  output=$(cat "$root/install.sh" | PATH="$mock_bin:$PATH" sh -s -- "$@")
  printf '%s\n' "$output" | grep -Fqx "$expected"
}

assert_completion 'Vegapunk skills installed for Codex. Restart Codex if needed.'
assert_completion \
  'Vegapunk repository skills updated for Codex. Restart Codex if needed.' \
  --repo-only
