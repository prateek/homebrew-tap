# homebrew-tap

Prateek's personal Homebrew tap for tools that are not yet available in the
upstream project's tap or Homebrew core.

## Setup

```sh
brew tap prateek/tap
```

## Projects

### AgentsView

Local web viewer for AI agent sessions.

- Upstream: <https://github.com/wesm/agentsview>
- Distribution discussion: <https://github.com/wesm/agentsview/issues/347>

#### Formulae

- `agentsview` — CLI. Installs from upstream `main` by default.

```sh
brew install prateek/tap/agentsview
```

Refresh the moving `main` build by reinstalling:

```sh
brew reinstall prateek/tap/agentsview
```

#### Casks

- `agentsview-desktop` — desktop app, installed from upstream release DMGs.

```sh
brew install --cask prateek/tap/agentsview-desktop
```
