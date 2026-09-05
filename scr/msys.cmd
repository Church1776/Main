@echo off
SetLocal EnableDelayedExpansion

rem Determine the root directory of MSYS2 based on the Windows directory
set "msys_root=%WINDIR:windows=msys64%"

rem Get the escape character for colored output
for /f %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"

rem Pre written codes for color output
set "ClrBold=%ESC%[1m"
set "ClrDim=%ESC%[2m"
set "ClrUnderline=%ESC%[4m"
set "ClrRed=%ESC%[31m"
set "ClrYellow=%ESC%[33m"
set "ClrGreen=%ESC%[32m"
set "ClrReset=%ESC%[0m"

goto main

:version_message
  for /f "delims=" %%v in ('%msys_root%\msys2_shell.cmd -defterm -no-start -c "pacman -Q msys2-runtime"') do set "msys_version=%%v"
  set "msys_version=%msys_version:msys2-runtime =%"
  echo Minimal System 2 %ClrBold%(MSYS2):%ClrReset%
  echo Runtime Version: %ClrBold%%ClrGreen%%msys_version%%ClrReset%
  exit

:help_message
  echo.
  echo Usage:
  echo   msys [-e] ^<environment^> [-s] ^<shell^>
  echo   msys -e mingw64 -s bash
  echo   msys -c [ls^|^"ls -la^"]
  echo.
  echo Qualifiers:           Options:                        Description:
  echo.
  echo   -c^|--command        "ls mydir/"                     Run MSYS2 shell command and exit
  echo   -d^|--directory      C:\starting\dir                 Set the MSYS2 working directory
  echo.
  echo   -e^|--environment    clang64, clangarm64, mingw32,   Set the MSYS2 environment
  echo                       mingw64, ucrt64, msys
  echo.
  echo   -f^|--fork           true^|false                      Start MSYS2 in a new window
  echo   -h^|--help           ---                             Display this help message
  echo   -p^|--paths          inherit^|override                Set MSYS2 PATH to inherit or override system PATH.
  echo   -s^|--shell          bash, zsh, fish                 Set the login shell
  echo   -t^|--terminal       mintty, defterm, conemu         Set the terminal emulator
  echo   -v^|--version        ---                             Display the version of this script
  echo.
  exit /b 0

:error_message
  set "argtype=%~1"
  set "errtype=%~2"

  if "%errtype%"=="Multiple Arguments" (
    set "errmsg=Multiple %argtype% options specified. Aborting."
  ) else if "%errtype%"=="Invalid Option" (
    set "errmsg=Invalid %argtype% option specified. Aborting."
  ) else (
    set "errmsg=An error occurred with the %argtype% option. Aborting."
  )
  echo %ClrRed%Error:%ClrReset% When passing argument type '%argtype%': %errmsg%
  echo Use %ClrYellow%msys%ClrReset% %ClrDim%--help%ClrReset% for more information.
  exit /b 1

:conemudetect
  exit /b 2

