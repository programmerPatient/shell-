#!/bin/bash
logPath="$(dirname $(pwd))/log/$(date "+%Y-%m-%d").txt"
echo "-------------------------master分支直接提交($(date "+%H:%M:%S"))-----------------------------------" >> ${logPath}
echo "执行的命令：" >> ${logPath}
git add -A >> ${logPath}  2>&1
if [ $? -eq 0 ]; then
  echo "git add -A" >> ${logPath}
  git commit -m "$1" >> ${logPath}  2>&1
  if [ $? -eq 0 ]; then
      echo "git commit -m \"$1\"" >> ${logPath}
      git push >> ${logPath}  2>&1
      if [ $? -eq 0 ]; then
          echo "git push" >> ${logPath}
      else
          cmd >> ${logPath}
      fi
  else
      cmd >> ${logPath}
  fi
else
  cmd >> ${logPath}
fi
echo "--------------------------end---------------------------------------------------------" >> ${logPath}