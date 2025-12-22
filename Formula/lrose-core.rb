

require 'formula'

class LroseCore < Formula

  homepage 'https://github.com/NCAR/lrose-core'

  url 'https://github.com/NCAR/lrose-core/releases/download/lrose-core-20250811/lrose-core-20250811.src.mac_osx.tgz'
  version 'core-20250811'
  sha256 'f012a22f171228efca4461af1209406c7e0608d67e2dc5f1381a0535abee34d6'
  license 'BSD'

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build

  depends_on 'hdf5'
  depends_on 'netcdf'
  depends_on 'udunits'
  depends_on 'fftw'
  depends_on 'flex'
  depends_on 'jpeg'
  depends_on 'libpng'
  depends_on 'libzip'
  depends_on 'qt6'
  depends_on 'rsync'
  depends_on 'libx11'
  depends_on 'libxext'

  def install

    args = std_cmake_args + %w[
       -DCMAKE_VERBOSE_MAKEFILE=OFF
       -DCMAKE_RULE_MESSAGES=OFF
       -DCMAKE_MESSAGE_LOG_LEVEL=NOTICE
    ]

    system "cmake", "-S", ".", "-B", "build", *args, "-Wno-dev"
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
    (share).install "share"

  end

#    # install the color scales
#    system "rsync", "-av", "share", "#{prefix}"

  def test
    system "#{bin}/RadxPrint", "-h"
  end

end
