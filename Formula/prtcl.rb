class Prtcl < Formula
  desc "prtcl (Particle CLI vNext)"
  homepage "https://docs.particle.io/cli"
  url "https://prtcl.s3.amazonaws.com/prtcl-v1.7.13/prtcl-v1.7.13.tar.gz"
  sha256 "bbac41df028c3f334aca0ea5a60f7380672cdb6c3e9d14d4ba23873546157848"
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
