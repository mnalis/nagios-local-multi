all:
	equivs-build nagios-local-multi.control

check:
	perl -wTc local-multi
	lintian --fail-on-warnings --info `ls -1t *deb | head -n 1`

publish:  all check
	reprepro includedeb wheezy `ls -1t *deb | head -n 1`
	git commit -a
	git push
