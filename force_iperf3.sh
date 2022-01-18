## Bash script that:
### 1. checks to see if iperf3 server is running
### 2. runs if iperf3 isn't running, kills and restarts if it is
### 3. checks to see if iperf3 test connection is active, aborts restart if so
### 4. runs iperf3 as daemon so it doesn't exit when user logs off

#!/bin/bash
 
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
 
for i in {1..10}; do
    pid=$(ps ax | grep "iperf3 -s -D" | grep -v grep | awk '{print $1;}')
    if [ "$pid" == "" ]; then
        echo "$0: iperf3 process not found. Starting iperf"
        iperf3 -s -D
        exit 0
    fi
 
    established=$(netstat -tunap | grep $pid/ipe | grep -q ESTABLISHED)
    if [ "$?" == "0" ]; then
        echo "$0: iperf3 pid $pid established. Not restarting iperf process"
    else
        echo "$0: killing iperf3 server with pid: $pid"
        kill -9 $pid
        echo "$0: Restarting iperf3 server and exiting"
        iperf3 -s -D
        break
    fi
    sleep 30
done
 
exit 0
