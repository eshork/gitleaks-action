# gitleaks-action

Audit git commits for secrets with gitleaks, as a GitHub action.

Credit to [zricethezav/gitleaks](https://github.com/zricethezav/gitleaks) for the complicated bits.

## Usage
```
workflow "gitleaks my commits" {
  on = "push"
  resolves = ["gitleaks"]
}

action "gitleaks" {
  uses = "eshork/gitleaks-action@master"
}
```

----

[MIT License](LICENSE)
