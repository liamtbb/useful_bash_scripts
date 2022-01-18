## Bash script to keep program active
### uses parent process instead of PID
### ex. iperf3 -s

#!/bin/bash

until /usr/bin/iperf3 -s; do
    echo "Server 'iperf3' crashed with exit code $?.  Respawning.." >&2
    sleep 1
done
