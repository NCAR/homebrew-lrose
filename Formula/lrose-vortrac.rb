

require 'formula'

class LroseVortrac < Formula

  homepage 'https://github.com/mmbell/vortrac'

  url 'https://github.com/NCAR/lrose-core/releases/download/lrose-core-20260926/lrose-vortrac-20260926.src.tgz'
  version 'vortrac-20260926'
  sha256 'd838b8f93d5a6c886c3037aa89022ae3a450d9511d5e3b4cc548a54db2d41b00'

  depends_on 'libx11'
  depends_on 'libxext'
  depends_on 'qt5'
  depends_on 'armadillo'
  depends_on 'libzip'
  depends_on 'cmake'
  depends_on 'rsync'
  depends_on 'lrose-core'

  def install

    # Build/install vortrac
    ENV['LROSE_INSTALL_DIR'] = prefix
    system "cmake", "-DCMAKE_INSTALL_PREFIX=#{prefix}", "."
    system "make install"

  end

  def test
    system "#{bin}/vortrac", "-h"
  end

end
