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
discovery, and shell syntax in CI.

**Reusable lesson:** Prefer one installer with a narrow mode flag when install
and update share source selection and destination semantics.
