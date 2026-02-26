class Slug < Formula
  desc "Rename files and directories to clean, URL and shell friendly slugs"
  homepage "https://github.com/vmunix/slug"
  version "0.1.1"
  license "BSD-3-Clause"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/vmunix/slug/releases/download/v0.1.1/slug-x86_64-apple-darwin.tar.gz"
      sha256 "e7db08e688ff49b640f756b6b6c1b9ca93de9aa74f2c6c89fcf2aa46b4b532cc"
    end
    if Hardware::CPU.arm?
      url "https://github.com/vmunix/slug/releases/download/v0.1.1/slug-aarch64-apple-darwin.tar.gz"
      sha256 "aa7000b9e00fb7e339e4326a07f3caca5f67cda9bb7b64fbac7fa2b376311739"
    end
  end

  def install
    bin.install "slug"
  end

  test do
    assert_match "dry-run", shell_output("#{bin}/slug test-file.txt 2>&1")
  end
end
