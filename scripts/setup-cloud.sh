#!/usr/bin/env bash
set -euo pipefail

if [[ ! -f "skills-lock.json" ]]; then
  echo "skills-lock.json not found" >&2
  exit 1
fi

# Codex Cloud may expose a HOME npm cache that exists but cannot create
# cache subdirectories reliably. Keep the cache runtime-local and writable.
export npm_config_cache="${npm_config_cache:-/tmp/hbee-npm-cache}"
mkdir -p "$npm_config_cache"

npx -y skills@1.7.0 experimental_install

expected=25
actual="$(find .agents/skills -mindepth 1 -maxdepth 1 -type d | wc -l | tr -d ' ')"

if [[ "$actual" != "$expected" ]]; then
  echo "Expected $expected restored skills, found $actual" >&2
  exit 1
fi

echo "HBee-Codex cloud setup PASS: restored $actual skills."
