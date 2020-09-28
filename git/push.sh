#!/bin/bash
logPath="../log/$(date "+%Y.%m.%d").txt"
echo -e "\e[1;42mGreed Background\e[0m"
echo "-------------------------$(date "+%H:%M:%S")-----------------------------------" >> ${logPath}
echo "执行的命令：" >> ${logPath}
git add -A
if [ $? -eq 0 ]; then
    echo -e "\e[1;42mgit add -A \e[0m" >> ${logPath}
    git commit -m "$1"
    if [ $? -eq 0 ]; then
        echo -e "\e[1;42mgit commit -m \"$1\"\e[0m" >> ${logPath}
        git push
        if [ $? -eq 0 ]; then
            echo "\e[1;42mgit push \e[0m" >> ${logPath}
        else
            echo "\e[31;42merror:$? \e[0m" >> ${logPath}
        fi
    else
        echo "\e[31;42merror:$? \e[0m" >> ${logPath}
    fi
else
 echo "\e[31;42merror:$? \e[0m" >> ${logPath}
fi
echo "--------------------------end---------------------------------------" >> ${logPath}