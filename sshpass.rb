require 'formula'

class Sshpass < Formula
  desc 'The sshpass utility helps administrators more easily manage SSH connections in scripts.'
  version '1.09.1'
  url 'https://github.com/dora38/sshpass.git', :branch => 'main', :using => :git
  homepage 'http://sourceforge.net/projects/sshpass'
  license 'MIT'
  depends_on 'autoconf' => :build
  depends_on 'automake' => :build

  def install
    system "./bootstrap"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make install"
  end

  def test
    system "sshpass"
  end
end