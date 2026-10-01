# Cloud environment baseline

HBee-Codex keeps machine-specific integrations local and stores only portable governance and restorable setup metadata in Git.

## Portable repository baseline

Tracked:

- `AGENTS.md`
- `.codex/config.toml`
- `skills-lock.json`
- `scripts/setup-cloud.sh`
- durable evidence under `docs/evidence/`
- experiment conventions under `experiments/`

Generated or machine-local and therefore not tracked:

- `.agents/skills/` restored from `skills-lock.json`
- `.codegraph/`
- `.playwright-cli/`
- temporary directories
- OAuth credentials, API keys, secrets
- machine-specific absolute runtime paths
- machine-specific MCP registrations

## Codex Cloud install command

Use:

```bash
bash scripts/setup-cloud.sh
```

The script uses `skills` CLI 1.7.0 to restore the 25 project engineering skills described by `skills-lock.json` and fails if the expected skill count is not restored.

Current limitation: `skills-lock.json` identifies the upstream source and installer metadata but does not provide an immutable Git commit pin. Therefore this baseline is **restorable**, not yet bit-for-bit reproducible across future upstream changes. A future promotion may add immutable source pinning if required.

## Promotion rule

A Cloud environment is not considered integrated merely because repository checkout succeeds. Promotion requires a fresh Cloud task to demonstrate:

- root `AGENTS.md` discovery;
- skill restoration and discovery;
- expected branch/HEAD provenance;
- clean working tree after setup;
- no secrets or machine-local configuration committed.
