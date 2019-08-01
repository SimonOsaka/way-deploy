echo '打包h5.jicu.vip'

BRANCH_NAME=master
echo '[start] git clone'
read -p "请输入分支名称（回车代表master）：" branch
if [ "$branch" != "" ]
then
	BRANCH_NAME=$branch
fi

echo "即将clone的分支名称为：$BRANCH_NAME"
git clone -b $BRANCH_NAME git@gitlab.com:superxzl/way.git
echo '[end] git clone'

echo '[start] cd way'
shopt -s expand_aliases
alias gotoh5="cd way"
gotoh5
unalias gotoh5
shopt -u expand_aliases
echo '[end] cd way'

echo '[start] npm install'
npm install --unsafe-perm=true
echo '[end] npm install'

echo '[start] npm run pack:web'
npm run pack:web
echo '[end] npm run pack:web'

echo '[start] 部署到/apps/web/h5'
rm -rf /apps/web/h5
mv release/web /apps/web/h5
echo '[end] 部署到/apps/web/h5'

echo '[start] rm -rf way'
shopt -s expand_aliases
alias leaveh5="cd .."
leaveh5
unalias leaveh5
shopt -u expand_aliases

rm -rf way
echo '[end] rm -rf way'

echo '打包完成！'
