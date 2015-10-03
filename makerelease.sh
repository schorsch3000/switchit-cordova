#!/bin/bash
set -e
BRANCH=$(git rev-parse --abbrev-ref HEAD)
git checkout version
git pull
ANDROID_VERSION=$(cat androidVersion)
NEXT_ANDROID_VERSION=$(($ANDROID_VERSION + 1))
echo $NEXT_ANDROID_VERSION >androidVersion
git commit androidVersion -m "bump android version to $NEXT_ANDROID_VERSION"
git push
git checkout $BRANCH
echo $NEXT_ANDROID_VERSION >androidVersion
xsltproc --stringparam version $NEXT_ANDROID_VERSION setAndroidVersion.xsl config.xml

false
cordova build android --release
cp platforms/android/build/outputs/apk/android-release-unsigned.apk .
jarsigner -keypass password -storepass password -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore ~/my-release-key.keystore android-release-unsigned.apk  alias_name
zipalign -f 4 android-release-unsigned.apk out.apk
