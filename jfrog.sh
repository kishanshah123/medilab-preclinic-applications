rm -f *.war*
server=http://54.197.68.227:8082/artifactory 
repo=libs-snapshot-local 
userName=admin 
password=Najafgarh@2020 
name=medilab-morning-preclinic-war 
artifact=com/medilab/$name/0.0.1-SNAPSHOT 
path=$server/$repo/$artifact 
ext=$(curl -u "admin":"Najafgarh@2020" $path/maven-metadata.xml | grep '<value>' | tail -1 | sed "s/<*value*>//g" | sed "s/<\///g" | sed "s/ //g") 
build=$(curl -u "admin":"Najafgarh@2020" $path/maven-metadata.xml | grep '<extension>' | tail -1 | sed "s/<*extension*>//g" | sed "s/<\///g" | sed "s/ //g") 
artifact_name=$name-$ext.$build 
url=$path/$artifact_name 
wget  --user=$userName --password=$password $url
