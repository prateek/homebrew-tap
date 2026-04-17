class Agentsview < Formula
  desc "Local web viewer for AI agent sessions"
  homepage "https://agentsview.io"
  url "https://github.com/wesm/agentsview/archive/refs/tags/v0.22.2.tar.gz"
  sha256 "f68e1051cce96338fd9e8b1ddc598195d46e05b068602e57dfae2cd78952dbe5"
  license "MIT"
  head "https://github.com/wesm/agentsview.git", branch: "main"

  depends_on "go" => :build
  depends_on "node" => :build

  def install
    system "make", "build", "VERSION=v#{version}"
    bin.install "agentsview"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentsview --version")
  end
end
