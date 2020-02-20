#!/bin/bash -l

set -e # Abort script at first error
set -u # nounset - Attempt to use undefined variable outputs error message, and forces an exit
# set -x # verbose (expands commands)

echo "GITHUB_EVENT_NAME: ${GITHUB_EVENT_NAME}"
echo "GITHUB_SHA:        ${GITHUB_SHA}"
echo "GITHUB_REF:        ${GITHUB_REF}"
echo "GITHUB_HEAD_REF:   ${GITHUB_HEAD_REF}"
echo "GITHUB_BASE_REF:   ${GITHUB_BASE_REF}"

cd "$GITHUB_WORKSPACE" && git fetch --quiet

# branch/tag name in the form "refs/<ref-type>/<ref-id>[/<ref-subtype>]"
# ref-type: heads|pull|tags
GITHUB_REF_ID="$(echo $GITHUB_REF | cut -d '/' -f3)"
if [[ "${GITHUB_EVENT_NAME}" == "pull_request" ]] 
then
    GITHUB_REF_PULL_TYPE="$(echo $GITHUB_REF | cut -d '/' -f4)"
    if [[ "${GITHUB_REF_PULL_TYPE}" == "merge" ]]
    then
        # during merge, the head ref is the PR branch name
        GITHUB_REF_ID=${GITHUB_HEAD_REF}
    fi
    gitleaks -v --exclude-forks --redact --threads=1 \
      --branch=$GITHUB_REF_ID \
      --repo-path=$GITHUB_WORKSPACE
else
    # pushed tag or single commit reference
    # run only from current to master instead of full history
    GITHUB_REF_MASTER=$(git show master --pretty=format:"%H")
    gitleaks -v --exclude-forks --redact --threads=1 \
      --branch=$GITHUB_REF_ID \
      --commit-to=$GITHUB_REF_MASTER \
      --repo-path=$GITHUB_WORKSPACE
fi

