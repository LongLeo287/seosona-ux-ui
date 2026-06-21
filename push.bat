@echo off
echo ==========================================
echo   SEOSONA UX-UI - Quick Push Script
echo ==========================================

:: Check if a commit message was passed as an argument
set COMMIT_MSG=%~1
if "%COMMIT_MSG%"=="" (
    set COMMIT_MSG=Auto-commit update from SEOSONA Quick Push
)

echo.
echo [1/3] Adding files to staging...
git add .

echo.
echo [2/3] Committing with message: "%COMMIT_MSG%"
git commit -m "%COMMIT_MSG%"

echo.
echo [3/3] Pushing to GitHub...
git push

echo.
echo ==========================================
echo   Push Complete!
echo   GitHub Actions will now build and deploy
echo   the showcase to GitHub Pages.
echo ==========================================
pause
