# Codex Desktop AGENTS.md Binding Evidence — 2026-09-27

## Status

**VERIFIED NOT LOADED** for the tested Codex Desktop task.

## Scope

Repository:

`hitmanqq04-bit/HBee-Codex`

Local workspace:

`C:\Users\bee\Documents\HBee-Codex`

Branch:

`codex/bootstrap-v0.1`

## Verified runtime evidence

The tested task reported:

- repository root = `C:\Users\bee\Documents\HBee-Codex`
- current working directory = `C:\Users\bee\Documents\HBee-Codex`
- active branch = `codex/bootstrap-v0.1`
- upstream = `origin/codex/bootstrap-v0.1`
- working tree = clean

A read-only inspection of the newest Codex rollout JSONL under `%USERPROFILE%\.codex\sessions` found:

- no initial `# AGENTS.md instructions for` block
- no injected HBee-Codex repository AGENTS block
- the earliest matching AGENTS phrase appeared only in the explicit user diagnostic request
- the earliest HBee-Codex path occurrence was also from explicit user input rather than injected repository guidance

Final runtime result:

`VERIFIED NOT LOADED`

## Related observations

- Repository `AGENTS.md` exists and is readable.
- Project `.codex/config.toml` exists.
- Whether project-local `.codex/config.toml` was loaded by the tested Desktop task remains **UNKNOWN**.
- The Desktop UI displayed the warning:
  `session-flags: features.thread_tools is ignored`.
- No evidence currently establishes that the `thread_tools` warning caused the missing AGENTS injection.

## Operational decision

Do not block the HBee-Codex workbench on Desktop AGENTS auto-injection.

Until the Desktop behavior is revalidated:

1. keep `AGENTS.md` as the canonical repository guidance file;
2. explicitly instruct Codex to read applicable `AGENTS.md` before repository modifications;
3. treat automatic repository-instruction injection in the tested Desktop runtime as unavailable;
4. do not add undocumented configuration keys as speculative repairs;
5. preserve this result as runtime evidence and re-test only after a meaningful Codex Desktop/runtime update.

## Promotion impact

This evidence does **not** invalidate the repository bootstrap itself.

It does prevent claiming:

- Desktop AGENTS auto-discovery = functional;
- repository guidance is automatically injected;
- project-local config is fully applied.

Those claims remain blocked until new runtime evidence supports them.
