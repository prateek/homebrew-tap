class Forkstub < Formula
  desc "Stub official CLI used to validate the downstream-fork install path"
  homepage "https://github.com/prateek/fork-testbed"
  url "https://github.com/prateek/fork-testbed/releases/download/v0.0.1/forkstub.tar.gz"
  sha256 "8b8a768b7895de4b67216c5d241dbf5f5c550f0887b579d2c1b8213714f0616b"
  version "0.0.1"

  def install
    bin.install "forkstub"
  end

  test do
    assert_match "official", shell_output("#{bin}/forkstub")
  end
end
