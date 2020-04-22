set(PKG_NAME "alsa-lib")
set(PKG_VERSION "1.1.4.1")
set(PKG_SHA256 "91bb870c14d1c7c269213285eeed874fa3d28112077db061a3af8010d0885b76")
set(PKG_ARCHIVE "${PKG_NAME}-${PKG_VERSION}.tar.bz2")
set(PKG_DEPENDS_TARGET "toolchain")
set(PKG_TOOLCHAIN "autotools")

set(PKG_CONFIGURE_OPTS_TARGET "--with-alsa-devdir=/dev/snd/"
                              "--with-plugindir=${INSTALL_PREFIX_TARGET}/lib/alsa-lib"
                              "--with-configdir=${INSTALL_PREFIX_TARGET}/share/alsa"
                              "--with-ctl-plugins=ext"
                              "--with-pcm-plugins=\"copy,linear,route,mulaw,alaw,adpcm,rate,plug,multi,file,null,empty,share,meter,hooks,lfloat,ladspa,asym,iec958,softvol,extplug,ioplug,mmap_emul\""
                              "--disable-resmgr"
                              "--enable-aload"
                              "--enable-mixer"
                              "--enable-pcm"
                              "--enable-rawmidi"
                              "--enable-hwdep"
                              "--disable-seq"
                              "--disable-alisp"
                              "--disable-old-symbols"
                              "--disable-python"
                              "--with-softfloat=yes"
                              "--with-libdl=yes"
                              "--with-pthread=yes"
                              "--with-librt=no"
                              "--enable-shared")

