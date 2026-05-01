cask "agentsview-desktop" do
  arch arm: "aarch64", intel: "x64"

  version "0.26.1"
  sha256 arm:   "99a7212e57d301f1910deafec95ed6441ae7e800485284bfb33a18919807a2ed",
         intel: "09a4037fbd083f2adeb2a4a83e6f6ba3bb4a8903bec333c40561e3101144913f"

  url "https://github.com/wesm/agentsview/releases/download/v#{version}/AgentsView_#{version}_#{arch}.dmg",
      verified: "github.com/wesm/agentsview/"
  name "AgentsView"
  desc "Local web viewer for AI agent sessions (desktop app)"
  homepage "https://agentsview.io/"

  depends_on macos: ">= :big_sur"

  app "AgentsView.app"

  zap trash: [
    "~/Library/Application Support/AgentsView",
    "~/Library/Caches/io.agentsview.desktop",
    "~/Library/Preferences/io.agentsview.desktop.plist",
    "~/Library/Saved Application State/io.agentsview.desktop.savedState",
  ]
end
