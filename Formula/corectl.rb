class Corectl < Formula
  desc "CLI tool for Core framework"
  homepage "https://github.com/xs23933/core"
  
  version "3.1.19"
  license "MIT"
  
  # 根据架构动态构建 URL
  if Hardware::CPU.intel?
    arch = "amd64"
  elsif Hardware::CPU.arm?
    arch = "arm64"
  end
  
  url "https://github.com/xs23933/core/releases/download/v#{version}/corectl_#{arch}"
  sha256 if Hardware::CPU.intel?
    "ceb9641221444e373c5ab0ec4d79033517432be8337238edf567be644ba3b2a2"
  elsif Hardware::CPU.arm?
    "c36694be23572ffe456d1cb3620b9fc2a8ab084cf8e71eae66afabae0e5183bc"
  end
  
  def install
    bin.install "corectl_#{Hardware::CPU.arch}" => "corectl"
  end
  
  test do
    system "#{bin}/corectl", "version"
  end
end