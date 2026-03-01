class Spawn < Formula
  desc "Sandboxed AI coding agents on macOS"
  homepage "https://github.com/vmunix/spawn"
  url "https://github.com/vmunix/spawn/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "01fb5b37a91a36841a2ccc1de00c0e82912bb69fe972ccd3fd3d9600120302db"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["16.0", :build]

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/spawn"
  end

  test do
    assert_match "Sandboxed AI coding agents", shell_output("#{bin}/spawn --help 2>&1", 0)
  end
end
