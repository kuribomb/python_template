#!/bin/bash
set -euo pipefail

echo "Setting up Python environment with uv..."

if ! command -v uv &>/dev/null; then
    echo "Installing uv..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    source "$HOME/.local/bin/env"
fi

echo "Creating virtual environment..."
uv venv

echo "Activating virtual environment..."
source .venv/bin/activate

echo "Installing dev dependencies..."
uv pip install -e ".[dev]"

echo "Installing pre-commit hooks..."
pre-commit install

echo ""
echo "Setup complete!"
echo "To activate the venv in a new terminal, run:"
echo "  source .venv/bin/activate"
