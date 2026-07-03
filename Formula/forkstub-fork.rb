class ForkstubFork < Formula
  desc "Stub fork build used to validate the downstream-fork install path"
  homepage "https://github.com/prateek/fork-testbed"
  url "https://github.com/prateek/fork-testbed/releases/download/v0.0.1/forkstub-fork.tar.gz"
  sha256 "ad43e8e82c746d484dacefe1ea2787b2e23b2d5b1b2fd356a9d591cdb2af11ee"
  version "0.0.1"

  conflicts_with "forkstub", because: "both install a forkstub binary"

  def install
    bin.install "forkstub"
  end

  test do
    assert_match "fork", shell_output("#{bin}/forkstub")
  end
end
