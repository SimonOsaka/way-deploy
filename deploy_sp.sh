echo '打包sp.jicu.vip'

BRANCH_NAME=master
echo '[start] git clone...'
read -p "请输入分支名称（回车代表master）：" branch
if [ "$branch" != "" ]
then
	BRANCH_NAME=$branch
fi

echo "即将clone的分支名称为：$BRANCH_NAME"

git clone -b $BRANCH_NAME git@gitlab.com:superxzl/way-admin-shop.git
echo '[end] git clone...'

echo '[start] cd way-admin-shop...'
shopt -s expand_aliases
alias gotosp="cd way-admin-shop"
gotosp
unalias gotosp
shopt -u expand_aliases
echo '[end] cd way-admin-shop...'

echo '[start] npm install...'
npm install
echo '[end] npm install...'

echo '[start] npm run build...'
npm run build
echo '[end] npm run build...'

echo '[start] 部署到/apps/web/sp'
rm -rf /apps/web/sp
mv dist /apps/web/sp
echo '[end] 部署到/apps/web/sp'

echo '[start] rm -rf  dist way-admin-shop'
shopt -s expand_aliases
alias leavesp="cd .."
leavesp
unalias leavesp
shopt -u expand_aliases

rm -rf way-admin-shop
echo '[end] rm -rf  dist way-admin-shop'

echo '打包完成！'
