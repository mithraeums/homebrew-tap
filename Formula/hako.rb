class Hako < Formula
  desc "Coding agent in one C file: local models or 14 cloud providers"
  homepage "https://github.com/mithraeums/hako-code"
  license "GPL-3.0-or-later"

  head "https://github.com/mithraeums/hako-code.git", branch: "main"

  # hako shells out to the curl program for HTTPS
  uses_from_macos "curl"

  on_macos do
    url "https://github.com/mithraeums/hako-code/releases/download/v0.4.3/hako-code-macos-universal.tar.gz"
    sha256 "25c5e38e1b80157fa8bffc564984064617b108a3ad510f1733566681f10c8f07"
  end

  on_linux do
    on_intel do
      url "https://github.com/mithraeums/hako-code/releases/download/v0.4.3/hako-code-linux-x86_64.tar.gz"
      sha256 "8b2a09183e76fbc50e17bc136e10c74253fe0db895939abe182821b07cf18bc7"
    end
    on_arm do
      url "https://github.com/mithraeums/hako-code/releases/download/v0.4.3/hako-code-linux-arm64.tar.gz"
      sha256 "5682b367952989b1ffcc8814d1e3692bfb8d508b479895d7b0dea9a6e0465459"
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
