echo '打包sp.jicu.vip'

echo '[start] git clone...'
git clone git@gitlab.com:superxzl/way-admin-shop.git
echo '[end] git clone...'

echo '[start] cd way-admin-shop...'
cd way-admin-shop
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
cd ..
rm -rf way-admin-shop
echo '[end] rm -rf  dist way-admin-shop'

echo '打包完成！'
