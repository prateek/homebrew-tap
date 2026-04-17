cask "agentsview-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "0.22.2"
  sha256 arm:   "3e8bc32fc6b73fc9002402db27ec4de5c0007ac9bbc1b9bab20fea6d2c2890d2",
         intel: "00735d4d72256854d30eccfaef48772b1bfbb4b464aa389c9eab64481b559dfb"

  url "https://github.com/wesm/agentsview/releases/download/v#{version}/AgentsView_#{version}_#{arch}.dmg"
  name "AgentsView"
  desc "Local web viewer for AI agent sessions (desktop app)"
  homepage "https://agentsview.io"

  depends_on macos: ">= :big_sur"

  app "AgentsView.app"

  zap trash: [
    "~/Library/Application Support/AgentsView",
    "~/Library/Caches/io.agentsview.desktop",
    "~/Library/Preferences/io.agentsview.desktop.plist",
    "~/Library/Saved Application State/io.agentsview.desktop.savedState",
  ]
end
