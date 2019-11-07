@if "%DEBUG%" == "" @echo off

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

if not defined JAVA_HOME set JAVA_HOME=C:\Program Files\Java\jre8

set CMD_LINE_ARGS=resources\F204528.properties

if not exist "%CMD_LINE_ARGS%" goto fail

@rem ################################################################################################

set LIB_DIR=.\lib
set CLASSPATH=.;%LIB_DIR%;%CLASSPATH%
set JAR_FILE=%LIB_DIR%\F204528-1.1.0.jar
@rem set the config file for loggin to this external file, else it will use the internal file
set LOG4J_CONGIG=-Dlog4j.configurationFile=%LIB_DIR%/log4j2.xml

@rem execute the feature with the path/filename of the properties file (parameters for the process)
"%JAVA_HOME%\bin\java" -Xms1024m -Xmx2048m %LOG4J_CONGIG% -cp %CLASSPATH% -jar %JAR_FILE% %CMD_LINE_ARGS%
goto done

@rem ################################################################################################

:fail
echo.
echo Properties file not found: "%CMD_LINE_ARGS%"
echo.
echo.
@rem ################################################################################################

:done
@rem keep the window open after completion
if "%OS%"=="Windows_NT" endlocal
cmd /k