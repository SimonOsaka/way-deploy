echo '打包h5.jicu.vip'

echo '[start] git clone'
git clone git@gitlab.com:superxzl/way.git
echo '[end] git clone'

echo '[start] cd way'
cd way
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
cd ..
rm -rf way
echo '[end] rm -rf way'

echo '打包完成！'
