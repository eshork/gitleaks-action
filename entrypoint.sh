#!/bin/bash -l

set -e # Abort script at first error
set -u # nounset - Attempt to use undefined variable outputs error message, and forces an exit
# set -x # verbose (expands commands)

if [[ "${GITHUB_EVENT_NAME}" == "pull_request" ]] 
then
    # last commit on the PR branch
    REF_NAME=$GITHUB_SHA
else
    # tag name in the form "refs/tags/<tag>"
    REF_NAME="$(echo $GITHUB_REF | cut -d '/' -f3)"
fi
gitleaks -v --exclude-forks --redact --threads=1 \
  --branch=$REF_NAME \
  --repo-path=$GITHUB_WORKSPACE \

