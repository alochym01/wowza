#!/bin/bash
. /usr/local/WowzaStreamingEngine-4.7.5_01/bin/setenv.sh
WMSCOMMAND=${1}
WMSPIDFILE=${2}
[ -r "${1}" ] && . "${1}"
. /usr/local/WowzaStreamingEngine-4.7.5_01/bin/wms.sh
