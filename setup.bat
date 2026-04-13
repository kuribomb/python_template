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
echo To start the development server:
echo   uvicorn myapp.main:app --reload
echo.
echo API docs available at http://localhost:8000/docs
