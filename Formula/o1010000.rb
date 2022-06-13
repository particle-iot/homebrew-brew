class O1010000 < Formula
  desc "Experimental `o1010000` CLI from Particle"
  homepage "https://docs.particle.io/cli"
  url "https://o1010000.s3.amazonaws.com/o1010000-v1.0.2/o1010000-v1.0.2.tar.gz"
  sha256 "a865826f2a5488de224d0560a669f84fa4d80b232471cf7d14660e54d07cef54"
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
