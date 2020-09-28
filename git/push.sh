#!/bin/bash
echo "git push start"
git add -A
if [ $? -eq 0 ]; then
    echo "git add success" > ../log/$(date "+%Y.%m.%d")/$(date).txt
    git commit -m "$1"
    if [ $? -eq 0 ]; then
        echo "git commit success"
        git push
        if [ $? -eq 0 ]; then
            echo "git push success"
        else
            echo "$?"
        fi
    else
        echo "$?"
    fi
else
    echo "$?"
fi