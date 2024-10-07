class Prtcl < Formula
  desc "The new Particle CLI - a work in-progress - for current CLI, visit: https://github.com/particle-iot/particle-cli"
  homepage "https://docs.particle.io/cli"
  url "https://prtcl.s3.amazonaws.com/prtcl-v1.11.5/prtcl-v1.11.5.tar.gz"
  sha256 "76f453bcbbd8c367f3719d4e7ac78e6c601859e9a22cc4d279520a030ab81034"
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

