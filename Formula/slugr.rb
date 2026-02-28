class Slugr < Formula
  desc "Rename files and directories to clean, URL and shell friendly slugs"
  homepage "https://github.com/vmunix/slugr"
  version "0.1.2"
  license "BSD-3-Clause"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/vmunix/slugr/releases/download/v0.1.2/slugr-x86_64-apple-darwin.tar.gz"
      sha256 "3440c9fd0008f03412de19b528cb590e69b5eea5aa2071f49e336487c0381828"
    end
    if Hardware::CPU.arm?
      url "https://github.com/vmunix/slugr/releases/download/v0.1.2/slugr-aarch64-apple-darwin.tar.gz"
      sha256 "9a4e6ad817adf62bde366328f78f4bc2bb271c3e9a495309395833187c82f1e8"
    end
  end

  def install
    bin.install "slugr"
  end

  test do
    assert_match "dry-run", shell_output("#{bin}/slugr test-file.txt 2>&1")
  end
end
