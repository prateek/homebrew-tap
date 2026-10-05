cask "winmux" do
  version "0.5.6-dogfood.10"
  sha256 "8e4422e6f2a41305dd2867c2dc139f9e453f754b55aeb7b649fc2f9b2f2cd347"

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
    freshly installed or upgraded app stalls silently under Gatekeeper until
    you do both of these:

    1. Rewrite the payloads to shed quarantine and download provenance:

         tmp=$(mktemp -d)
         ditto --noqtn /Applications/WinMux.app "$tmp/app" && \\
           rm -rf /Applications/WinMux.app && \\
           ditto --noqtn "$tmp/app" /Applications/WinMux.app
         cli="$(readlink -f "$(command -v winmux)")"
         ditto --noqtn "$cli" "$tmp/cli" && rm -f "$cli" && \\
           ditto --noqtn "$tmp/cli" "$cli"
         rm -rf "$tmp"

    2. On the first launch of each version, approve the Gatekeeper block via
       System Settings > Privacy & Security > Open Anyway.

    Permissions granted to one version persist across upgrades (stable
    signing identity). Do not run AeroSpace and WinMux at the same time.

    The config is ~/.config/winmux/winmux.ncl. An existing winmux.toml is
    converted on first launch; `winmux config check` reports mistakes.
  EOS
end
