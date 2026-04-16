@echo off
echo Setting up Python environment with uv...

where uv >nul 2>&1
if errorlevel 1 (
    echo Installing uv...
    powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
)

echo Creating virtual environment...
uv venv
if errorlevel 1 (
    echo ERROR: Failed to create virtual environment.
    exit /b 1
)

echo Activating virtual environment...
call .venv\Scripts\activate.bat

echo Installing dev dependencies...
uv pip install -e ".[dev]"
if errorlevel 1 (
    echo ERROR: Failed to install dependencies.
    exit /b 1
)

echo Installing pre-commit hooks...
pre-commit install

echo.
echo Setup complete!
echo To activate the venv in a new terminal, run:
echo   .venv\Scripts\activate.bat
