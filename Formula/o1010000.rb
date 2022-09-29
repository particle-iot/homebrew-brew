class O1010000 < Formula
  desc "Experimental `o1010000` CLI from Particle"
  homepage "https://docs.particle.io/cli"
  url "https://o1010000.s3.amazonaws.com/o1010000-v1.3.1/o1010000-v1.3.1.tar.gz"
  sha256 "edf9e1b696d05eefce9a85366374a7e489d3e9201129c0016234500bd85240c7"
  depends_on "particle-iot/brew/o1010000-node" => "16.17.0"

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

