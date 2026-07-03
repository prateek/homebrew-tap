cask "winmux" do
  version "0.51.0-dogfood.6"
  sha256 "98f234d4ff93c2629f76976d8576e0420c2b292b99fc165934bbab9bd63316dc"

  url "https://github.com/prateek/winmux/releases/download/v#{version}/WinMux-#{version}.zip"
  name "WinMux"
  desc "Fork with columnar zones for ultrawide monitors"
  homepage "https://github.com/prateek/winmux"

  # No livecheck: dogfood builds ship as GitHub prereleases, which the
  # github_latest strategy ignores. Version bumps land here by hand.

  # The app self-updates via Sparkle; brew upgrade only matters for reinstalls.
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "WinMux-#{version}/WinMux.app"
  binary "WinMux-#{version}/bin/winmux"

  # No postflight quarantine handling: Homebrew re-quarantines files written
  # by its own hooks, so stripping or rewriting the payload here does not
  # survive to first launch. The caveats carry the working manual steps.
  uninstall quit: "com.zimengxiong.winmux"

  zap trash: "~/.config/winmux"

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

    First-run zone setup:
      winmux zone init --preset balanced --write
  EOS
end
