ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = WelcomeTweak
WelcomeTweak_FILES = Tweak.xm
WelcomeTweak_CFLAGS = -fobjc-arc

include $(THEOS)/makefiles/tweak.mk