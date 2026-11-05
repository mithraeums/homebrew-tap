class Hakm < Formula
  desc "LLM inference engine in plain C, no llama.cpp or Python"
  homepage "https://github.com/mithraeums/hako"
  license "GPL-3.0-or-later"

  head "https://github.com/mithraeums/hako.git", branch: "main"

  on_macos do
    url "https://github.com/mithraeums/hako/releases/download/v0.0.6/hakm-macos-universal.tar.gz"
    sha256 "3655af033709eacb01ea7311059af49e1da48193b7ffc997be7b88b85f75ea24"
  end

  on_linux do
    on_intel do
      url "https://github.com/mithraeums/hako/releases/download/v0.0.6/hakm-linux-x86_64.tar.gz"
      sha256 "92948585ee2b6cd8d523f50c8a5b234e36d75a800544dd69ef1b5561a44e53de"
    end
    on_arm do
      url "https://github.com/mithraeums/hako/releases/download/v0.0.6/hakm-linux-arm64.tar.gz"
      sha256 "2d6b3057c059eb169ede8af13f52fe2fd90473dd9605caa0f1eeb2f00c0e8bc6"
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
