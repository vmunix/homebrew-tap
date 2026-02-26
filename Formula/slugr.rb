class Slugr < Formula
  desc "Rename files and directories to clean, URL and shell friendly slugs"
  homepage "https://github.com/vmunix/slugr"
  version "0.1.0"
  license "BSD-3-Clause"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/vmunix/slugr/releases/download/v0.1.0/slugr-x86_64-apple-darwin.tar.gz"
      sha256 "47204cd97868f1e698974fc67f1d36cceaaf2d5584dd3beb5661fe98c1a0c77c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/vmunix/slugr/releases/download/v0.1.0/slugr-aarch64-apple-darwin.tar.gz"
      sha256 "b70cd3b2d74d9b1a1e6455a4e050610242c091e9be7b59ceb7c1546e4ab8a200"
    end
  end

  def install
    bin.install "slugr"
  end

  test do
    assert_match "dry-run", shell_output("#{bin}/slugr test-file.txt 2>&1")
  end
end
