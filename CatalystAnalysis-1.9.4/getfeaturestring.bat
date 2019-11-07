@echo off
@rem This batch file is for the execution of converting WERS primary/minor features
@rem into the FEDEBOM feature string format.

@rem modify the following variables accordingly to your needs:
@rem 	JAVA_HOME & CMD_LINE_ARGS

@rem #################################################################################

@rem Commandline args / Usage:
@rem -f the path/filename of the list of features to process
@rem 	a csv file containing a list of: primaryFeature,minorFeature,productType all other
@rem	entries will be ignored.

@rem -s the path/filename to save the results in. If not defined, output to the screen only
@rem 	the output will only contain the featureString,primaryFeature,minorFeature,productType

@rem if not using an input file list then a single set of parameters can be passed.
@rem -pf <the WERS primaryFeature> -mf <the WERS minorFeature> -pt <the WERS productType>
@rem	results will be displayed to the screen only

@rem #################################################################################

set CMD_LINE_ARGS=-f resources\inputConvertedFeatureStrings.csv -s wersConvertedFeatureStrings.csv
@rem set CMD_LINE_ARGS=-pf E----------G-- -mf BY1AA BY3AA BYPAL GBVAZ -pt C

@rem #################################################################################

if not defined JAVA_HOME set JAVA_HOME=C:\Program Files\Java\jre8

if not defined CMD_LINE_ARGS goto fail

set LIB_DIR=.\lib
set CLASSPATH=.;%LIB_DIR%;%LIB_DIR%\CatalystAnalysisTools-1.2.0.jar
set JAR_CLASS=util.ConvertWersPrimaryMinorFeaturesToFeatureString

"%JAVA_HOME%\bin\java" -Xms1024m -Xmx2048m -cp %CLASSPATH% %JAR_CLASS% %CMD_LINE_ARGS%

goto done

:fail
	echo.
	echo Command line args not defined: "%CMD_LINE_ARGS%"
	echo.
	
:done
	@rem keep the cmd window open
	cmd /k
