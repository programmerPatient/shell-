#!/bin/bash
echo "git push start"
git add -A
if [ $? -eq 0 ]; then
    echo "success"
else
    echo "$?"
fi