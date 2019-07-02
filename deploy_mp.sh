echo '打包mp.jicu.vip'

echo '[start] git clone'
git clone git@gitlab.com:superxzl/way-admin-manage.git
echo '[end] git clone'

echo '[start] cd way-admin-manage'
cd way-admin-manage
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
cd ..
rm -rf way-admin-manage
echo '[end] rm -rf  dist way-admin-manage'

echo '打包完成！'
