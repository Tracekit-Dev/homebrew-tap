class Tracekit < Formula
  desc "TraceKit CLI - Zero-friction APM setup for modern applications"
  homepage "https://tracekit.dev"
  version "1.0.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Tracekit-Dev/cli/releases/download/v1.0.2/tracekit-darwin-arm64"
      sha256 "e480e4ede949ed4941b8666972f6d5eeeb0438629bfc3ce1bfafa5e81bca7f74"
    else
      url "https://github.com/Tracekit-Dev/cli/releases/download/v1.0.2/tracekit-darwin-amd64"
      sha256 "44d4767ffa9001b39195be1e8a341012fe10e16d45f3f2da19a45a5d1c99bb65"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Tracekit-Dev/cli/releases/download/v1.0.2/tracekit-linux-arm64"
      sha256 "4a67ef33cc73ad7996a4003b4a71b086feec8cf1cd5833a3b3e693db06929b87"
    else
      url "https://github.com/Tracekit-Dev/cli/releases/download/v1.0.2/tracekit-linux-amd64"
      sha256 "da3ac7ffb26b066adc500b69867fbc10c2f2b9dcc2236f4976049883dcde642f"
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
