

require 'formula'

class LroseSamurai < Formula

  homepage 'https://github.com/mmbell/samurai'

  url 'https://github.com/NCAR/lrose-core/releases/download/lrose-core-20260926/lrose-samurai-20260926.src.tgz'
  version 'samurai-20260926'
  sha256 '10a36490c025892706f0ae7ab753695d78d9dc0a4ce8410e6a77242d390fc9e8'

  depends_on 'hdf5' => 'enable-cxx'
  depends_on 'netcdf' => 'enable-cxx-compat'
  depends_on 'libx11'
  depends_on 'libxext'
  depends_on 'qt6'
  depends_on 'fftw'
  depends_on 'libomp'
  depends_on 'libzip'
  depends_on 'cmake'
  depends_on 'eigen'
  depends_on 'rsync'
  depends_on 'lrose-core'

  def install

    # Build/install samurai
    ENV['LROSE_INSTALL_DIR'] = prefix
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "."
    system "make install"

  end

  def test
    system "#{bin}/samurai", "-h"
  end

end
