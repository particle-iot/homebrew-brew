class O1010000Node < Formula
  desc "node.js dependency for the `o1010000` CLI"
  homepage "https://docs.particle.io/cli"
  url "https://nodejs.org/download/release/v12.22.1/node-v12.22.1-darwin-x64.tar.xz"
  version "12.22.1"
  sha256 "de5e317580732530961d83b0fb9b2c370d222bd0c5a1b331900e9ddc0fdfe086"
  keg_only "o1010000-node is only used by the `o1010000` CLI, which explicitly requires from Cellar"

  def install
    bin.install buildpath/"bin/node"
  end

  def test
    output = system bin/"node", "version"
    assert output.strip == "v#{version}"
  end
end
