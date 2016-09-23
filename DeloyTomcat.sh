TOMCAT='/mnt/service/apache-tomcat-8.0.37'
PROJECT='/mnt/project/ascmMall/ui'

echo "deploy ui"

pidList=`ps -ef|grep apache-tomcat-8.0.37|grep -v 'grep'|awk '{print $2'}`

if [ "$pidList" = "" ]; then

      echo "no tomcat pid alive"

else

  echo "tomcat id list :$pidList"
  kill -9 $pidList
  echo "kill $pidList"

fi

echo "svn update and clean complier and package"
cd $PROJECT&&svn update&&gradle clean&&gradle war

rm -rf $TOMCAT/webapps/ui.war && rm -rf $TOMCAT/webapps/ui

echo "copy to tomcat webApps "
cp build/libs/ui.war $TOMCAT/webapps/

echo "start tomcat ! Go Go Go!!!"
cd $TOMCAT && ./bin/startup.sh
