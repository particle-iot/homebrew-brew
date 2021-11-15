class Prtcl < Formula
  desc "prtcl (Particle CLI vNext)"
  homepage "https://docs.particle.io/cli"
  url "https://prtcl.s3.amazonaws.com/prtcl-v1.4.0/prtcl-v1.4.0.tar.gz"
  sha256 "7f95323d72df4206b1e49c380109ac18162b1063392bfd544628f0a22d80f28a"
  depends_on "particle-iot/brew/prtcl-node" => "12.22.1"

  def install
    inreplace "bin/prtcl", /^CLIENT_HOME=/, "export PRTCL_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/prtcl", "\"$DIR/node\"", Formula["prtcl-node"].opt_bin/"node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/prtcl"
  end

  test do
    system bin/"prtcl", "version"
  end
end
