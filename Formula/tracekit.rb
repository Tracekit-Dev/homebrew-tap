class Tracekit < Formula
  desc "TraceKit CLI - Zero-friction APM setup for modern applications"
  homepage "https://tracekit.dev"
  version "2.0.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Tracekit-Dev/cli/releases/download/v2.0.4/tracekit-darwin-arm64"
      sha256 "b41ff5f6ff8b81bfb45d6fca087847153a186751f4104f6ddd6f307288b72423"
    else
      url "https://github.com/Tracekit-Dev/cli/releases/download/v2.0.4/tracekit-darwin-amd64"
      sha256 "f33ec670fb5e2c894005c0576418e2b7987256ece8304caad196584f072ebe1e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Tracekit-Dev/cli/releases/download/v2.0.4/tracekit-linux-arm64"
      sha256 "7760946a413d7a380fc3bda4abf658874b2492694865f8092dd75f21cae25d0e"
    else
      url "https://github.com/Tracekit-Dev/cli/releases/download/v2.0.4/tracekit-linux-amd64"
      sha256 "fcae95a935267cde7531eaf1d087b0cb5b73f82e9036c01fece2a994eefc3665"
    end
  end

  def install
    bin.install "tracekit-darwin-arm64" => "tracekit" if OS.mac? && Hardware::CPU.arm?
    bin.install "tracekit-darwin-amd64" => "tracekit" if OS.mac? && Hardware::CPU.intel?
    bin.install "tracekit-linux-arm64" => "tracekit" if OS.linux? && Hardware::CPU.arm?
    bin.install "tracekit-linux-amd64" => "tracekit" if OS.linux? && Hardware::CPU.intel?
  end

  test do
    system "#{bin}/tracekit", "--version"
  end
end
