echo 'apk打包开始'

echo '[start] git clone'
git clone git@gitlab.com:superxzl/way-app-ios.git
echo '[end] git clone'

echo '[start] cd way-app-ios/platforms/android'
cd way-app-ios/platforms/android
echo '[end] cd way-app-ios/platforms/android'

echo '[start] gradlew assembleDevelopRelease'
chmod +x gradlew
./gradlew assembleDevelopRelease
echo '[end] gradlew assembleDevelopRelease'

echo '[start] 移动到android文件夹'
mv app/build/outputs/apk/develop/release/*.apk ../../../android
echo '[end] 移动到android文件夹'

echo '[start] rm -rf way-app-ios'
cd ../../../
rm -rf way-app-ios
echo '[end] rm -rf way-app-ios'

echo 'apk打包完成！'
