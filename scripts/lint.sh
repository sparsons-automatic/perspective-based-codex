#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

LOG_DIR="$ROOT_DIR/logs"
RUN_LOG="$LOG_DIR/run.log"
SCRIPT_LOG="$LOG_DIR/lint.log"

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
  echo "=== lint.sh (${timestamp}) ==="
}
start_logging

mapfile -t PYTHON_FILES < <(git ls-files "*.py")

log() {
  echo "[lint] $*"
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
ensure_command ruff
ensure_command pyright

log "Checking formatting with black"
if [ "${#PYTHON_FILES[@]}" -eq 0 ]; then
  log "No Python files detected; skipping black --check"
else
  for file in "${PYTHON_FILES[@]}"; do
    black --check "$file"
  done
fi

log "Ensuring import order with isort (profile=black)"
if [ "${#PYTHON_FILES[@]}" -eq 0 ]; then
  log "No Python files detected; skipping isort --check"
else
  isort --profile black --check-only "${PYTHON_FILES[@]}"
fi

log "Running Ruff lint checks"
ruff check .

log "Running Pyright type checks"
pyright
