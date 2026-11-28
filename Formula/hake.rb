class Hake < Formula
  desc "Vim-style terminal editor in one C file, with an AI pane built in"
  homepage "https://github.com/mithraeums/hako-edit"
  license "GPL-3.0-or-later"

  head "https://github.com/mithraeums/hako-edit.git", branch: "main"

  on_macos do
    url "https://github.com/mithraeums/hako-edit/releases/download/v0.2.2/hake-macos-universal.tar.gz"
    sha256 "da6d115ec59afe73f61ea99f978cfbed77e87d13b0b6284f9580b6aafb908a4a"
  end

  on_linux do
    on_intel do
      url "https://github.com/mithraeums/hako-edit/releases/download/v0.2.2/hake-linux-x86_64.tar.gz"
      sha256 "2dec4d166339740029303be9bc428d2636ba9a20b02cb59fafad9cd745d7f4b3"
    end
    on_arm do
      url "https://github.com/mithraeums/hako-edit/releases/download/v0.2.2/hake-linux-arm64.tar.gz"
      sha256 "9de9f12a3f92ce725f8722833cb65858e6467df15768cbe5c9417df7b0d04e01"
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
