# homebrew-tap

Prateek's personal Homebrew tap for tools that are not yet available in the
upstream project's tap or Homebrew core.

## Setup

```sh
brew tap prateek/tap
```

## Projects

### WinMux (columnar-zones fork)

Personal dogfood builds of <https://github.com/prateek/winmux>, a fork of
<https://github.com/zimengxiong/winmux> that adds columnar zones for ultrawide
monitors. Not distributed upstream; this cask exists so the fork can be
installed and upgraded on machines without a build toolchain.

- Cask `winmux`: installs `WinMux.app` and links the `winmux` CLI onto `PATH`.
  Builds are ad-hoc signed prerelease assets; the cask strips quarantine in a
  postflight and macOS may re-prompt permissions after upgrades.

```sh
brew install --cask prateek/tap/winmux
```

AgentsView graduated to the official Homebrew cask and is no longer shipped
here. Install it with:

```sh
brew install --cask agentsview
```

The cask installs the desktop app and links the `agentsview` CLI onto `PATH`.
Upstream distribution issue: <https://github.com/kenn-io/agentsview/issues/347>.
