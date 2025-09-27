.PHONY: help setup sync sync-all upgrade upgrade-all hooks lint format type unit test check coverage build publish run clean

help:
	@echo "Available targets:"
	@echo "  setup        - Create venv, sync all deps (incl. dev/docs), install pre-commit hooks"
	@echo "  sync         - Sync project runtime dependencies"
	@echo "  sync-all     - Sync all dependency groups (dev, docs, etc.)"
	@echo "  upgrade      - Upgrade runtime dependencies to the latest allowed versions"
	@echo "  upgrade-all  - Upgrade all dependency groups"
	@echo "  hooks        - Run pre-commit on all files"
	@echo "  lint         - Ruff lint checks"
	@echo "  format       - Ruff code formatting"
	@echo "  type         - Mypy type checks"
	@echo "  unit         - Run unit tests (pytest)"
	@echo "  test         - Run pre-commit hooks and unit tests"
	@echo "  check        - Format, lint, type, and tests (full local quality gate)"
	@echo "  coverage     - Run tests with coverage report"
	@echo "  build        - Build the package (wheel/sdist)"
	@echo "  publish      - Publish the package to PyPI"
	@echo "  run          - Run the arborea CLI (use ARGS='...')"
	@echo "  clean        - Remove caches and build artifacts"

setup:
	@command -v uv >/dev/null 2>&1 || { echo "uv not found. Please install uv (see README) and retry."; exit 1; }
	uv sync --all-groups
	uv run pre-commit install

sync:
	uv sync

sync-all:
	uv sync --all-groups

upgrade:
	uv sync --upgrade

upgrade-all:
	uv sync --upgrade --all-groups

hooks:
	uv run pre-commit run -a

lint:
	uv run ruff check

format:
	uv run ruff format

type:
	uv run mypy

unit:
	uv run pytest

test: hooks unit

check: format lint type test

coverage:
	uv run pytest --cov --cov-report=term-missing

build:
	uv build

publish:
	uv publish

# Example: make run ARGS="--version"
run:
	uv run arborea $(ARGS)

clean:
	rm -rf .pytest_cache .ruff_cache .mypy_cache .coverage htmlcov build dist
