# gitleaks-action

Audit git commits for secrets with gitleaks, as a GitHub action.

Credit to [zricethezav/gitleaks](https://github.com/zricethezav/gitleaks) for the complicated bits.

## Usage

```
name: gitleaks my commits

on:
  - push

jobs:
  run:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v1

      - uses: eshork/gitleaks-action@master

```

----

[MIT License](LICENSE)
