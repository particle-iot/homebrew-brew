class Prtcl < Formula
  desc "The new Particle CLI - a work in-progress - for current CLI, visit: https://github.com/particle-iot/particle-cli"
  homepage "https://docs.particle.io/cli"
  url "https://prtcl.s3.amazonaws.com/prtcl-v1.11.4/prtcl-v1.11.4.tar.gz"
  sha256 "5f3ca69543ace703628369013c203e9489e3767a68333d9a7b46e9a4dc604af0"
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

