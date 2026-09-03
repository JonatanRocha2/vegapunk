# Learning Journal

## 2026-09-02 - English-only catalog

**Context:** Maintaining complete English and Brazilian Portuguese packs doubled
skill, documentation, installer, and validation work.

**Solution:** Keep 17 English skills under `skills/en/`; remove Portuguese skills
and localized documents; remove language selection from both installers; validate
only English metadata and catalog entries.

**Decision:** Use one language to reduce duplication, prevent translation drift,
and keep curation focused.

**Verification:** `npm test` validates all 17 skills, PowerShell parsing succeeds,
and Skills CLI discovers exactly 17 skills.

**Reusable lesson:** Locale variants create ongoing synchronization cost. Add one
only when demand and ownership justify maintaining complete parity.

## 2026-09-02 - Remote repository-only updates

**Context:** Existing users need to refresh Vegapunk skills without updating a
local clone or reinstalling external catalogs and recommended skills.

**Solution:** Add `-RepoOnly` to `install.ps1` and `--repo-only` to `install.sh`.
Both modes install current Vegapunk skills directly from GitHub while skipping
`aws-core`, `handoff`, `frontend-design`, Caveman, and Caveman proxy setup.

**Decision:** Reuse existing pinned installer and skill list instead of adding
separate update scripts that could drift from installation behavior.

**Verification:** Validate catalog structure, PowerShell syntax, Skills CLI
discovery, shell syntax, and piped installer completion in CI.

**Reusable lesson:** Prefer one installer with a narrow mode flag when install
and update share source selection and destination semantics.

## 2026-09-02 - Protect piped installer input

**Context:** `curl | sh` supplies script text through standard input. Skills CLI
also reads standard input and consumed the unparsed remainder after its first
invocation, so later installation stages silently never ran.

**Solution:** Redirect standard input from `/dev/null` for Node.js, Git, `npx`,
`npm`, and Caveman child processes in `install.sh`. Add CI tests whose mock child
commands consume all available input and assert that full and repository-only
installer modes reach their final messages.

**Decision:** Isolate each child process rather than downloading and re-executing
the installer from a temporary file. This keeps documented one-line commands
while removing shared-standard-input coupling.

**Verification:** Reproduce failure with exact remote command, rerun with a
temporary Linux Node.js runtime, and exercise pipe completion with consuming mock.

**Reusable lesson:** Scripts designed for `curl | sh` must never let child
processes inherit script standard input.
