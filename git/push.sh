#!/bin/bash
logPath="$(dirname $(pwd))/log/$(date "+%Y-%m-%d").txt"
echo "-------------------------master分支直接提交($(date "+%H:%M:%S"))-----------------------------------" >> ${logPath}
echo "执行的命令：" >> ${logPath}
git add -A 2>> ${logPath}
if [ $? -eq 0 ]; then
  git commit -m "$1" 2>> ${logPath}
  if [ $? -eq 0 ]; then
      git push 2>> ${logPath}
      if [ $? -ne 0 ]; then
         echo -e "\033[31m git push错误 \033[0m"
         echo "git push错误" >> ${logPath}
      fi
  else
      echo -e "\033[31m git commit -m \"$1\"错误 \033[0m"
      echo git commit -m \"$1\"错误 >> ${logPath}
  fi
else
   echo -e "\033[31m git add错误 \033[0m"
   echo git add错误 >> ${logPath}
fi
echo "--------------------------end---------------------------------------------------------" >> ${logPath}