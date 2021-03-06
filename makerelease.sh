#!/bin/bash
set -e
set -x
mv config.xml config.xml.old
xsltproc --stringparam version $(git log | wc -l) setAndroidVersion.xsl config.xml.old > config.xml
./init.sh
cordova build android --release
cp platforms/android/build/outputs/apk/android-release-unsigned.apk .
jarsigner -keypass password -storepass password -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore ~/my-release-key.keystore android-release-unsigned.apk  alias_name
zipalign -f 4 android-release-unsigned.apk out.apk
