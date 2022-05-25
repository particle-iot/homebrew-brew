class O1010000 < Formula
  desc "o1010000 Experimental CLI"
  homepage "https://docs.particle.io/cli"
  url "https://o1010000.s3.amazonaws.com/o1010000-v1.0.1/o1010000-v1.0.1.tar.gz"
  sha256 "dedc1ab625350f0cd5ae205bcaef62917aa94a10795ddd590dcc6b08f09d3d5b"
  depends_on "particle-iot/brew/o1010000-node" => "12.22.1"

  def install
    inreplace "bin/o1010000", /^CLIENT_HOME=/, "export O1010000_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/o1010000", "\"$DIR/node\"", Formula["o1010000-node"].opt_bin/"node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/o1010000"
  end

  test do
    system bin/"o1010000", "version"
  end
end
