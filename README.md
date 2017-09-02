This nagios check is intended to be run via NRPE on client computer

It will check /var/spool/nagios-local-multi/ for any visible non-zero-length files
containing any output not starting with "OK:", and report them as errors to nagios.

Regexp for OK/CRITICAL can be defined per-file basis in /etc/nagios/local-multi.conf

Examples for use:

- simply redirect your cron output to file /var/spool/nagios-local-multi/cron
  and you'll get nagios alerts instead of emails

- avoid creating a bunch of checks on nagios server for every little thing:
  just make a quick /etc/cron.daily/something script which writes error output 
  to /var/spool/nagios-local-multi/something (it can be as simple as adding at the 
  top of shell script with "set -e; exec 2> /var/spool/nagios-local-multi/something")

- some scripts are included by default as example (like debian apt(8) check and cron staleness check)

- example /etc/cron.daily/zimbra_running
  sudo -u zimbra zmcontrol status | grep -v Running > /var/spool/nagios-local-multi/zimbra_running
- example /etc/cron.hourly/ganeti_sanity
  gnt-cluster verify | egrep 'ERROR|WARNING|NOTICE' > /var/spool/nagios-local-multi/ganeti_sanity

Best feature: you only add the check via NRPE once to your nagios server, and all other scripts are only 
quickly created on client.

License: GPLv3 or higher, Matija Nalis <mnalis-debian@axe.tomsoft.hr>, started 2017-09-02
