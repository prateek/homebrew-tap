class TestbedFork < Formula
  desc "E2E testbed fork build (auto-built release asset)"
  homepage "https://github.com/prateek/testbed-fork"
  url "https://github.com/prateek/testbed-fork/releases/download/v20260703.2/testbed-v20260703.2.tar.gz"
  sha256 "968c646c560a3e46e39bb7721b4529880bc71fdbd39632d7cbfef3bd1f6e9d53"
  version "20260703.2"

  def install
    bin.install "testbed.sh" => "testbed"
  end
end
