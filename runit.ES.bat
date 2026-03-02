@echo off
setlocal

node -v >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Node.js לא נמצא! מוריד ומתקין Node LTS...
    
    set NODE_URL=https://nodejs.org/dist/v20.8.1/node-v20.8.1-x64.msi
    set NODE_INSTALLER=%TEMP%\node-lts.msi

    echo מוריד Node.js...
    powershell -Command "Invoke-WebRequest -Uri %NODE_URL% -OutFile %NODE_INSTALLER%"
    
    echo מתקין Node.js...
    msiexec /i %NODE_INSTALLER% /quiet /norestart
    
    echo Node.js הותקן.
) ELSE (
    echo Node.js כבר מותקן.
)

echo מתקין ESLint גלובלי...
npm install -g eslint

set ESLINT_CONFIG_URL=https://example.com/eslint.config.mjs
set ESLINT_GLOBAL_DIR=%APPDATA%\npm\node_modules\eslint

echo מוריד קובץ ESLint config מ-URL...
powershell -Command "Invoke-WebRequest -Uri %ESLINT_CONFIG_URL% -OutFile '%ESLINT_GLOBAL_DIR%\eslint.config.mjs'"

echo סיום ההתקנה.
pause
