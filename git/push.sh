#!/bin/bash
logDirPath="$(dirname $(pwd))/$(date "+%Y")/$(date "+%m")"
echo ${logDirPath}
if [ ! -d logDirPath ];then
  mkdir logDirPath
else
  echo "文件夹已经存在"
fi
logPath="${logDirPath}/$(date "%d")"
echo "-------------------------$(date "+%H:%M:%S")-----------------------------------" >> ${logPath}
echo "执行的命令：" >> ${logPath}
git add -A
if [ $? -eq 0 ]; then
    echo "git add -A" >> ${logPath}
    git commit -m "$1"
    if [ $? -eq 0 ]; then
        echo "git commit -m \"$1\"" >> ${logPath}
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
echo "--------------------------end---------------------------------------" >> ${logPath}