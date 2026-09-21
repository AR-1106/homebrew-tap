# Homebrew Tap

Personal tap for macOS apps by [AR-1106](https://github.com/AR-1106).

## Apps

| Cask | Install | Repo |
| --- | --- | --- |
| [Filit](https://github.com/AR-1106/filit) | `brew install --cask filit` | Smart paste via TypeSafe |
| [Shoo](https://github.com/AR-1106/Shoo) | `brew install --cask shoo` | Close windows from Mission Control |

## Setup

```bash
brew tap AR-1106/tap
brew install --cask filit   # or shoo
```

## Notes

These casks ship **ad-hoc signed** builds (not Apple-notarized). Each cask clears quarantine after install so Gatekeeper should not block first launch. Official `homebrew/cask` still requires Developer ID + notarization.
