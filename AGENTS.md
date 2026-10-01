# AGENTS.md

## Repository purpose

HBee-Codex is a controlled Codex workbench for learning, configuring, integrating, testing, and evaluating coding-agent capabilities before promotion into production repositories.

## Operating rules

1. Read this file and the relevant existing code/configuration before editing.
2. Execute when the task is clear; do not stop at planning unless planning is the requested deliverable.
3. Prefer the smallest reversible change that can prove or disprove the current objective.
4. Preserve existing behavior and accepted baselines unless the requested change explicitly requires otherwise.
5. Do not invent commands, files, test results, integrations, versions, or completion states.
6. Use UNKNOWN when required information is unavailable.
7. For version-sensitive APIs, libraries, tools, or platform behavior, prefer current official documentation.
8. Keep repository instructions thin. Reusable specialist procedures belong in Skills; live external capabilities belong in tools/MCP/plugins.
9. Never commit credentials, tokens, API keys, passwords, private certificates, or secrets.

## Evidence states

Use these labels when status matters:

- VERIFIED: supported by direct evidence.
- DERIVED: logically derived from verified inputs.
- ASSUMED: temporary assumption needed to proceed.
- UNVERIFIED: plausible but not yet checked.
- CONFLICTED: reliable evidence disagrees.
- UNKNOWN: insufficient evidence.

Do not silently promote ASSUMED, UNVERIFIED, or UNKNOWN claims to VERIFIED.

## Execution loop

Default engineering loop:

Build → Run → Observe → Test/Break → Repair → Regression → Promote

When a command or test is relevant and available, run it. If it cannot be run, report why and keep the result UNVERIFIED.

## Git workflow

- Keep `main` as the stable integration branch.
- Use task branches such as `codex/<task>` for non-trivial changes.
- Review the diff before proposing merge.
- Prefer focused commits with descriptive messages.
- Use pull requests for promotion into `main` once the workbench bootstrap is established.

## Experimental isolation

- New tools, plugins, skills, hooks, and agent workflows start as CANDIDATE or EXPERIMENTAL.
- Put throwaway or comparative experiments under `experiments/`.
- Do not represent an installed capability as functional until it has passed a smoke test.
- Do not represent a capability as integrated until it has been exercised in an end-to-end workflow.

## Evidence

Store durable runtime/evaluation notes under `docs/evidence/` when the result affects future decisions.

Evidence should record, when applicable:

- objective
- environment/version
- actual commands/actions executed
- observed result
- pass/fail criteria
- failures or limitations
- unresolved UNKNOWN items

## Done criteria

A task is complete only when the requested artifact/change exists, relevant verification has actually run when feasible, no known critical error remains, and the final status accurately distinguishes verified from unverified work.
