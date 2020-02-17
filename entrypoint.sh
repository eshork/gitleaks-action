#!/bin/bash -l

set -e # Abort script at first error
set -u # nounset - Attempt to use undefined variable outputs error message, and forces an exit
# set -x # verbose (expands commands)

echo "GITHUB_EVENT_NAME: ${GITHUB_EVENT_NAME}"
echo "GITHUB_SHA:        ${GITHUB_SHA}"
echo "GITHUB_REF:        ${GITHUB_REF}"
echo "GITHUB_HEAD_REF:   ${GITHUB_HEAD_REF}"
echo "GITHUB_BASE_REF:   ${GITHUB_BASE_REF}"

if [[ "${GITHUB_EVENT_NAME}" == "pull_request" ]] 
then
    # branch name in the form "refs/heads/<ref>"
    REF_NAME="$(echo $GITHUB_REF | cut -d '/' -f3)"
    gitleaks -v --exclude-forks --redact --threads=1 \
      --branch=$REF_NAME \
      --repo-path=$GITHUB_WORKSPACE
else
    # pushed tag or single commit reference
    gitleaks -v --exclude-forks --redact --threads=1 \
      --commit=$GITHUB_SHA \ 
      --repo-path=$GITHUB_WORKSPACE
fi

