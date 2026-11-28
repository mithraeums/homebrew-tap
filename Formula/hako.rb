class Hako < Formula
  desc "Coding agent in one C file: local models or 14 cloud providers"
  homepage "https://github.com/mithraeums/hako-code"
  license "GPL-3.0-or-later"

  head "https://github.com/mithraeums/hako-code.git", branch: "main"

  # hako shells out to the curl program for HTTPS
  uses_from_macos "curl"

  on_macos do
    url "https://github.com/mithraeums/hako-code/releases/download/v0.4.4/hako-code-macos-universal.tar.gz"
    sha256 "0b67ea852370016d8ba49a31cd1214e86d19ad5a491dcaf1594aca6bac630085"
  end

  on_linux do
    on_intel do
      url "https://github.com/mithraeums/hako-code/releases/download/v0.4.4/hako-code-linux-x86_64.tar.gz"
      sha256 "8324011527c2e6c54e4a13a0c97f7304a25ca33f221b22b199b569006490bc3c"
    end
    on_arm do
      url "https://github.com/mithraeums/hako-code/releases/download/v0.4.4/hako-code-linux-arm64.tar.gz"
      sha256 "818a8efbec1021442efe6488e7d3bd10e055e175132f7b873c5c2acceedaea77"
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
