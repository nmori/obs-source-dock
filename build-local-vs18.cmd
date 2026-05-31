@echo off
setlocal

set "CMAKE_EXE=C:\Program Files\Microsoft Visual Studio\18\Professional\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe"
set "WINDOWS_SDK_VER=10.0.26100.0"

pushd "%~dp0"
if errorlevel 1 exit /b 1

set "SRC_DIR=%CD%"
set "BUILD_DIR=%CD%\build_vs18"

"%CMAKE_EXE%" -S "%SRC_DIR%" -B "%BUILD_DIR%" -G "Visual Studio 18 2026" -A x64 -DCMAKE_SYSTEM_VERSION="%WINDOWS_SDK_VER%"
if errorlevel 1 (
  popd
  exit /b 1
)

"%CMAKE_EXE%" --build "%BUILD_DIR%" --config RelWithDebInfo --parallel 8
set "ERR=%errorlevel%"
popd
exit /b %ERR%
