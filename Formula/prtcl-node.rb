class PRTCLNode < Formula
  desc "node.js dependency for prtcl (Particle CLI vNext)"
  homepage "https://docs.particle.io/cli"
  url "https://nodejs.org/download/release/v12.22.1/node-v12.22.1-darwin-x64.tar.xz"
  version "12.22.1"
  sha256 "de5e317580732530961d83b0fb9b2c370d222bd0c5a1b331900e9ddc0fdfe086"
  keg_only "prtcl-node is only used by prtcl (Particle CLI vNext) (particle-iot/brew/prtcl), which explicitly requires from Cellar"

  def install
    bin.install buildpath/"bin/node"
  end

  def test
    output = system bin/"node", "version"
    assert output.strip == "v#{version}"
  end
end
