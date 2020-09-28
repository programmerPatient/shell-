#!/bin/bash
logPath="../log/$(date "+%Y.%m.%d").txt"
sed "git push start" >> ${logPath}
git add -A
if [ $? -eq 0 ]; then
    git commit -m "$1"
    if [ $? -eq 0 ]; then
        git push
        if [ $? -ne 0 ]; then
            sed $? >> ${logPath}
        fi
    else
        sed $? >> ${logPath}
    fi
else
    sed $? >> ${logPath}
fi
sed "git push end" >> ${logPath}