class Prtcl < Formula
  desc "The new Particle CLI - a work in-progress - for current CLI, visit: https://github.com/particle-iot/particle-cli"
  homepage "https://docs.particle.io/cli"
  url "https://prtcl.s3.amazonaws.com/prtcl-v1.9.6/prtcl-v1.9.6.tar.gz"
  sha256 "aacc023555bf1943d2fd2b30c2b52bf1e29f5d2753fe8a5b9dd4cb2647e41432"
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

