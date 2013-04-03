This project contains scripts for building emulator kernels.
The build script included compiles variants
- with TUN/TAP support compiled in
- with TUN/TAP support as module
- with no TUN/TAP and module support.

It also contains a script for installing a su application onto the
emulator. It can be used by a developer or in automated test
environments.

A precompiled version of su and Superuser.apk is included in the su
directory. For an explanation on how to compile su see (3).


Sources:

(1) Code a World, building android custom kernel for emulator
    http://pengliang.is-programmer.com/2011/7/1/android_kernel_buiding.27708.html

(2) AOSP, Building Kernels
    http://source.android.com/source/building-kernels.html
    git clone https://android.googlesource.com/kernel/goldfish
    git clone https://android.googlesource.com/platform/prebuilt

(3) github, koush / Superuser
    https://github.com/koush/Superuser

(4) Android NDK
    http://developer.android.com/tools/sdk/ndk/index.html
    http://dl.google.com/android/ndk/android-ndk-r8e-linux-x86.tar.bz2

