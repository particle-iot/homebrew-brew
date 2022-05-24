class O1010000 < Formula
  desc "o1010000 Experimental CLI"
  homepage "https://docs.particle.io/cli"
  url "https://o1010000.s3.amazonaws.com/o1010000-v1.0.0/o1010000-v1.0.0.tar.gz"
  sha256 "567c73683059ad865cbe7c03fdf009dea0dc64684494c92312e981ffb6f05490"
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
