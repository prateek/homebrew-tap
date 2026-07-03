cask "forkstub-app-fork" do
  version "0.0.1"
  sha256 "21f5a891527ad58fae6ad88b009c0f4b5de6aeade4e9fde61d84b1f90f134e78"

  url "https://github.com/prateek/fork-testbed/releases/download/v0.0.1/ForkStubApp-fork.zip"
  name "ForkStub (fork build)"
  desc "Stub fork app build used to validate the downstream-fork install path"
  homepage "https://github.com/prateek/fork-testbed"

  conflicts_with cask: "forkstub-app"

  app "ForkStub.app"
end
