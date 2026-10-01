# Codex Cloud baseline smoke test — 2026-10-02

## Objective

Verify that the first HBee-Codex Codex Cloud environment can check out the repository and run a read-only task without modifying the workspace.

## Observed environment

- Repository: `hitmanqq04-bit/HBee-Codex`
- Cloud task branch: `work`
- HEAD: `10ff3da249f0703a507eabda147419129b5e17b0`

## Observed result

- GitHub checkout / repository access: **VERIFIED**
- Git working tree cleanliness: **VERIFIED**
- Root `AGENTS.md`: **MISSING** in the checked-out baseline
- `.agents/skills`: **MISSING** in the checked-out baseline
- Executable project / tests: **NONE**
- Repository contents observed by the task: only `README.md`
- File modifications during smoke test: **NONE**

## Interpretation

The Codex Cloud runtime itself is functional. The missing `AGENTS.md` and skills are a repository-promotion gap: they exist on the local bootstrap branch/workbench but were not yet present in the remote `main` commit used by the environment.

## Next gate

Promote the portable bootstrap baseline to `main`, configure the Cloud environment install command to run:

```bash
bash scripts/setup-cloud.sh
```

Then create a fresh Cloud task and verify:

1. root `AGENTS.md` discovery;
2. restoration/discovery of 25 project skills;
3. clean Git state after setup;
4. no machine-local paths, credentials, or secrets in the repository.
