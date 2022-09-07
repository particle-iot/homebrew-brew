class O1010000Node < Formula
  desc "node.js dependency for the `o1010000` CLI"
  homepage "https://docs.particle.io/cli"
  url "https://nodejs.org/download/release/v16.17.0/node-v16.17.0-darwin-x64.tar.xz"
  version "16.17.0"
  sha256 "0e9b7240b90694f384547280dc4704c9f49ff3201709bf74fd2711766533497c"
  keg_only "o1010000-node is only used by the `o1010000` CLI, which explicitly requires from Cellar"

  def install
    bin.install buildpath/"bin/node"
  end

  def test
    output = system bin/"node", "version"
    assert output.strip == "v#{version}"
  end
end
