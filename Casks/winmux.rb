cask "winmux" do
  version "0.5.6-dogfood.70"
  sha256 "91c270066e11a1c064006d6efc4c1bce5ed7221f9e904ba21d228b8271500fee"

  url "https://github.com/prateek/winmux/releases/download/v#{version}/WinMux-#{version}-with-cli.zip"
  name "WinMux"
  desc "Sidebar-first tiling window manager, personal fork with a Nickel config"
  homepage "https://github.com/prateek/winmux"

  # No livecheck: dogfood builds ship as GitHub prereleases, which the
  # github_latest strategy ignores. Version bumps land here by hand.

  # The app self-updates via Sparkle; brew upgrade only matters for reinstalls.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "WinMux-#{version}/WinMux.app"
  binary "WinMux-#{version}/bin/winmux"

  # No postflight quarantine handling: Homebrew re-quarantines files written
  # by its own hooks, so stripping or rewriting the payload here does not
  # survive to first launch. The caveats carry the working manual steps.
  uninstall quit: "com.zimengxiong.winmux"

  zap trash: [
    "~/.config/winmux",
    "~/.local/state/winmux",
  ]

  caveats <<~EOS
    This build is self-signed (stable TCC identity) but not notarized, and a
    freshly installed or upgraded app stalls silently under Gatekeeper, and
    the CLI is killed on launch, until you clear their quarantine attribute:

         xattr -dr com.apple.quarantine /Applications/WinMux.app \\
           "$(readlink -f "$(command -v winmux)")"

    A plain `ditto --noqtn` copy keeps the attribute, so remove it directly.
    If macOS still blocks the first launch, approve it once via System
    Settings > Privacy & Security > Open Anyway.

    On its first launch WinMux opens a setup window that walks through
    Accessibility and Screen Recording, and moves no window until you
    press Start WinMux.

    Permissions granted to one version persist across upgrades (stable
    signing identity). Do not run AeroSpace and WinMux at the same time.

    The config is ~/.config/winmux/winmux.ncl. If there is none, an
    existing winmux.toml is converted on first launch; `winmux config
    check` reports mistakes.
  EOS
end
