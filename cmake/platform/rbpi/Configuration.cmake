set(CORE_SYSTEM_NAME rbpi)
set(MESON_SYSTEM linux)

list(APPEND WITH_TARGET_CFLAGS "-pipe -mabi=aapcs-linux -Wno-psabi -Wa,-mno-warn-deprecated -Wno-deprecated-declarations -isystem${WITH_FIRMWARE}/opt/vc/include -isystem${WITH_FIRMWARE}/opt/vc/include/interface/vcos/pthreads -isystem${WITH_FIRMWARE}/opt/vc/include/interface/vmcs_host/linux")
list(APPEND WITH_TARGET_LDFLAGS "-L${WITH_FIRMWARE}/opt/vc/lib -lEGL -lGLESv2 -lbcm_host -lvcos -lvchiq_arm")
