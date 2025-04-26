@echo off
echo Setting up Git repository structure...

:: Create main directories
echo Creating main directories...
mkdir ai-workstation
mkdir n8n-workflows
mkdir projects
mkdir tools

:: Initialize Git in each directory
echo Initializing Git repositories...
cd ai-workstation
git init
cd ..

cd n8n-workflows
git init
cd ..

cd projects
git init
cd ..

cd tools
git init
cd ..

:: Create .gitignore files
echo Creating .gitignore files...
echo # Python
echo __pycache__/
echo *.py[cod]
echo *$py.class
echo venv/
echo .env
echo > ai-workstation\.gitignore

echo # Node.js
echo node_modules/
echo .env
echo *.log
echo > n8n-workflows\.gitignore

echo # General
echo .DS_Store
echo Thumbs.db
echo > projects\.gitignore
echo > tools\.gitignore

:: Create README files
echo Creating README files...
echo # AI Workstation > ai-workstation\README.md
echo # n8n Workflows > n8n-workflows\README.md
echo # Projects > projects\README.md
echo # Tools > tools\README.md

echo Git structure setup complete!
echo Directory structure:
echo C:\development
echo ├── ai-workstation
echo ├── n8n-workflows
echo ├── projects
echo └── tools
pause 