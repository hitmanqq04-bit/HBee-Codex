# HBee-Codex

Codex Workbench — coding agent skills, tools, runtime, evaluation, and workflow sandbox.

## Status

`CANDIDATE / BOOTSTRAP`

This repository is a controlled workspace for learning, configuring, testing, and evaluating Codex workflows before promoting them into production repositories.

## Scope

- Codex repository instructions and project configuration
- Agent Skills and Plugins
- MCP/tool integrations
- Git/GitHub workflow
- Runtime verification and browser testing
- Evals, regression evidence, and experiments

## Principle

Build → Run → Observe → Test/Break → Repair → Regression → Promote.

Experimental capabilities remain isolated until they have executable evidence.

## Portable baseline

HBee-Codex separates portable repository state from machine-specific runtime state.

Portable baseline:

- `AGENTS.md`
- `.codex/config.toml`
- `skills-lock.json`
- `scripts/setup-cloud.sh`
- durable evidence and experiment conventions

Machine-local integrations such as OAuth state, absolute Windows MCP paths, CodeGraph indexes, Playwright cache, and restored `.agents/skills/` are not committed.

For Codex Cloud, use `bash scripts/setup-cloud.sh` as the environment install command. The current skills baseline is restorable rather than immutable-source-pinned; see `docs/cloud-environment.md` for the promotion gate and limitation.
