
COREMARK_VERSION = origin/master
COREMARK_SITE = git://github.com/eembc/coremark.git

define COREMARK_BUILD_CMDS
    $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) \
        PORT_DIR=$(BR2_PACKAGE_COREMARK_PORTDIR) \
        ITERATIONS=$(BR2_PACKAGE_COREMARK_ITERATIONS) \
        XCFLAGS=$(BR2_PACKAGE_COREMARK_XCFLAGS) \
        EXE="" \
        coremark
endef

define COREMARK_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/coremark $(TARGET_DIR)/usr/bin/coremark
endef

$(eval $(generic-package))
