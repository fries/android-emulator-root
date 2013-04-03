#!/bin/bash

adb remount
adb push apk/su /system/xbin/su
#adb shell chmod 06755 /system  
adb shell chmod 06755 /system/xbin/su   
adb install -r apk/Superuser-debug.apk

