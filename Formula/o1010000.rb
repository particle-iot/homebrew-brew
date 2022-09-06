class O1010000 < Formula
  desc "Experimental `o1010000` CLI from Particle"
  homepage "https://docs.particle.io/cli"
  url "https://o1010000.s3.amazonaws.com/o1010000-v1.2.1/o1010000-v1.2.1.tar.gz"
  sha256 "2fda828d6f1c990941b52bb2529329b38ad49cc5f3757e1e3dc041abf39a63a1"
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
