class Hako < Formula
  desc "Coding agent in one C file: local models or 14 cloud providers"
  homepage "https://github.com/mithraeums/hako-code"
  license "GPL-3.0-or-later"

  head "https://github.com/mithraeums/hako-code.git", branch: "main"

  # hako shells out to the curl program for HTTPS
  uses_from_macos "curl"

  on_macos do
    url "https://github.com/mithraeums/hako-code/releases/download/v0.4.0/hako-code-macos-universal.tar.gz"
    sha256 "d911ce0700a9b4b6497a506c6c8ca33f7caf3f79396da1c4a963d20eac8213c2"
  end

  on_linux do
    on_intel do
      url "https://github.com/mithraeums/hako-code/releases/download/v0.4.0/hako-code-linux-x86_64.tar.gz"
      sha256 "dbc963bd16bd8f831a898c845b5283890b1bb3526b972fc467d1eec57d84c258"
    end
    on_arm do
      url "https://github.com/mithraeums/hako-code/releases/download/v0.4.0/hako-code-linux-arm64.tar.gz"
      sha256 "50a270ae08f0687b68184dca9472d05af37b4aa4419f798cd23ac12528531497"
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
