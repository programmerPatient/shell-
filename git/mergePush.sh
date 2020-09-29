#!/bin/bash
echo "-------------------------master分支直接提交($(date "+%H:%M:%S"))-----------------------------------" >> ${logPath}
logPath="$(dirname $(pwd))/log/$(date "+%Y-%m-%d").log"
git add . 2>> ${logPath}
if [ $? -eq 0 ]; then
    git commit -m "$1" 2>>${logPath}
    if [ $? -eq 0 ]; then
        git checkout master 2>> ${logPath}
        if [ $? -eq 0 ]; then
            git pull 2>> ${logPath}
            if [ $? -eq 0 ]; then
                git merge marry 2>> ${logPath}
                if [ $? -eq 0 ]; then
                    git push 2>> ${logPath}
                    if [ $? -eq 0 ]; then
                        git checkout marry 2>>${logPath}
                        if [ $? -eq 0 ]; then
                            echo "提交成功 成功切回marry分支"
                        else
                            echo "error : git check marry  切回marry分支失败"
                            echo "error : git check marry  切回marry分支失败" >> ${logPath}
                        fi
                    else
                      echo "error : git push  合并marry分支后的代码提交失败"
                      echo "error : git push  合并marry分支后的代码提交失败" >> ${logPath}
                    fi
                else
                   echo "error : git merge marry 合并分支失败"
                   echo "error : git merge marry 合并分支失败" >> ${logPath}
                fi
            else
                echo "error : git pull 拉取代码失败"
                echo "error : git pull 拉取代码失败" >> ${logPath}
            fi
        else
            echo "error : git checkout master 切换分支失败"
            echo "error : git checkout master 切换分支失败" >> ${logPath}
        fi
    else
         echo "error : git commit -m \"$1\""
         echo "error : git commit -m \"$1\" 失败" >> ${logPath}
    fi
else
    echo "error : git add ."
    echo "error : git add .  提交新文件(new)和被修改(modified)文件，不包括被删除(deleted)文件 失败" >> ${logPath}
fi
echo "--------------------------end---------------------------------------------------------" >> ${logPath}

