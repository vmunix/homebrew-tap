class Slugr < Formula
  desc "Rename files and directories to clean, URL and shell friendly slugs"
  homepage "https://github.com/vmunix/slugr"
  version "0.1.3"
  license "BSD-3-Clause"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/vmunix/slugr/releases/download/v0.1.3/slugr-x86_64-apple-darwin.tar.gz"
      sha256 "63b2dd13b8c0df15c776e2cb513e76344ee020f297d2979959985e050120ea4a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/vmunix/slugr/releases/download/v0.1.3/slugr-aarch64-apple-darwin.tar.gz"
      sha256 "1c432c15455e831a1675b1ac54902e8192b052965cb2019d3fea4de71d286f5c"
    end
  end

  def install
    bin.install "slugr"
  end

  test do
    assert_match "dry-run", shell_output("#{bin}/slugr test-file.txt 2>&1")
  end
end
