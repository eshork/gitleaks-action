FROM zricethezav/gitleaks

LABEL "com.github.actions.name"="gitleaks-action"
LABEL "com.github.actions.description"="checks your source for embedded key leaks, using gitleaks"
LABEL "com.github.actions.icon"="shield"
LABEL "com.github.actions.color"="orange"
LABEL "repository"="https://github.com/eshork/gitleaks-action"

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
