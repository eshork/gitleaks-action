#!/bin/bash -l

set -e # Abort script at first error
set -u # nounset - Attempt to use undefined variable outputs error message, and forces an exit
# set -x # verbose (expands commands)

gitleaks --verbose --redact --threads=1 \
  --repo-path="$GITHUB_WORKSPACE" \
  --repo-config
