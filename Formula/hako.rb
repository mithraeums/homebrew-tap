class Hako < Formula
  desc "Coding agent in one C file: local models or 14 cloud providers"
  homepage "https://github.com/mithraeums/hako-code"
  license "GPL-3.0-or-later"

  head "https://github.com/mithraeums/hako-code.git", branch: "main"

  # hako shells out to the curl program for HTTPS
  uses_from_macos "curl"

  on_macos do
    url "https://github.com/mithraeums/hako-code/releases/download/v0.3.3/hako-code-macos-universal.tar.gz"
    sha256 "15ad5a91e148b7a7704376277d33b01d35c8fc30ab77a3f29e1f5c5df6277fb5"
  end

  on_linux do
    on_intel do
      url "https://github.com/mithraeums/hako-code/releases/download/v0.3.3/hako-code-linux-x86_64.tar.gz"
      sha256 "fe42a1e8d2d0a6f21b2ea337b5b241a655e0c34f254f7b04b3cfadd359352ac6"
    end
    on_arm do
      url "https://github.com/mithraeums/hako-code/releases/download/v0.3.3/hako-code-linux-arm64.tar.gz"
      sha256 "c11f70f99b7e3e80fcd27fdacc56923f6b805960ddb646c32ae54411ac8e3eaf"
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
