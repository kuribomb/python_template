@echo off
echo Setting up Python virtual environment...
py -m venv .venv
if errorlevel 1 (
    echo ERROR: Failed to create virtual environment. Is Python 3.12 installed?
    exit /b 1
)

echo Activating virtual environment...
call .venv\Scripts\activate.bat

echo Installing dev dependencies...
pip install -e ".[dev]"
if errorlevel 1 (
    echo ERROR: Failed to install dependencies.
    exit /b 1
)

echo.
echo Setup complete!
echo To activate the venv in a new terminal, run:
echo   .venv\Scripts\activate.bat
echo.
echo To run the app:
echo   python -m myapp.main
echo.
echo To run tests (headless):
echo   set QT_QPA_PLATFORM=offscreen
echo   pytest tests/ -v
