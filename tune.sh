#!/bin/bash

if [ -d /Library/WowzaStreamingEngine ]
then
	# OS X
	. /Library/WowzaStreamingEngine/bin/setenv.sh
else
	# Linux
	. /usr/local/WowzaStreamingEngine-4.7.5_01/bin/setenv.sh
fi

mode=standalone
if [ "$#" -eq 1 ];
then
mode=$1
fi

$_EXECJAVA -Dcom.wowza.wms.runmode="$mode" -Dcom.wowza.wms.native.base="linux" -Dcom.wowza.wms.AppHome="$WMSAPP_HOME" -Dcom.wowza.wms.ConfigURL="$WMSCONFIG_URL" -Dcom.wowza.wms.ConfigHome="$WMSCONFIG_HOME" -cp $WMSAPP_HOME/bin/wms-bootstrap.jar com.wowza.wms.bootstrap.Bootstrap outputTuningCommandLine
