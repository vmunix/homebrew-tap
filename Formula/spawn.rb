class Spawn < Formula
  desc "Sandboxed AI coding agents on macOS"
  homepage "https://github.com/vmunix/spawn"
  url "https://github.com/vmunix/spawn/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "77259a8ffb6abf24a435e9daca1f282fd6a13498472b740bb774d8104c493700"
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
