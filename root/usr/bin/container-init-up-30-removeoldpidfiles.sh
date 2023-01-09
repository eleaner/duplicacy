#!/command/with-contenv bash

backup_pid_file=/var/run/duplicacy_backup.pid
prune_pid_file=/var/run/duplicacy_prune.pid
check_pid_file=/var/run/duplicacy_check.pid

if [ -f ${backup_pid_file} ]; then
    echo Unfinished backup task found. Removing backup pid file, ${backup_pid_file}
    rm "${backup_pid_file}"
fi

if [ -f ${prune_pid_file} ]; then
    echo Unfinished prune task found. Removing prune pid file, ${prune_pid_file}
    rm "${prune_pid_file}"
fi

if [ -f ${check_pid_file} ]; then
    echo Unfinished check task found. Removing check pid file, ${check_pid_file}
    rm "${check_pid_file}"
fi

exit 0
