class Hake < Formula
  desc "Vim-style terminal editor in one C file, with an AI pane built in"
  homepage "https://github.com/mithraeums/hako-edit"
  license "GPL-3.0-or-later"

  head "https://github.com/mithraeums/hako-edit.git", branch: "main"

  on_macos do
    url "https://github.com/mithraeums/hako-edit/releases/download/v0.2.1/hake-macos-universal.tar.gz"
    sha256 "86d7b0a6231bf19b70f0a62f417b45fa7b64edc3ca545c168a9c88ec8e14be3a"
  end

  on_linux do
    on_intel do
      url "https://github.com/mithraeums/hako-edit/releases/download/v0.2.1/hake-linux-x86_64.tar.gz"
      sha256 "52b7dcfe9acb55c61a63e08a4a922a6fdce65c825436efa015e937ca0ccbb035"
    end
    on_arm do
      url "https://github.com/mithraeums/hako-edit/releases/download/v0.2.1/hake-linux-arm64.tar.gz"
      sha256 "de7cd3a8e4a1f62a76182798f21dcfb6cc42143936c0c15dbf715b1ad8526cb3"
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
