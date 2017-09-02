#!/bin/sh
set -e

#echo "`date` started $0 with  $@" >> /tmp/tomsoft.debug1

if [ "$1" != "configure" ]; then
	exit 0
fi

chmod 1777 /var/spool/nagios-local-multi
invoke-rc.d nagios-nrpe-server restart || exit $?

exit 0
