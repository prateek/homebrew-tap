cask "forkstub-app" do
  version "0.0.1"
  sha256 "f4ce8e3edfbcfe47de33cd1115ed5bea7a66100c632bbf3d3341adec62b4402a"

  url "https://github.com/prateek/fork-testbed/releases/download/v0.0.1/ForkStubApp.zip"
  name "ForkStub"
  desc "Stub official app used to validate the downstream-fork install path"
  homepage "https://github.com/prateek/fork-testbed"

  app "ForkStub.app"
end
