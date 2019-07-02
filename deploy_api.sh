echo '打包api.jicu.vip'

echo '[start] git clone'
git clone git@gitlab.com:superxzl/way-api.git
echo '[end] git clone'

echo '[start] cd way-api'
cd way-api
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
cd ..
rm -rf way-api
echo '[end] rm -rf way-api'

echo '打包完成！手动启动'
