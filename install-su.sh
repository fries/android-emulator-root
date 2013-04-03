#!/bin/bash

adb remount
adb push su/su /system/xbin/su
#adb shell chmod 06755 /system  
adb shell chmod 06755 /system/xbin/su   
adb install -r su/Superuser-debug.apk

