ARCHS = arm64 
THEOS_PLATFORM_DEB_COMPRESSION_TYPE = xz
TARGET = iphone:13.6

FINALPACKAGE = 1
FOR_RELEASE = 1
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Key

$(TWEAK_NAME)_FRAMEWORKS =  UIKit Accelerate Foundation QuartzCore CoreGraphics AudioToolbox CoreText Metal MobileCoreServices Security SystemConfiguration Webkit IOKit CoreTelephony CoreImage CFNetwork AdSupport AVFoundation
$(TWEAK_NAME)_CFLAGS = -fobjc-arc -fvisibility=hidden -Wno-deprecated-declarations -Wno-unused-variable  -Wno-unused-value
$(TWEAK_NAME)_LDFLAGS+= libAPIPP.a 
$(TWEAK_NAME)_CCFLAGS = -fobjc-arc -fvisibility=hidden -std=c++11
$(TWEAK_NAME)_FILES = key.xm
$(TWEAK_NAME)_LOGOS_DEFAULT_GENERATOR = internal

include $(THEOS_MAKE_PATH)/tweak.mk