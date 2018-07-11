./liquibase \
--driver=com.mysql.cj.jdbc.Driver \
--classpath=mysql-connector-java-8.0.11.jar \
--changeLogFile=./changelog/2018-05-18-09-38-44.changelog.xml \
--url=jdbc:mysql://192.168.102.136:32768/mydb?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8&useSSL=false \
--username=root \
--password=root \
generateChangeLog