:main

  set "c_arg=0"
  set "command="
  set "d_arg=0"
  set "directory="
  set "e_arg=0"
  set "environment="
  set "f_arg=0"
  set "fork="
  set "p_arg=0"
  set "paths="
  set "s_arg=0"
  set "shell="
  set "t_arg=0"
  set "terminal="

  :loop

    if "%~1"=="" goto shell_command

    if "%~1"=="-c" (
      if not %c_arg%==1 (
        set "c_arg=1"
        set "command=%~2"
        shift
      ) else (
        call :error_message "command" "Multiple Arguments"
        exit /b 1
      )
    )
    if "%~1"=="--command" (
      if not %c_arg%==1 (
        set "c_arg=1"
        set "command=%~2"
        shift
      ) else (
        call :error_message "command" "Multiple Arguments"
        exit /b 1
      )
    )
    if "%~1"=="-e" (
      if not %e_arg%==1 (
        set "e_arg=1"
        set "environment=%~2"
        shift
      ) else (
        call :error_message "environment" "Multiple Arguments"
        exit /b 1
      )
    )
    if "%~1"=="--environment" (
      if not %e_arg%==1 (
        set "e_arg=1"
        set "environment=%~2"
        shift
      ) else (
        call :error_message "environment" "Multiple Arguments"
        exit /b 1
      )
    )
    if "%~1"=="-f" (
      if not %f_arg%==1 (
        set "f_arg=1"
        set "fork=%~2"
        shift
      ) else (
        call :error_message "fork" "Multiple Arguments"
        exit /b 1
      )
    )
    if "%~1"=="--fork" (
      if not %f_arg%==1 (
        set "f_arg=1"
        set "fork=%~2"
        shift
      ) else (
        call :error_message "fork" "Multiple Arguments"
        exit /b 1
      )
    )
    if "%~1"=="-h" (
      goto help_message
    )
    if "%~1"=="--help" (
      goto help_message
    )
    if "%~1"=="-p" (
      if not %p_arg%==1 (
        set "p_arg=1"
        set "paths=%~2"
        shift
      ) else (
        call :error_message "paths" "Multiple Arguments"
        exit /b 1
      )
    )
    if "%~1"=="--paths" (
      if not %p_arg%==1 (
        set "p_arg=1"
        set "paths=%~2"
        shift
      ) else (
        call :error_message "paths" "Multiple Arguments"
        exit /b 1
      )
    )
    if "%~1"=="-s" (
      if not %s_arg%==1 (
        set "s_arg=1"
        set "shell=%~2"
        shift
      ) else (
        call :error_message "shell" "Multiple Arguments"
        exit /b 1
      )
    )
    if "%~1"=="--shell" (
      if not %s_arg%==1 (
        set "s_arg=1"
        set "shell=%~2"
        shift
      ) else (
        call :error_message "shell" "Multiple Arguments"
        exit /b 1
      )
    )
    if "%~1"=="-t" (
      if not %t_arg%==1 (
        set "t_arg=1"
        set "terminal=%~2"
        shift
      ) else (
        call :error_message "terminal" "Multiple Arguments"
        exit /b 1
      )
    )
    if "%~1"=="--terminal" (
      if not %t_arg%==1 (
        set "t_arg=1"
        set "terminal=%~2"
        shift
      ) else (
        call :error_message "terminal" "Multiple Arguments"
        exit /b 1
      )
    )
    if "%~1"=="-v" (
      goto version_message
    )
    if "%~1"=="--version" (
      goto version_message
    )
    shift
    goto loop

  :shell_command

    if not "%command%"=="" (
      set "command=-c %command%"
    ) else (
      set "command="
    )
    if not "%directory%"=="" (
      if exist "%directory%\" (
        pushd "%directory%"
        set "directory=-where %CD%"
        popd
      ) else (
        echo Directory "%directory%" does not exist. Defaulting to current directory.
        set "directory=-here"
      )
    ) else (
      set "directory=-here"
    )
    if not "%environment%"=="" (
      set "environment=-%environment%"
    ) else (
      set "environment=-msys"
    )
    if not "%fork%"=="" (
      if "%fork%"=="true" (
        set "fork=-no-start"
      ) else if "%fork%"=="false" (
        set "fork="
      ) else (
        echo Invalid fork option "%fork%". Use "true" or "false". Defaulting to "false".
        set "fork=-no-start"
      )
    ) else (
      set "fork=-no-start"
    )
    if not "%paths%"=="" (
      if not "%paths%"=="override" (
        if not "%paths%"=="inherit" (
          echo Invalid paths option "%paths%". Use "inherit" or "override". Defaulting to "inherit".
          set "paths=-use-full-path"
        ) else (
          set "paths=-use-full-path"
        )
      ) else (
        set "paths="
      )
    ) else (
      set "paths=-use-full-path"
    )
    if not "%shell%"=="" (
      set "shell=-shell %shell%"
    ) else (
      set "shell="
    )
    if not "%terminal%"=="" (
      if not "%terminal%"=="conemu" (
        if not "%terminal%"=="mintty" (
          if not "%terminal%"=="defterm" (
            echo Invalid terminal option "%terminal%". Use "mintty", "defterm", or "conemu". Defaulting to "defterm".
            set "terminal=defterm"
          )
        )
      ) else (
        call :conemudetect
        if errorlevel 2 (
          echo ConEmu not detected. Defaulting to "defterm".
          set "terminal=defterm"
        )
      )
      set "terminal=-!terminal!"
    ) else (
      set "terminal=-defterm"
    )

    set "ClrBold="
    set "ClrDim="
    set "ClrUnderline="
    set "ClrRed="
    set "ClrYellow="
    set "ClrGreen="
    set "ClrReset="
    set "c_arg="
    set "d_arg="
    set "e_arg="
    set "f_arg="
    set "p_arg="
    set "s_arg="
    set "t_arg="

    rem echo Starting MSYS2 shell with the following options:
    rem echo %msys_root%\msys2_shell.cmd %terminal% %fork% %paths% %environment% %directory% %shell% %command%
    %msys_root%\msys2_shell.cmd %terminal% %fork% %paths% %environment% %directory% %shell% %command%