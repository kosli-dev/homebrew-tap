# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Kosli < Formula
  desc "CLI client for reporting compliance events to  https://kosli.com"
  homepage "https://kosli.com/"
  version "0.1.17"
  license "MIT"

  depends_on "go"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/kosli-dev/cli/releases/download/v0.1.17/kosli_0.1.17_darwin_amd64.tar.gz"
      sha256 "ec6fe351babc242ac8b46d7a05ebf10ee324e10690d18a2d9241580df25923be"

      def install
        bin.install "kosli"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/kosli-dev/cli/releases/download/v0.1.17/kosli_0.1.17_darwin_arm64.tar.gz"
      sha256 "d2180f638256edc22566abba04c0170d46e5f3e37ecfbbf11174bfc3b6ec5a26"

      def install
        bin.install "kosli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/kosli-dev/cli/releases/download/v0.1.17/kosli_0.1.17_linux_amd64.tar.gz"
      sha256 "fb597b878160dad0e46855bd9b12f1d14d706c3fc4487bbdb56141d0ff5e78a6"

      def install
        bin.install "kosli"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/kosli-dev/cli/releases/download/v0.1.17/kosli_0.1.17_linux_arm64.tar.gz"
      sha256 "fc6f909e05b7d2368eebe055c88e1199f09b3a44b0195ecd59e4fd640e68d8cf"

      def install
        bin.install "kosli"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/kosli-dev/cli/releases/download/v0.1.17/kosli_0.1.17_linux_armv6.tar.gz"
      sha256 "d6b1a4f04378508f784d84c42126582b825f43ca212eee302f679440f4863bce"

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
