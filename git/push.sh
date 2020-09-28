#!/bin/bash
logPath="../log/$(date "+%Y.%m.%d").txt"
echo "-------------------------$(date "+%H:%i:%s")-----------------------------------" >> ${logPath}
echo "git push start" >> ${logPath}
echo "执行的命令：" >> ${logPath}
git add -A
if [ $? -eq 0 ]; then
    echo "git add -A" >> ${logPath}
    git commit -m "$1"
    if [ $? -eq 0 ]; then
        echo "git commit -m $1" >> ${logPath}
        git push
        if [ $? -eq 0 ]; then
            echo "git push" >> ${logPath}
        else
            echo "error:$?" >> ${logPath}
        fi
    else
        echo "error:$?" >> ${logPath}
    fi
else
 echo "error:$?" >> ${logPath}
fi
echo "git push end" >> ${logPath}
echo "--------------------------end----------------------------------" >> ${logPath}