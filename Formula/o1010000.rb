class O1010000 < Formula
  desc "Experimental CLI"
  homepage "https://docs.particle.io/cli"
  url "https://o1010000.s3.amazonaws.com/o1010000-v1.0.0/o1010000-v1.0.0.tar.gz"
  sha256 "bfc40849d0a6f16bba8b150d68cc4d2ac04f08fb282ac546a1b45ae44a4eea2e"
  depends_on "particle-iot/brew/o1010000-node"

  def install
    inreplace "bin/o1010000", /^CLIENT_HOME=/, "export O1010000_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/o1010000", "\"$DIR/node\"", "#{Formula["o1010000-node"].opt_share}/node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/o1010000"

    # bash_completion.install "#{libexec}/node_modules/@particle/o1010000/plugin-autocomplete/autocomplete/brew/bash"
    # zsh_completion.install "#{libexec}/node_modules/@particle/o1010000/plugin-autocomplete/autocomplete/brew/zsh/_o1010000"
  end

  # def caveats; <<~EOS
  #   To use the o1010000 CLI's autocomplete --
  #     Via homebrew's shell completion:
  #       1) Follow homebrew's install instructions https://docs.brew.sh/Shell-Completion
  #           NOTE: For zsh, as the instructions mention, be sure compinit is autoloaded
  #                 and called, either explicitly or via a framework like oh-my-zsh.
  #       2) Then run
  #         $ o1010000 autocomplete --refresh-cache
  #
  #     OR
  #
  #     Use our standalone setup:
  #       1) Run and follow the install steps:
  #         $ o1010000 autocomplete
  # EOS
  # end

  test do
    system bin/"o1010000", "version"
  end
end
