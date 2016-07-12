#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
jekyll build

# echo blessing.com > _site/CNAME

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin develop
git subtree push --prefix=_site git@github.com:blessingokpala/blessingokpala.com.git master
