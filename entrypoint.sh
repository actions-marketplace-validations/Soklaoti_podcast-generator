#!/bin/bash

echo "====================="

#to allow to use git
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"

#to run workflow
git config --global --add safe.directory /github/workspace

#to run feed.py in docker container, we said python3 because we install python v3
python3 /usr/bin/feed.py

#push back main branch
git add -A && git commit -m "Update Feed"
git push --set-upstream origin main

echo "====================="


#command to update  entrypoint.sh permission
#chmod -R 775 entrypoint.sh