# gitleaks-action

Audit git commits for secrets with gitleaks, as a GitHub action.

Credit to [zricethezav/gitleaks](https://github.com/zricethezav/gitleaks) for the complicated bits.

## Usage

```yaml
name: gitleaks my commits

on:
  - push

jobs:
  run:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2

      - uses: eshork/gitleaks-action@master
        env:
          # GITLEAKS_REPO targets the repo to scan (default to GITHUB_WORKSPACE)
          GITLEAKS_REPO: $GITHUB_WORKSPACE
          # GITLEAKS_CONFIG targets the config to use (use `--repo-config` if not set)
          GITLEAKS_CONFIG: $GITHUB_WORKSPACE/.github/gitleaks.toml
          # GITLEAKS_EXTRA_ARGS allow to extra args to gitleaks
          GITHUB_EXTRA_ARGS: --log=debug
```

> Note: Avoid using master ref, prefer to pin the last release's SHA ref.

----

[MIT License](LICENSE)
