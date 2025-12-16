# Codex Resources Starter Pack

This repository is the template I copy into every new Python-focused project. It gives Codex agents (and humans) a consistent workflow: shared automation scripts, lint requirements, and lightweight governance docs. Drop these files into a fresh repo and you immediately have the tooling that Codex expects when starting work.

## Getting Started

1. Copy this folder into your new project and initialize git if needed.
2. Use VS Code with the Dev Containers extension and the Codex plugin to reopen the repo in the provided container (details below).
3. If you are running locally, create a virtual environment and install the tooling helpers with `pip install -r requirements-lint.txt`.
4. Follow the workflow described in `programmer-AGENTS.md` (branching rules, TODO handling, script policy).
5. Run the scripts in `scripts/` as you develop:
   * `scripts/lint.sh` before committing
   * `scripts/cleanup.sh` when you want automatic formatting/fixes
   * `scripts/bootstrap-azure-env.sh` any time you need Azure credentials seeded into `.env`
   * `scripts/pulumi-preview.sh` to validate Pulumi stacks with your `.env` values

## Using the Dev Container

The `.devcontainer/` directory defines the development environment I expect for new projects:

1. Open the repository with VS Code and run “Reopen in Container”. The Dev Containers extension will build `.devcontainer/Dockerfile`.
2. `devcontainer.json` layers features for Python 3.12, Docker CLI + Buildx, Pulumi, and kubectl/helm/minikube; it also installs a curated set of VS Code extensions for the Codex workflow.
3. Secrets or overrides go into `.devcontainer/devcontainer.env`, which is passed as an `--env-file` to the container runtime.
4. After the container starts, the `postStartCommand` upgrades pip and installs `requirements.txt` and `requirements-lint.txt`, keeping tooling in sync.

If you add more project-specific tools, update the Dockerfile, features, or post-start command here so every new repo launch remains reproducible.

## Repository Contents

| Path | Description |
| --- | --- |
| `README.md` | You are here—explains how to use the starter pack. |
| `requirements-lint.txt` | Minimal Python tooling deps (black, isort, pyright, ruff) that the helper scripts rely on. |
| `programmer-AGENTS.md` | Compact Git-flow plus Codex-specific operating rules (branch naming, TODO process, script execution policy). |
| `.codex/perspectives/README.md` | Catalog of Codex perspectives (Security Investigator, Compliance Translator, etc.) with guidance for creating new ones. |
| `.codex/todo-plan-examples/README.md` | Library of Todo API templates (PCI, ISO, HIPAA, etc.) plus instructions for adapting them to your project. |
| `.devcontainer/Dockerfile` | Base image (Debian Bullseye) plus compilers/build tools needed by downstream features and Python packages. |
| `.devcontainer/devcontainer.json` | Dev Containers spec wiring in Python, Pulumi, Docker, and Kubernetes tooling plus VS Code extensions, mounts, and post-start installs. |
| `.devcontainer/devcontainer.env` | Empty template env file that the dev container loads at runtime; populate with project secrets or overrides. |
| `scripts/cleanup.sh` | Formats Python files with black/isort and runs `pyright --fix` when available, capturing output under `logs/cleanup.log`. |
| `scripts/lint.sh` | Runs black/isort/ruff/pyright in check-only mode and writes logs to `logs/lint.log`. |

All helper scripts standardize logging (writing to `logs/` with a shared `run.log`) so Codex can surface results in status updates.

## Customizing for a New Project

- Keep `programmer-AGENTS.md` authoritative—update it only when process changes.
- Extend `requirements-lint.txt` if you add more tooling; the scripts will fail fast if a required command is missing.
- Swap out or augment the scripts folder as the new project grows, but keep their entrypoints and logging pattern so Codex automation stays predictable.

With these files in place, every new repo starts with the same expectations, reducing friction for Codex agents and collaborators alike.

## Codex Documentation Map

All Codex-specific reference material lives under the `.codex/` folder:

- **Perspectives** → `.codex/perspectives/README.md` describes the available personas (Security Investigator, Compliance Translator, Project Manager, etc.) and how to build new ones. When you want Codex to adopt a role, point it at the relevant file in this directory.
- **Todo plan examples** → `.codex/todo-plan-examples/README.md` lists the compliance and starter TODO templates. Copy the sections you need into your project’s `TODO.md` to seed work for Codex agents.
- **Automation helpers** → `.codex/bin/` contains any custom CLI wrappers referenced by the perspectives or TODO plans (inspect scripts there before reusing them).

Use this README as the entry point, then drill into the `.codex/*/*` paths above whenever you need deeper documentation for Codex-driven workflows.
