## Bash script for adding timestamp to cronjob log entries
### Passing an output to this script will prepend a timestamp
### Cron entry example: */5 * * * * root /path/to/command 2>&1 | /path/to/timestamp.sh >> /var/log/iperf_force.log

#!/bin/bash
while read x; do
    echo -n `date +%d/%m/%Y\ %H:%M:%S`;
    echo -n " ";
    echo $x;
done
