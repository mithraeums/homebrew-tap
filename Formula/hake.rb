class Hake < Formula
  desc "Vim-style terminal editor in one C file, with an AI pane built in"
  homepage "https://github.com/mithraeums/hako-edit"
  version "0.2.0"
  license "GPL-3.0-or-later"

  head do
    url "https://github.com/mithraeums/hako-edit.git", branch: "main"
  end

  on_macos do
    url "https://github.com/mithraeums/hako-edit/releases/download/v0.2.0/hake-macos-universal.tar.gz"
    sha256 "bc619181c5e8426dc838f43a4f23d31e3db3a5da179d6e3c56ab774cd56dae9b"
  end

  on_linux do
    on_intel do
      url "https://github.com/mithraeums/hako-edit/releases/download/v0.2.0/hake-linux-x86_64.tar.gz"
      sha256 "6532a4e9b85d58ca6479820ad2a38f3814e18310912c074d2e726b19b3a3d607"
    end
    on_arm do
      url "https://github.com/mithraeums/hako-edit/releases/download/v0.2.0/hake-linux-arm64.tar.gz"
      sha256 "879ab72de91661bfa0c01a8aa7c71e7beb07bdacc8f7d5bb262ca69471827e62"
    end
  end

  def install
    system "make" if build.head?
    bin.install "hake"
  end

  test do
    assert_match(/hake v\d/, shell_output("#{bin}/hake --version"))
  end
end
