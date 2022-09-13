# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Kosli < Formula
  desc "CLI client for reporting compliance events to  https://kosli.com"
  homepage "https://kosli.com/"
  version "0.1.15"
  license "MIT"

  depends_on "go"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/kosli-dev/cli/releases/download/v0.1.15/kosli_0.1.15_darwin_amd64.tar.gz"
      sha256 "84051ab4749e4a37664aa43dc30ac24664ab153ce5a67eae5a5311ed7f88f95a"

      def install
        bin.install "kosli"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/kosli-dev/cli/releases/download/v0.1.15/kosli_0.1.15_darwin_arm64.tar.gz"
      sha256 "53b11be14d7a4ea9b889809c397a099ccca590bf84158f2c3cec9d2f58d5f905"

      def install
        bin.install "kosli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/kosli-dev/cli/releases/download/v0.1.15/kosli_0.1.15_linux_arm64.tar.gz"
      sha256 "80a8ad8f9ac1cf0b193197333174362c1df310f74c12fc41008518be7c620753"

      def install
        bin.install "kosli"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/kosli-dev/cli/releases/download/v0.1.15/kosli_0.1.15_linux_amd64.tar.gz"
      sha256 "482d0e5abe749d8577551050ee05bf8e886567bb443e1c0ede48e86d41cb28c5"

      def install
        bin.install "kosli"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/kosli-dev/cli/releases/download/v0.1.15/kosli_0.1.15_linux_armv6.tar.gz"
      sha256 "1aa772acdf53962e2ce91c30746fb06ca595c3535994bed4d9d10d19d91e6e44"

      def install
        bin.install "kosli"
      end
    end
  end

  test do
    system "#{bin}/kosli", "version"
    version_output = shell_output(bin/"kosli version 2>&1")
    assert_match "GitTreeState:\"clean\"", version_output

    if build.stable?
      revision = stable.specs[:revision]
      assert_match "GitCommit:\"#{revision}\"", version_output
      assert_match "Version:\"v#{version}\"", version_output
    end
  end
end
