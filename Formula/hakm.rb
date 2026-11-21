class Hakm < Formula
  desc "LLM inference engine in plain C, no llama.cpp or Python"
  homepage "https://github.com/mithraeums/hako"
  license "GPL-3.0-or-later"

  head "https://github.com/mithraeums/hako.git", branch: "main"

  on_macos do
    url "https://github.com/mithraeums/hako/releases/download/v0.0.8/hakm-macos-universal.tar.gz"
    sha256 "2e70533a4400aae43a35672a42ad19cc061855f67d9d6764d7f0b544e0d823e9"
  end

  on_linux do
    on_intel do
      url "https://github.com/mithraeums/hako/releases/download/v0.0.8/hakm-linux-x86_64.tar.gz"
      sha256 "7b7e30066c4e5b419edb989931a204f204580482df58ccce373a5e95607cfd60"
    end
    on_arm do
      url "https://github.com/mithraeums/hako/releases/download/v0.0.8/hakm-linux-arm64.tar.gz"
      sha256 "7c08aa858c75035cac84f40f815b1af5a37471f69fc1b97c398082f59d282e08"
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
