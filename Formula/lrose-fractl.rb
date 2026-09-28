

require 'formula'

class LroseFractl < Formula

  homepage 'https://github.com/mmbell/fractl'

  url 'https://github.com/NCAR/lrose-core/releases/download/lrose-core-20260926/lrose-fractl-20260926.src.tgz'
  version 'fractl-20260926'
  sha256 '94d76ebfc225e5417d3eded6075e0983523eb5ebbe7e20cd0f29efa2babe2cfc'

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build

  depends_on 'libzip'
  depends_on 'eigen'
  depends_on 'rsync'
  depends_on 'lrose-core'

  def install

    args = std_cmake_args + %w[
       -DCMAKE_VERBOSE_MAKEFILE=OFF
       -DCMAKE_RULE_MESSAGES=OFF
       -DCMAKE_MESSAGE_LOG_LEVEL=NOTICE
    ]

    ENV['LROSE_INSTALL_DIR'] = prefix

    system "cmake", "-S", ".", "-B", "build", *args, "-Wno-dev"
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"

  end

  def test
    system "#{bin}/fractl", "-h"
  end

end
