@echo off
REM Quick Start Script for Swift Cab Development
REM This script starts both backend and frontend servers

echo.
echo ========================================
echo   Swift Cab - Development Start Script
echo ========================================
echo.

REM Get the directory where this script is located
cd /d "%~dp0swiftcab-fullstack"

REM Check if node_modules exist in backend
if not exist "backend\node_modules" (
    echo Installing backend dependencies...
    cd backend
    call npm install
    cd..
)

REM Check if node_modules exist in frontend
if not exist "frontend\node_modules" (
    echo Installing frontend dependencies...
    cd frontend
    call npm install
    cd..
)

REM Verify .env files exist
if not exist "backend\.env" (
    echo.
    echo WARNING: backend\.env file not found!
    echo Please create it with MongoDB URI first.
    echo.
    pause
    exit /b 1
)

echo.
echo ✓ Dependencies installed
echo.
echo Starting servers...
echo   - Backend: http://localhost:5000
echo   - Frontend: http://localhost:3000
echo.
echo Note: Press Ctrl+C to stop servers
echo.

REM Start backend in a new window
start "Swift Cab - Backend" cmd /k "cd backend && npm run dev"

REM Wait a bit for backend to start
timeout /t 2 /nobreak

REM Start frontend in a new window
start "Swift Cab - Frontend" cmd /k "cd frontend && npm start"

echo.
echo ✓ Servers started in separate windows
echo ✓ Frontend will open in your browser shortly (http://localhost:3000)
echo.
echo To stop the servers, close the terminal windows or press Ctrl+C
