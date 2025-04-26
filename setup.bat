@echo off
echo Setting up AI Workstation...

:: Check Python version
python --version
if errorlevel 1 (
    echo Python is not installed. Please install Python 3.11 or later.
    pause
    exit /b 1
)

:: Create and activate virtual environment
echo Creating virtual environment...
python -m venv venv
call venv\Scripts\activate

:: Install Python packages
echo Installing Python packages...
pip install --upgrade pip
pip install -r requirements.txt

:: Install VS Code extensions
echo Installing VS Code extensions...
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-toolsai.jupyter
code --install-extension eamodio.gitlens
code --install-extension streetsidesoftware.code-spell-checker

:: Create workspace directories
echo Creating workspace directories...
mkdir src
mkdir data
mkdir notebooks
mkdir tests

echo Setup complete!
pause 