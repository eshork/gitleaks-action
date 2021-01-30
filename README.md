I'm glad that a few others found this quick project was useful.
However, I'm closing down this repo because the gitleaks project now publishes their own github action to wrap the tool.
I highly recommend you switch to that instead.
You can find it at: https://github.com/marketplace/actions/gitleaks


---

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
