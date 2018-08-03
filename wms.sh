#!/bin/bash

# NOTE: Here you can configure the JVM's built in JMX interface.
# See the "Server Management Console and Monitoring" chapter
# of the "User's Guide" for more information on how to configure the
# remote JMX interface in the [install-dir]/conf/Server.xml file.

JMXOPTIONS=-Dcom.sun.management.jmxremote=true
#JMXOPTIONS="$JMXOPTIONS -Dcom.sun.management.jmxremote.port=1099"
#JMXOPTIONS="$JMXOPTIONS -Dcom.sun.management.jmxremote.authenticate=true"
#JMXOPTIONS="$JMXOPTIONS -Dcom.sun.management.jmxremote.ssl=false"
#JMXOPTIONS="$JMXOPTIONS -Dcom.sun.management.jmxremote.password.file=$WMSCONFIG_HOME/conf/jmxremote.password"
#JMXOPTIONS="$JMXOPTIONS -Dcom.sun.management.jmxremote.access.file=$WMSCONFIG_HOME/conf/jmxremote.access"
#JMXOPTIONS="$JMXOPTIONS -Djava.rmi.server.hostname=192.168.1.7"

CloudPlatformFlag=0

if [ "$WMSCOMMAND" != "start" ]; then
        JMXOPTIONS=""
fi

ulimit -n 64000

rc=144
while [ $rc -eq 144 ]
do

WMSTUNE_OPTS=`/usr/local/WowzaStreamingEngine-4.7.5_01/bin/tune.sh $mode`
export LD_PRELOAD=`/usr/local/WowzaStreamingEngine-4.7.5_01/bin/ldpreload.sh`

# log interceptor com.wowza.wms.logging.LogNotify - see Javadocs for ILogNotify
if [[ 1 == $CloudPlatformFlag ]]; then
	$_EXECJAVA $WMSTUNE_OPTS $JMXOPTIONS -Dfile.encoding="UTF-8" -Dcom.wowza.wms.runmode="service" -Dcom.wowza.wms.native.base="linux" -Dcom.wowza.wms.AppHome="$WMSAPP_HOME" -Dcom.wowza.wms.ConfigURL="$WMSCONFIG_URL" -Dcom.wowza.wms.ConfigHome="$WMSCONFIG_HOME" -cp $WMSAPP_HOME/bin/wms-bootstrap.jar com.wowza.wms.bootstrap.Bootstrap $WMSCOMMAND > /dev/null 2>&1  &
else
	$_EXECJAVA $WMSTUNE_OPTS $JMXOPTIONS -Dcom.wowza.wms.runmode="service" -Dcom.wowza.wms.native.base="linux" -Dcom.wowza.wms.AppHome="$WMSAPP_HOME" -Dcom.wowza.wms.ConfigURL="$WMSCONFIG_URL" -Dcom.wowza.wms.ConfigHome="$WMSCONFIG_HOME" -cp $WMSAPP_HOME/bin/wms-bootstrap.jar com.wowza.wms.bootstrap.Bootstrap $WMSCOMMAND > /dev/null 2>&1  &
fi

PID=$!

if [ "$WMSCOMMAND" = "start" ]; then
echo $! > ${WMSPIDFILE}
wait $PID
fi

rc=$?

if [ $rc -ge 10 ] && [ $rc -le 15 ] ; then
	WSE_EXIT_CODE=$rc
	$_EXECJAVA $WMSTUNE_OPTS $JMXOPTIONS -Dfile.encoding="UTF-8" -Dcom.wowza.wms.runmode="service" -Dcom.wowza.wms.native.base="linux" -Dcom.wowza.wms.AppHome="$WMSAPP_HOME" -Dcom.wowza.wms.ConfigURL="$WMSCONFIG_URL" -Dcom.wowza.wms.ConfigHome="$WMSCONFIG_HOME" -cp $WMSAPP_HOME/bin/wms-bootstrap.jar com.wowza.wms.bootstrap.Bootstrap startLicenseUpdateServer > /dev/null 2>&1  &
	echo $! > ${WMSPIDFILE}
	wait $!
	rc=$?
fi

done

if [ "$WMSCOMMAND" = "start" ] ; then
WMSBASE_NAME=WowzaStreamingEngine-01
WMSLOCK_FILE="/var/run/$WMSBASE_NAME"
if test -w "/var/lock/subsys" ; then
WMSLOCK_FILE="/var/lock/subsys/$WMSBASE_NAME"
fi
echo $WMSLOCK_FILE > /tmp/enc01.txt
rm -f $WMSLOCK_FILE
fi
exit 0
