#!/bin/bash -l

set -e # Abort script at first error
set -u # nounset - Attempt to use undefined variable outputs error message, and forces an exit
# set -x # verbose (expands commands)

if [[ "${GITHUB_EVENT_NAME}" == "pull_request" ]] 
then
    # from last commit on the PR to source 
    gitleaks -v --exclude-forks --redact --threads=1 \
      --commit-from=$GITHUB_SHA \
      --commit-to=$GITHUB_HEAD_REF \
      --repo-path=$GITHUB_WORKSPACE \
else
    # tag or branch name in the form "refs/tags/<ref>"
    REF_NAME="$(echo $GITHUB_REF | cut -d '/' -f3)"
    gitleaks -v --exclude-forks --redact --threads=1 \
      --branch=$REF_NAME \
      --repo-path=$GITHUB_WORKSPACE \
fi

