#!/bin/bash

RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[94m"
GREEN="\033[32m"
NO_COLOR="\033[0m"

CWD="$(pwd)"
echo "pwd=$CWD"
# Create the repo
cd /tmp
reponame=$(date +gitlint-test-%Y-%m-%d_%H-%M-%S)
git init $reponame
cd $reponame

# Do some basic config
git config user.name gitlint-test-user
git config user.email gitlint@test.com
git config core.quotePath false
git config core.precomposeunicde true

# Add a test commit
echo "test 123" > test.txt
git add test.txt
# commit -m -> use multiple -m args to add multiple paragraphs (/n in strings are ignored)
git commit -m "test commit title" -m "test commit body that has a bit more text"
cd $CWD

# Let the user know
echo ""
echo -e "Created $GREEN/tmp/${reponame}$NO_COLOR"
echo "Hit key up to access 'cd /tmp/$reponame'"
echo "(Run this script using 'source' for this to work)"
history -s "cd /tmp/$reponame"
