#!/bin/bash
logPath="../log/$(date "+%Y.%m.%d").txt"
echo "git push start" >> ${logPath}
git add -A
if [ $? -eq 0 ]; then
    git commit -m "$1"
    if [ $? -eq 0 ]; then
        git push
        if [ $? -ne 0 ]; then
            echo $? >> ${logPath}
        fi
    else
        echo $? >> ${logPath}
    fi
else
 echo $? >> ${logPath}
fi
echo "git push end" >> ${logPath}