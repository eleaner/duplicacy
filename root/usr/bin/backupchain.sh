#!/command/with-contenv bash

exitcode=0

backup.sh
exitcode=$?

if [[ $PRUNE_ADD == "yes" ]] || [[ $PRUNE_ADD == "YES" ]]; then
    if [[ "${PRUNE_CRON}" == "" ]] && [[ $exitcode -eq 0 ]]; then
        prune.sh
        exitcode=$?
    fi
fi

if [[ $CHECK_ADD == "yes" ]] || [[ $CHECK_ADD == "YES" ]]; then
    if [[ "${CHECK_CRON}" == "" ]] && [[ $exitcode -eq 0 ]]; then
    	echo check.sh
        check.sh
        exitcode=$?
    fi
fi

exit $exitcode
