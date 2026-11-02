class Hako < Formula
  desc "Coding agent in one C file: local models or 14 cloud providers"
  homepage "https://github.com/mithraeums/hako-code"
  version "0.3.0"
  license "GPL-3.0-only"

  head do
    url "https://github.com/mithraeums/hako-code.git", branch: "main"
  end

  # hako shells out to the curl program for HTTPS
  uses_from_macos "curl"

  on_macos do
    url "https://github.com/mithraeums/hako-code/releases/download/v0.3.0/hako-code-macos-universal.tar.gz"
    sha256 "f9d165db4b2a9ad215c9290f076efc3871d680c6b0fbbfbb52a72eb201c3c3cb"
  end

  on_linux do
    on_intel do
      url "https://github.com/mithraeums/hako-code/releases/download/v0.3.0/hako-code-linux-x86_64.tar.gz"
      sha256 "cc71f9a4838df87d511f325ded7be44fcb48b725ac441e5f425d2dd97e7f9823"
    end
    on_arm do
      url "https://github.com/mithraeums/hako-code/releases/download/v0.3.0/hako-code-linux-arm64.tar.gz"
      sha256 "adff51aa16f8a78f7169d299aa0d03203d50468418e48203705a1f02645fe19f"
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
