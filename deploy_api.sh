#!/bin/bash

echo '打包api.jicu.vip'
BRANCH_NAME=master
echo '[start] git clone'
read -p "请输入分支名称（回车代表master）：" branch

if [ "$branch" != '' ]; 
	then
		BRANCH_NAME=$branch
fi
echo "即将clone的分支名称为：$BRANCH_NAME"
git clone -b $BRANCH_NAME git@gitlab.com:superxzl/way-api.git
echo '[end] git clone'

echo '[start] cd way-api'
shopt -s expand_aliases
alias gotoapi="cd way-api"
gotoapi
unalias gotoapi
shopt -u expand_aliases
echo '[end] cd way-api'

echo '[start] gradlew bootJar'
chmod +x gradlew
./gradlew bootJar
echo '[end] gradlew bootJar'

echo '[start] 部署到/apps/java'
rm -rf /apps/java/*.jar
mv build/libs/on_the_way-*.jar /apps/java/api.jar
echo '[end] 部署到/apps/java'

echo '[start] rm -rf way-api'
shopt -s expand_aliases
alias leaveapi="cd .."
leaveapi
unalias leaveapi
shopt -u expand_aliases

rm -rf way-api
echo '[end] rm -rf way-api'

echo '打包完成！手动启动'
