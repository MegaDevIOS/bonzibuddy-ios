

ARCHS = arm64 arm64e

TARGET = iphone:clang:13.2:13.2



export GO_EASY_ON_ME=1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = bonzibuddy


include $(THEOS)/makefiles/bundle.mk
bonzibuddy_FILES = Tweak.xm
$(TWEAK_NAME)_EXTRA_FRAMEWORKS += WebKit Cephei


SUBPROJECTS += bonzipref
bonzibuddy_CFLAGS = -fobjc-arc
include $(THEOS_MAKE_PATH)/tweak.mk


include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard"
