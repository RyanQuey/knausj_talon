#!/bin/bash -x

# pulls in changes made to upstream fork (https://github.com/talonhub/community) and merges that into my personal fork and personal branch within my fork

# 1) merge into origin/ryan-quey-personal
git checkout ryan-quey-personal && \
git pull && \
git push && \

# 2) if not exists, then it creates it. If exists, just errors out, and you can keep going.
git remote add upstream git@github.com:talonhub/community.git

echo "already exists, and errors out? That's ok! Then don't need to make new remote. Just keep going to next step"

echo "==== Now merge in remote changes in upstream fork: ====" && \
git checkout main
git pull && \
# cleaner than pull, though pull is ok. Rebase is cleaner though since I never touch my own main branch.
git rebase upstream/main && \
# if not already there...
git checkout ryan-quey-personal && \
git merge main && \
echo "push back to origin/ryan-quey-personal"
git push

