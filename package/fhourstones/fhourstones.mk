
FHOURSTONES_VERSION = origin/master
FHOURSTONES_SITE = git://github.com/qu1j0t3/fhourstones.git

define FHOURSTONES_BUILD_CMDS
    $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
endef

define FHOURSTONES_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/SearchGame $(TARGET_DIR)/usr/bin/SearchGame
    $(INSTALL) -D -m 0644 $(@D)/inputs $(TARGET_DIR)/usr/share/fhourstones/inputs
    $(INSTALL) -D -m 0755 $(FHOURSTONES_PKGDIR)/fhourstones $(TARGET_DIR)/usr/bin/fhourstones
endef

$(eval $(generic-package))
