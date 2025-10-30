REM Windows Jupyter Lab Server Startup Script
REM Usage: Windows_Start_Jupyter_Server.bat [ROOT_DIR] [MINICONDA_SCRIPTS_DIR] [CONDA_ENV]
REM   ROOT_DIR: Directory to start Jupyter Lab in or default to default values below.
REM   MINICONDA_SCRIPTS_DIR: Path to miniconda Scripts directory or default to default values below.
REM   CONDA_ENV: Conda environment to activate or default to default values below.
REM Example: Windows_Start_Jupyter_Server.bat "C:\my\project" "C:\miniconda3\Scripts" "myenv"

@echo off

REM Set default values
set "DEFAULT_ROOT_DIR=C:\<path>\rag_jupyter_notebook_tutorials"
set "DEFAULT_MINICONDA_SCRIPTS_DIR=C:\Users\<username>\miniconda3\Scripts"
set "DEFAULT_CONDA_ENV=langchain_common_py3.12"

REM Use command line arguments or defaults
if "%~1"=="" (set "ROOT_DIR=%DEFAULT_ROOT_DIR%") else (set "ROOT_DIR=%~1")
if "%~2"=="" (set "MINICONDA_SCRIPTS_DIR=%DEFAULT_MINICONDA_SCRIPTS_DIR%") else (set "MINICONDA_SCRIPTS_DIR=%~2")
if "%~3"=="" (set "CONDA_ENV=%DEFAULT_CONDA_ENV%") else (set "CONDA_ENV=%~3")

cd /d "%ROOT_DIR%"
call "%MINICONDA_SCRIPTS_DIR%\activate.bat" "%CONDA_ENV%"
jupyter lab --no-browser --port=8888 ^
  --ServerApp.token='' --ServerApp.password='' ^
  --ServerApp.disable_check_xsrf=True ^
  --ServerApp.allow_origin='*'
pause
