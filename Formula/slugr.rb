class Slugr < Formula
  desc "Rename files and directories to clean, URL and shell friendly slugs"
  homepage "https://github.com/vmunix/slugr"
  version "0.1.1"
  license "BSD-3-Clause"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/vmunix/slugr/releases/download/v0.1.1/slugr-x86_64-apple-darwin.tar.gz"
      sha256 "ad1c37ee53d80a996252d42267e7a1fe7de3984670f49c950faa581da971f0e1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/vmunix/slugr/releases/download/v0.1.1/slugr-aarch64-apple-darwin.tar.gz"
      sha256 "09a4d44fd418206b30b7d7b0ab4880992caf73502169a3f52bbc68f1baf932f7"
    end
  end

  def install
    bin.install "slugr"
  end

  test do
    assert_match "dry-run", shell_output("#{bin}/slugr test-file.txt 2>&1")
  end
end
