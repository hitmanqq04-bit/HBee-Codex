# Codex AGENTS.md Binding Evidence — 2026-09-27

## Status

- **Codex CLI v0.149.0:** **VERIFIED LOADED**
- **Tested Codex Desktop task:** **VERIFIED NOT LOADED**

This establishes a runtime split: the repository guidance is valid and discoverable by Codex CLI, while the tested Desktop task did not inject it into the initial task context.

## Scope

Repository:

`hitmanqq04-bit/HBee-Codex`

Local workspace:

`<LOCAL_WORKSPACE>\HBee-Codex`

Branch:

`codex/bootstrap-v0.1`

## Desktop runtime evidence

The tested Desktop task reported:

- repository root = `<LOCAL_WORKSPACE>\HBee-Codex`
- current working directory = `<LOCAL_WORKSPACE>\HBee-Codex`
- active branch = `codex/bootstrap-v0.1`
- upstream = `origin/codex/bootstrap-v0.1`
- working tree = clean

A read-only inspection of the newest Codex rollout JSONL under `%USERPROFILE%\.codex\sessions` found:

- no initial `# AGENTS.md instructions for` block
- no injected HBee-Codex repository AGENTS block
- the earliest matching AGENTS phrase appeared only in the explicit user diagnostic request
- the earliest HBee-Codex path occurrence was also from explicit user input rather than injected repository guidance

Desktop result:

`VERIFIED NOT LOADED`

## CLI runtime evidence

From:

`<LOCAL_WORKSPACE>\HBee-Codex`

the user ran:

`codex --ask-for-approval never "Summarize the current instructions."`

Codex CLI reported:

- version = `v0.149.0`
- model = `gpt-5.6-sol medium`
- directory = `~\Documents\HBee-Codex`

The response reproduced multiple repository-specific rules that exist in this repository's `AGENTS.md`, including:

- execute clear tasks instead of stopping at planning
- inspect repository instructions before editing
- use VERIFIED / DERIVED / ASSUMED / UNVERIFIED / CONFLICTED / UNKNOWN
- follow `Build → Run → Observe → Test/Break → Repair → Regression → Promote`
- store durable evaluation evidence under `docs/evidence/`
- treat new tools/plugins/skills/hooks/workflows as CANDIDATE or EXPERIMENTAL
- use `codex/<task>` branches and keep `main` stable
- do not claim capabilities functional before smoke testing or integrated before end-to-end exercise

CLI result:

`VERIFIED LOADED`

## Interpretation

The repository `AGENTS.md` is not malformed, oversized, or structurally invalid for Codex CLI discovery.

The failure is isolated to the tested Desktop runtime path rather than the repository instruction file itself.

## Related observations

- Repository `AGENTS.md` exists and is readable.
- Project `.codex/config.toml` exists.
- Whether project-local `.codex/config.toml` was loaded by the tested Desktop task remains **UNKNOWN**.
- The Desktop UI displayed:
  `session-flags: features.thread_tools is ignored`.
- No evidence currently establishes that the `thread_tools` warning caused the missing AGENTS injection.

## Operational decision

1. Use Codex CLI as the canonical runtime for repository-governed work until Desktop binding is revalidated.
2. Keep `AGENTS.md` as the canonical repository guidance.
3. In Desktop tasks, explicitly ask Codex to read applicable `AGENTS.md` before modifications.
4. Do not add undocumented configuration keys as speculative repairs.
5. Re-test Desktop AGENTS injection only after a meaningful Desktop/runtime update.

## Promotion impact

The repository bootstrap remains valid.

Allowed claims:

- Codex CLI AGENTS discovery = **VERIFIED FUNCTIONAL**
- Repository `AGENTS.md` = **VALID FOR CLI DISCOVERY**

Blocked claims:

- Codex Desktop AGENTS auto-injection = functional
- project-local Desktop config is fully applied
