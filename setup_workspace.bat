@echo off
echo Setting up development workspace...

:: Check if we're in the correct directory
if not "%CD%"=="C:\development" (
    echo Please run this script from C:\development
    pause
    exit /b 1
)

:: Create main directories
echo Creating main directories...
mkdir ai-workstation 2>nul
mkdir n8n-workflows 2>nul
mkdir projects 2>nul
mkdir tools 2>nul

:: Setup AI Workstation
echo Setting up AI Workstation...
cd ai-workstation
call ..\setup.bat
cd ..

:: Setup n8n
echo Setting up n8n...
cd n8n-workflows
call ..\setup_n8n.bat
cd ..

echo Workspace setup complete!
echo Your development environment is ready at C:\development
echo 
echo Available directories:
echo - ai-workstation: AI development environment
echo - n8n-workflows: n8n automation workflows
echo - projects: General project repositories
echo - tools: Development tools and utilities
echo 
echo Git Configuration:
echo - Name: Jason Neukirchner
echo - Email: jneukirchner@hotmail.com
echo - Default Editor: VS Code
echo - Default Branch: main
pause 