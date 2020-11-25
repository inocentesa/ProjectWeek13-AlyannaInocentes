# see "man logrotate" for details
	# rotate log files weekly
	weekly

	# use the syslog group by default, since this is the owning group
	# of /var/log/syslog.
	su root syslog

	# keep 7 weeks worth of backlogs
	rotate 7

	# create new (empty) log files after rotating old ones
	create

	# Do not rotate empty logs
	notifempty

	# uncomment this if you want your log files compressed
	#compress
	delaycompress

	# packages drop log rotation information into this directory
	include /etc/logrotate.d

	# no packages own wtmp, or btmp -- we'll rotate them here
	/var/log/wtmp {
    	    missingok
    	    monthly
    	    create 0664 root utmp
    	    rotate 1
	}

	/var/log/btmp {
    	    missingok
    	    monthly
    	    create 0660 root utmp
    	    rotate 1
	}



	# system-specific logs may be configured here
	/var/log/auth.log {
    	    weekly
    	    rotate 7
    	    notifempty
    	    delaycompress
    	    missingok
    	    endscript
	}


---
