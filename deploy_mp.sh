#! /bin/bash
echo '打包mp.jicu.vip'

BRANCH_NAME=master
echo '[start] git clone'
read -p "请输入分支名称（回车代表master）：" branch

if [ "$branch" != "" ]
then
	BRANCH_NAME=$branch
fi

echo "即将clone的分支名称为：$BRANCH_NAME"

git clone -b $BRANCH_NAME git@gitlab.com:superxzl/way-admin-manage.git
echo '[end] git clone'

echo '[start] cd way-admin-manage'
shopt -s expand_aliases
alias gotomp="cd way-admin-manage"
gotomp
unalias gotomp
shopt -u expand_aliases
echo '[end] cd way-admin-manage'

echo '[start] npm install'
npm install
echo '[end] npm install'

echo '[start] npm run build:prod'
npm run build:prod
echo '[end] npm run build:prod'

echo '[start] 部署到/apps/web/mp'
rm -rf /apps/web/mp
mv dist /apps/web/mp
echo '[end] 部署到/apps/web/mp'

echo '[start] rm -rf  dist way-admin-manage'
shopt -s expand_aliases
alias leavemp="cd .."
leavemp
unalias leavemp
shopt -u expand_aliases

rm -rf way-admin-manage
echo '[end] rm -rf  dist way-admin-manage'

echo '打包完成！'
