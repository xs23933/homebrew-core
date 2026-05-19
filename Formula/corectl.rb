class Corectl < Formula
  desc "CLI tool for Core framework"
  homepage "https://github.com/xs23933/core"
  
  version "3.1.19"
  license "MIT"
  
  if Hardware::CPU.intel?
    url "https://github.com/xs23933/core/releases/download/v3.1.19/corectl_amd64"
    sha256 "ceb9641221444e373c5ab0ec4d79033517432be8337238edf567be644ba3b2a2"
  elsif Hardware::CPU.arm?
    url "https://github.com/xs23933/core/releases/download/v3.1.19/corectl_arm64"
    sha256 "c36694be23572ffe456d1cb3620b9fc2a8ab084cf8e71eae66afabae0e5183bc"
  end
  
  def install
    # 根据架构使用正确的源文件名
    if Hardware::CPU.intel?
      bin.install "corectl_amd64" => "corectl"
    elsif Hardware::CPU.arm?
      bin.install "corectl_arm64" => "corectl"
    end
  end
  
  test do
    system "#{bin}/corectl", "version"
  end
end