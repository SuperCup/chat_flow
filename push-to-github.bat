@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo [1/6] Checking git...
git --version
if errorlevel 1 (
    echo Error: git not found. Please install Git for Windows.
    pause
    exit /b 1
)

if not exist .git (
    echo [2/6] Initializing git repository...
    git init
) else (
    echo [2/6] Git already initialized.
)

echo [3/6] Setting remote origin...
git remote remove origin 2>nul
git remote add origin https://github.com/SuperCup/chat_flow.git

echo [4/6] Adding files...
git add .

echo [5/6] Committing...
git commit -m "Initial commit: Vite + React category insight chat UI with Tailwind" 2>nul
if errorlevel 1 (
    echo No changes to commit, or already committed.
) else (
    echo Commit created.
)

echo [6/6] Pushing to main...
git branch -M main
git push -u origin main

if errorlevel 1 (
    echo.
    echo Push failed. If GitHub asks for password, use a Personal Access Token instead.
    echo Create one at: https://github.com/settings/tokens
) else (
    echo.
    echo Done. Code pushed to https://github.com/SuperCup/chat_flow
)

pause
