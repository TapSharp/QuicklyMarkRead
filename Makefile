TWEAK_NAME = QuicklyMarkRead

QuicklyMarkRead_FILES = $(wildcard src/*.x)
QuicklyMarkRead_FRAMEWORKS = UIKit

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 MobileSMS"
