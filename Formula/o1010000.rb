class O1010000 < Formula
  desc "Experimental `o1010000` CLI from Particle"
  homepage "https://docs.particle.io/cli"
  url "https://o1010000.s3.amazonaws.com/o1010000-v1.0.3/o1010000-v1.0.3.tar.gz"
  sha256 "2b2a68f20ec231eedc5a56167302c6fa92e02035a923fed378be541df601b71c"
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
