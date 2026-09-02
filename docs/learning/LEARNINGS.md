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
