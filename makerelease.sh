#!/bin/bash
cordova build android --release
cp platforms/android/build/outputs/apk/android-armv7-release-unsigned.apk .
jarsigner -keypass password -storepass password -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore ~/my-release-key.keystore android-armv7-release-unsigned.apk  alias_name
zipalign -f 4 android-armv7-release-unsigned.apk out.apk
