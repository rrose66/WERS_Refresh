@echo off
@rem This batch file is for the execution of the SplitChangeObjectsFile class
@rem which will parse/split the BOMJson_ChangeObjects.json File into multiple
@rem files of size 1GB.
@rem
@rem For reference/lookup, each object node will be mapped to the output file
@rem found in the BOMJson_ChangeObjects_MappedObjects.json file.

@rem modify the following variables accordingly to your needs:
@rem 	JAVA_HOME & CMD_LINE_ARGS

@rem #################################################################################
@rem Commandline args / Usage:
@rem -f the path/filename of the BOMJson_ChangeObjects.json file

@rem -o the path/filename of the output directory, this directory must
@rem	exist or the process will fail.

@rem -filesize the (approximately) max file size for each of the output files in bytes,
@rem	default is 1GB = 1073741824 (500MB = 536870912)

@rem #################################################################################

set CMD_LINE_ARGS=-f ..\..\..\data\BOMJson_ChangeObjects.json -o ChangeObjects

@rem #################################################################################

if not defined JAVA_HOME set JAVA_HOME=C:\Program Files\Java\jre8

if not defined CMD_LINE_ARGS goto fail

set LIB_DIR=.\lib
set CLASSPATH=.;%LIB_DIR%;%LIB_DIR%\CatalystAnalysisTools-1.2.0.jar
set JAR_CLASS=io.SplitChangeObjectsFile

"%JAVA_HOME%\bin\java" -Xms1024m -Xmx2048m -cp %CLASSPATH% %JAR_CLASS% %CMD_LINE_ARGS%

goto done

:fail
	echo.
	echo Command line args not defined: "%CMD_LINE_ARGS%"
	echo.
	
:done
	@rem keep the cmd window open
	cmd /k
