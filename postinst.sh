#!/bin/sh
set -e

#echo "`date` started $0 with  $@" >> /tmp/tomsoft.debug1

rm -f /var/spool/nagios-local-multi/* 2> /dev/null || true
rm -f /var/lib/apt/periodic/update-stamp /var/lib/apt/periodic/update-success-stamp || true

if [ "$1" != "configure" ]; then
	exit 0
fi


chmod 1777 /var/spool/nagios-local-multi
invoke-rc.d nagios-nrpe-server force-reload || exit $?

exit 0
