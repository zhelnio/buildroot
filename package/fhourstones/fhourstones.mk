
FHOURSTONES_VERSION = origin/master
FHOURSTONES_SITE = git://github.com/qu1j0t3/fhourstones.git

FHOURSTONES_SHARE = /usr/share/fhourstones

define FHOURSTONES_BUILD_CMDS
    $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
    echo "#!/bin/sh" > $(@D)/fhourstones
    echo "SearchGame < $(FHOURSTONES_SHARE)/inputs" >> $(@D)/fhourstones
endef

define FHOURSTONES_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/SearchGame $(TARGET_DIR)/usr/bin/SearchGame
    $(INSTALL) -D -m 0644 $(@D)/inputs $(TARGET_DIR)$(FHOURSTONES_SHARE)/inputs
    $(INSTALL) -D -m 0755 $(@D)/fhourstones $(TARGET_DIR)/usr/bin/fhourstones
endef

$(eval $(generic-package))
