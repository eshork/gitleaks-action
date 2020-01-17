#!/bin/bash -l

set -e # Abort script at first error
set -u # nounset - Attempt to use undefined variable outputs error message, and forces an exit
# set -x # verbose (expands commands)

GITLEAKS_REPO=${GITLEAKS_REPO:-$GITHUB_WORKSPACE}
GITLEAKS_CONFIG=${GITLEAKS_CONFIG:-}
GITLEAKS_EXTRA_ARGS=${GITLEAKS_EXTRA_ARGS:-}

if [ -n "$GITLEAKS_CONFIG" ]; then
  GITLEAKS_EXTRA_ARGS="$GITLEAKS_EXTRA_ARGS --config=$GITLEAKS_CONFIG"
fi

gitleaks --verbose --redact --threads=1 \
  --repo-path="$GITLEAKS_REPO" \
  $GITLEAKS_EXTRA_ARGS
