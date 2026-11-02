class Hakm < Formula
  desc "LLM inference engine in plain C, no llama.cpp or Python"
  homepage "https://github.com/mithraeums/hako"
  version "0.0.4"
  license "GPL-3.0-only"

  head do
    url "https://github.com/mithraeums/hako.git", branch: "main"
  end

  on_macos do
    url "https://github.com/mithraeums/hako/releases/download/v0.0.4/hakm-macos-universal.tar.gz"
    sha256 "3474dde9eb7a5c8ed4e52988c00678d3b0c4da1c5d8e0f3f033f708d5226f172"
  end

  on_linux do
    on_intel do
      url "https://github.com/mithraeums/hako/releases/download/v0.0.4/hakm-linux-x86_64.tar.gz"
      sha256 "ecee884eabc5a9f8624ed1a0aba8d8a2403b47288f2d0925bfb735827ff1bcc9"
    end
    on_arm do
      url "https://github.com/mithraeums/hako/releases/download/v0.0.4/hakm-linux-arm64.tar.gz"
      sha256 "85f75aebd2369385775bb2e1e197f939bf184093d8b366d6f7366904d0e4c2af"
    end
  end

  def install
    system "make", "hakm" if build.head?
    bin.install "hakm"
  end

  test do
    assert_match(/hakm v\d/, shell_output("#{bin}/hakm --version"))
  end
end
