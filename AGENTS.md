# homebrew-tap guidance

This repo is Prateek's personal Homebrew tap for tools he is using, testing, or
helping upstream package.

## README structure

- Organize the README by upstream project, not by package type.
- Keep `brew tap prateek/tap` in a top-level setup section before project
  package examples.
- Each project section should include the upstream link, any upstream packaging
  issue or PR, the formulae and casks this tap provides, and install examples.
- When this tap is a temporary unblock for missing upstream Homebrew support,
  link the upstream distribution issue and make clear this tap is primarily
  personal.

## Formula conventions

- Prefer normal Homebrew release formulae with a tagged `url` and `sha256` when
  the project has suitable releases.
- If a formula intentionally installs from a moving branch, use a git `url` with
  the branch and an explicit version such as `version "main"`. Document that
  users must reinstall to pick up newer commits; `brew upgrade` will not detect
  new commits while the version remains `main`.
- Keep a `head` stanza when `brew install --HEAD` should remain available.
- For Go formulae that need to avoid a corrupt shared module cache, set
  `ENV["GOMODCACHE"] = buildpath/".go_mod_cache"` and run
  `system "go", "mod", "download"` before the build command.

## Cask conventions

- Casks install downloadable artifacts, so they should use upstream release
  assets rather than a source branch.
- Verify cask SHA256 values from release asset digests or upstream checksum
  files, then run `brew fetch --cask` for the touched cask.
- Keep cask URLs and homepage fields style-clean; Homebrew currently expects a
  trailing slash for bare-domain homepage URLs.

## Validation

- Run `brew style` for every touched formula or cask.
- Run `git diff --check` for touched files.
- Run `brew info` for changed formulae and casks.
- Run `brew fetch --cask` after cask version or SHA changes.
- Run a source install or reinstall when formula build behavior changes.

## AgentsView notes

- Upstream packaging discussion: <https://github.com/wesm/agentsview/issues/347>.
- The CLI formula currently installs from upstream `main` as `version "main"`;
  this is intentional for Prateek's tap.
- The desktop cask should follow upstream desktop release DMGs.
