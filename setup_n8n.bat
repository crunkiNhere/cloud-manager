@echo off
echo Setting up n8n...

:: Check Node.js version
node --version
if errorlevel 1 (
    echo Node.js is not installed. Please install Node.js 18 or later.
    pause
    exit /b 1
)

:: Check npm version
npm --version
if errorlevel 1 (
    echo npm is not installed. Please install npm 9 or later.
    pause
    exit /b 1
)

:: Create n8n directory
echo Creating n8n directory...
mkdir n8n
cd n8n

:: Install n8n
echo Installing n8n...
npm install n8n

:: Create n8n configuration
echo Creating n8n configuration...
echo {
echo   "database": {
echo     "type": "sqlite",
echo     "database": "n8n.db"
echo   },
echo   "security": {
echo     "jwtSecret": "your-secret-key"
echo   }
echo } > config.json

:: Create start script
echo Creating start script...
echo @echo off > start_n8n.bat
echo cd %~dp0 >> start_n8n.bat
echo npx n8n >> start_n8n.bat

echo n8n setup complete!
echo To start n8n, run: n8n\start_n8n.bat
pause 