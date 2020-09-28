#!/bin/bash
echo "git push start"
echo $(date "+%Y.%m.%d")
logPath="../log/$(date "+%Y.%m.%d").txt"
git add -A
if [ $? -eq 0 ]; then
    echo "git add success" > ${logPath}
    git commit -m "$1"
    if [ $? -eq 0 ]; then
        echo "git commit success" > ${logPath}
        git push
        if [ $? -eq 0 ]; then
            echo "git push success" > ${logPath}
        else
            echo $? > ${logPath}
        fi
    else
        echo $? > ${logPath}
    fi
else
    echo $? > ${logPath}
fi