

require 'formula'

class LroseVortrac < Formula

  homepage 'https://github.com/mmbell/vortrac'

  url 'https://github.com/NCAR/lrose-core/releases/download/lrose-core-20250811/lrose-vortrac-20250811.src.tgz'
  version 'vortrac-20250811'
  sha256 'abbf4eee622c5b62eb80abaa883074aef4ee379089da786453019a89f5569bf7'

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
