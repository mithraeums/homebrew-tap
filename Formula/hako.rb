class Hako < Formula
  desc "Coding agent in one C file: local models or 14 cloud providers"
  homepage "https://github.com/mithraeums/hako-code"
  license "GPL-3.0-or-later"

  head "https://github.com/mithraeums/hako-code.git", branch: "main"

  # hako shells out to the curl program for HTTPS
  uses_from_macos "curl"

  on_macos do
    url "https://github.com/mithraeums/hako-code/releases/download/v0.4.2/hako-code-macos-universal.tar.gz"
    sha256 "36893fbfe19fd5410abac8659b4f5133df5a45cfcb83ffea76787d67bbc5b107"
  end

  on_linux do
    on_intel do
      url "https://github.com/mithraeums/hako-code/releases/download/v0.4.2/hako-code-linux-x86_64.tar.gz"
      sha256 "2a8a817d185c502e8cd24028d243baced71ab4c6ee508317e13f448790609164"
    end
    on_arm do
      url "https://github.com/mithraeums/hako-code/releases/download/v0.4.2/hako-code-linux-arm64.tar.gz"
      sha256 "a091ab21b81d6711446de4d4b9bfe64fc4d942e3d2d68a986b02e1044160c0b5"
    end
  end

  def install
    system "make", "WEB=1" if build.head?
    bin.install "hako"
  end

  test do
    assert_match(/hako v\d/, shell_output("#{bin}/hako --version"))
  end
end
