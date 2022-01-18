# useful_bash_scripts


**force_iperf3:**

Script to start (if inactive) or restart (if active) iperf service, with smart checking to disengage while test connections are running on the server. For use with cron in cases where iperf is failing periodically, e.g. run every 5 minutes to ensure iperf is up.

---

**runloop:**

Script to run any command as child process, and restart it if the child process shuts down unexpectedly.

---

**timestamp:**

Script for prepending any input with the current date and time. To be used for cronjob log entries.
