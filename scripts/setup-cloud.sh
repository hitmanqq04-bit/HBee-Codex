#!/usr/bin/env bash
set -euo pipefail

if [[ ! -f "skills-lock.json" ]]; then
  echo "skills-lock.json not found" >&2
  exit 1
fi

npx -y skills@1.7.0 experimental_install

expected=25
actual="$(find .agents/skills -mindepth 1 -maxdepth 1 -type d | wc -l | tr -d ' ')"

if [[ "$actual" != "$expected" ]]; then
  echo "Expected $expected restored skills, found $actual" >&2
  exit 1
fi

echo "HBee-Codex cloud setup PASS: restored $actual skills."
