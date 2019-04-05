
HINT_BENCHMARK_VERSION = origin/master
HINT_BENCHMARK_SITE = git://github.com/ironss/hint-benchmark.git

define HINT_BENCHMARK_BUILD_CMDS
    $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)
endef

define HINT_BENCHMARK_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/DOUBLE $(TARGET_DIR)/usr/bin/hint-double
    $(INSTALL) -D -m 0755 $(@D)/INT $(TARGET_DIR)/usr/bin/hint-int
    $(INSTALL) -D -m 0755 $(@D)/SHORT $(TARGET_DIR)/usr/bin/hint-short
    $(INSTALL) -D -m 0755 $(@D)/FLOAT $(TARGET_DIR)/usr/bin/hint-float
    $(INSTALL) -D -m 0755 $(@D)/LONGLONG $(TARGET_DIR)/usr/bin/hint-longlong
    $(INSTALL) -D -m 0755 $(HINT_BENCHMARK_PKGDIR)/hint-benchmark $(TARGET_DIR)/usr/bin/hint-benchmark
endef

$(eval $(generic-package))
