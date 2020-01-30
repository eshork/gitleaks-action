#!/bin/bash -l

set -e # Abort script at first error
set -u # nounset - Attempt to use undefined variable outputs error message, and forces an exit
# set -x # verbose (expands commands)

REF_NAME="$(echo $GITHUB_REF | cut -d '/' -f3)"
gitleaks -v --exclude-forks --redact --threads=1 \
  --branch=$REF_NAME \
  --repo-path=$GITHUB_WORKSPACE \
