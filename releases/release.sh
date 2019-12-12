echo "Use ./release.sh BETA-3"
cd ..
echo "Building android release"
ionic cordova build --release android
cd releases
echo "Done prepping apk signing"
mkdir $1
cp ../platforms/android/app/build/outputs/apk/release/app-release-unsigned.apk ./$1/app-release-unsigned.apk
jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore release-key.jks $1/app-release-unsigned.apk homebrewn-pedozi
~/Android/Sdk/build-tools/29.0.2/zipalign -v 4 $1/app-release-unsigned.apk $1/Pedozi-$1.apk
~/Android/Sdk/build-tools/29.0.2/zipalign -v 4 $1/app-release-unsigned.apk $1/Pedozi-$1-unsigned.apk
~/Android/Sdk/build-tools/29.0.2/apksigner verify $1/Pedozi-$1.apk
