include $(THEOS)/makefiles/common.mk



ARCHS = arm64 arm64e

TARGET = iphone:clang:13.2:13.2

BUNDLE_NAME = Bonzipref
Bonzipref_FILES = BonziRootListController.m HBAppearanceSettings.m
Bonzipref_INSTALL_PATH = /Library/PreferenceBundles
Bonzipref_FRAMEWORKS = UIKit

Bonzipref_PRIVATE_FRAMEWORKS = Preferences
Bonzipref_EXTRA_FRAMEWORKS = Cephei CepheiPrefs

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/Bonzipref.plist$(ECHO_END)
