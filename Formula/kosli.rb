# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Kosli < Formula
  desc "CLI client for reporting compliance events to  https://kosli.com"
  homepage "https://kosli.com/"
  version "0.1.18"
  license "MIT"

  depends_on "go"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/kosli-dev/cli/releases/download/v0.1.18/kosli_0.1.18_darwin_amd64.tar.gz"
      sha256 "993959b7e206f3c43b83403235d1a397ad40c8fc9fed61f03dd0f73295a8009c"

      def install
        bin.install "kosli"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/kosli-dev/cli/releases/download/v0.1.18/kosli_0.1.18_darwin_arm64.tar.gz"
      sha256 "ce88dd5b7f9cb7f287aa59ca61e1c54ec76ac737940a907dc7b812705ea7bc2d"

      def install
        bin.install "kosli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/kosli-dev/cli/releases/download/v0.1.18/kosli_0.1.18_linux_armv6.tar.gz"
      sha256 "4d43d57f888aff5de78274d095b8a3e8fd39555b57f3d0f47d7c9c74bf6676e5"

      def install
        bin.install "kosli"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/kosli-dev/cli/releases/download/v0.1.18/kosli_0.1.18_linux_amd64.tar.gz"
      sha256 "b583f77c59a98c32f176c4c814543f84c8f6fa2ad46403a7d64e2a11f030680f"

      def install
        bin.install "kosli"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/kosli-dev/cli/releases/download/v0.1.18/kosli_0.1.18_linux_arm64.tar.gz"
      sha256 "844a2d8a0ac241cdbd6aad04937357ecea237cc8b3b0bea8ec7bd6c7cd5c24a9"

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
