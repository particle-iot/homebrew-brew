class Prtcl < Formula
  desc "The new Particle CLI - a work in-progress - for current CLI, visit: https://github.com/particle-iot/particle-cli"
  homepage "https://docs.particle.io/cli"
  url "https://prtcl.s3.amazonaws.com/prtcl-v2.1.4/prtcl-v2.1.4.tar.gz"
  sha256 "667f8fae0cbb8db47529c2166d9f81f50a2dcca62fb724b404e43b2d4215aea9"
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

