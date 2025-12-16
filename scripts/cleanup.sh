#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

LOG_DIR="$ROOT_DIR/logs"
RUN_LOG="$LOG_DIR/run.log"
SCRIPT_LOG="$LOG_DIR/cleanup.log"

mkdir -p "$LOG_DIR"
: > "$RUN_LOG"
: > "$SCRIPT_LOG"

finalize() {
  local exit_code=$?
  trap - EXIT
  if [ "$exit_code" -eq 0 ]; then
    echo "RESULT=PASS" >> "$SCRIPT_LOG"
  else
    echo "RESULT=FAIL" >> "$SCRIPT_LOG"
  fi
  exit "$exit_code"
}
trap finalize EXIT

start_logging() {
  exec > >(tee >(cat >> "$SCRIPT_LOG") >(cat >> "$RUN_LOG"))
  exec 2> >(tee >(cat >> "$SCRIPT_LOG") >(cat >> "$RUN_LOG") >&2)
  local timestamp
  timestamp="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
  echo "=== cleanup.sh (${timestamp}) ==="
}
start_logging

mapfile -t PYTHON_FILES < <(git ls-files "*.py")

log() {
  echo "[cleanup] $*"
}

ensure_command() {
  if ! command -v "$1" >/dev/null 2>&1; then
    log "Missing required command: $1"
    log "Install dependencies from requirements-lint.txt or ensure the tool is on PATH."
    exit 1
  fi
}

ensure_command black
ensure_command isort
ensure_command pyright

log "Formatting code with black"
if [ "${#PYTHON_FILES[@]}" -eq 0 ]; then
  log "No Python files detected; skipping black"
else
  for file in "${PYTHON_FILES[@]}"; do
    black "$file"
  done
fi

log "Sorting imports with isort (profile=black)"
if [ "${#PYTHON_FILES[@]}" -eq 0 ]; then
  log "No Python files detected; skipping isort"
else
  isort --profile black "${PYTHON_FILES[@]}"
fi

log "Running pyright with fixes when supported"
pyright_flags=()
if pyright --help 2>&1 | grep -q -- "--fix"; then
  pyright_flags+=("--fix")
fi
pyright "${pyright_flags[@]}"
