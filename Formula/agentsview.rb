class Agentsview < Formula
  desc "Local web viewer for AI agent sessions"
  homepage "https://agentsview.io"
  url "https://github.com/wesm/agentsview.git", branch: "main"
  version "main"
  license "MIT"
  head "https://github.com/wesm/agentsview.git", branch: "main"

  depends_on "go" => :build
  depends_on "node" => :build

  def install
    ENV["GOMODCACHE"] = buildpath/".go_mod_cache"

    system "go", "mod", "download"

    system "make", "build"
    bin.install "agentsview"
  end

  test do
    assert_match "agentsview", shell_output("#{bin}/agentsview --version")
  end
end
