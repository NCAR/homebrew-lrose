

require 'formula'

class LroseFractl < Formula

  homepage 'https://github.com/mmbell/fractl'

  url 'https://github.com/NCAR/lrose-core/releases/download/lrose-core-20250811/lrose-fractl-20250811.src.tgz'
  version 'fractl-20250811'
  sha256 'af8a8bae52030687eb6d913d7cea78301ee473494749467bf7820872d69ace7f'

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
