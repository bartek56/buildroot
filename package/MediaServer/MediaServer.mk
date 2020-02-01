################################################################################
#
# MediaServer
#
################################################################################
#    $(HOST_DIR)/usr/bin/qmake -o Makefile $(@D)/MediaServer.pro
#    (cd $(@D); $(TARGET_MAKE_ENV) $(QT_QMAKE))
#    (cd $(@D); $(QT_QMAKE)  MediaServer.pro)
#MEDIASERVER_VERSION:= 1.0.0
#MEDIASERVER_SITE:= /home/programmer/Documents/MediaServer

MEDIASERVER_VERSION = v1.0.1
MEDIASERVER_SITE = $(call github,bartek56,MediaServer,$(MEDIASERVER_VERSION))
#MEDIASERVER_SITE_METHOD:=git
MEDIASERVER_INSTALL_STAGING = YES
MEDIASERVER_INSTALL_TARGET:=YES
MEDIASERVER_DEPENDENCIES = qt5quickcontrols

define MEDIASERVER_CONFIGURE_CMDS
	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake -o Makefile $(@D)/MediaServer.pro)
endef

define MEDIASERVER_BUILD_CMDS
    $(MAKE) -C $(@D)
endef

define MEDIASERVER_INSTALL_TARGET_CMDS
    install -D -m 0755 $(@D)/MediaServerApp/MediaServerApp $(TARGET_DIR)/usr/bin/MediaServer
endef

$(eval $(generic-package))
