echo 'apk打包开始'

BRANCH_NAME=master
echo '[start] git clone'
read -p "请输入分支名称（回车代表master）：" branch

if [ "$branch" != "" ]
then
	BRANCH_NAME=$branch
fi

echo "即将clone的分支名称为：$BRANCH_NAME"

git clone -b $BRANCH_NAME git@gitlab.com:superxzl/way-app-ios.git
echo '[end] git clone'

echo '[start] cd way-app-ios/platforms/android'
shopt -s expand_aliases
alias gotoapp="cd way-app-ios/platforms/android"
gotoapp
unalias
shopt -u expand_aliases
echo '[end] cd way-app-ios/platforms/android'

echo '[start] gradlew assembleDevelopRelease'
chmod +x gradlew
./gradlew assembleDevelopRelease
echo '[end] gradlew assembleDevelopRelease'

echo '[start] 移动到android文件夹'
mv app/build/outputs/apk/develop/release/*.apk ../../../android
echo '[end] 移动到android文件夹'

echo '[start] rm -rf way-app-ios'
shopt -s expand_aliases
alias leaveapp="cd ../../../"
leaveapp
unalias leaveapp
shopt -u expand_aliases

rm -rf way-app-ios
echo '[end] rm -rf way-app-ios'

echo 'apk打包完成！'
