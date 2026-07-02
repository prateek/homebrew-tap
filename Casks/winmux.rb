cask "winmux" do
  version "0.51.0-dogfood.1"
  sha256 "7badfa3df659e802afe41eb7f500aac6d1a48fd3b625c56a30a74ebefcfd3f9e"

  url "https://github.com/prateek/winmux/releases/download/v#{version}/WinMux-#{version}.zip"
  name "WinMux"
  desc "Fork with columnar zones for ultrawide monitors"
  homepage "https://github.com/prateek/winmux"

  # No livecheck: dogfood builds ship as GitHub prereleases, which the
  # github_latest strategy ignores. Version bumps land here by hand.

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "WinMux-#{version}/WinMux.app"
  binary "WinMux-#{version}/bin/winmux"

  # Release assets are ad-hoc signed, so Gatekeeper blocks anything still
  # carrying the download quarantine attribute. The app is moved to appdir
  # before postflight runs, but the linked CLI stays under the staged path,
  # so both locations need the strip.
  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/WinMux.app"],
                   must_succeed: false
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", staged_path.to_s],
                   must_succeed: false
  end

  uninstall quit: "com.zimengxiong.winmux"

  zap trash: "~/.config/winmux"

  caveats <<~EOS
    This is an ad-hoc signed dogfood build. macOS may re-prompt for
    Accessibility, Screen Recording, and Input Monitoring permissions after
    each upgrade because the code signature changes per build.

    Do not run AeroSpace and WinMux at the same time.

    First-run zone setup:
      winmux zone init --preset balanced --write
  EOS
end
