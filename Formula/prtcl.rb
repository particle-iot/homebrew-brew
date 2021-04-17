class Prtcl < Formula
  desc "prtcl (Particle CLI vNext)"
  homepage "https://docs.particle.io/cli"
  url "https://prtcl.s3.amazonaws.com/prtcl-v1.0.0/prtcl-v1.0.0.tar.gz"
  sha256 "94031060099933df777830cb11490c97fd3af64b0612d65750a011d3e8e88c30"
  depends_on "particle-iot/brew/prtcl-node" => "12.22.1"

  def install
    inreplace "bin/prtcl", /^CLIENT_HOME=/, "export PRTCL_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/prtcl", "\"$DIR/node\"", Formula["prtcl-node"].opt_bin/"node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/prtcl"

    # bash_completion.install "#{libexec}/node_modules/@particle/prtcl/plugin-autocomplete/autocomplete/brew/bash"
    # zsh_completion.install "#{libexec}/node_modules/@particle/prtcl/plugin-autocomplete/autocomplete/brew/zsh/_prtcl"
  end

  # def caveats; <<~EOS
  #   To use the prtcl's autocomplete --
  #     Via homebrew's shell completion:
  #       1) Follow homebrew's install instructions https://docs.brew.sh/Shell-Completion
  #           NOTE: For zsh, as the instructions mention, be sure compinit is autoloaded
  #                 and called, either explicitly or via a framework like oh-my-zsh.
  #       2) Then run
  #         $ prtcl autocomplete --refresh-cache
  #
  #     OR
  #
  #     Use our standalone setup:
  #       1) Run and follow the install steps:
  #         $ prtcl autocomplete
  # EOS
  # end

  test do
    system bin/"prtcl", "version"
  end
end
