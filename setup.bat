@echo off
REM NOTE: Keep this file ASCII-only. cmd.exe reads .bat files in the OEM
REM       codepage (CP932 on Japanese Windows), so UTF-8 text breaks execution.
where uv >nul 2>&1
if errorlevel 1 (
    echo Installing uv...
    powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
    if errorlevel 1 (
        echo ERROR: Failed to install uv. See https://docs.astral.sh/uv/getting-started/installation/
        pause
        exit /b 1
    )
)

REM --- PROXY settings (uncomment and edit if you are behind a proxy) ---
REM set HTTP_PROXY=http://proxy.example.com:8080
REM set HTTPS_PROXY=http://proxy.example.com:8080
REM set NO_PROXY=localhost,127.0.0.1

echo Syncing virtual environment and dependencies with uv...
uv sync
if errorlevel 1 (
    echo ERROR: Failed to sync dependencies.
    pause
    exit /b 1
)

echo.
echo Setup complete!
echo uv installs the pinned Python version automatically if it is missing.
echo.
echo To run commands without activating the venv:
echo   uv run pytest
echo   uv run ruff check .
echo.
echo To activate the venv in a new terminal instead, run:
echo   .venv\Scripts\activate.bat
pause
