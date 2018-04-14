#!/bin/sh

# see youtrack-crack project
license=ring-license-checker-1.0.41.jar

ytk_jar=youtrack.jar
# ytk-temp
rm -rf ytk-temp
mkdir ytk-temp && cd ytk-temp
jar -xf ../$ytk_jar

# ytk-temp/hub-temp
hub_jar=`ls hub-*.war`
mkdir hub-temp && cd hub-temp
jar -xf ../$hub_jar
cd ..

# ytk-temp
find . -name 'ring-license-checker*.jar' | while read file; do
  rm -rf $file
  cp -f  ../$license $file
done

find .. -name 'ring-license-checker*.jar'| xargs md5sum

# ytk-temp/hub-temp
rm -rf $hub_jar
cd hub-temp
jar -cMf ../$hub_jar *
cd ..
rm -rf hub-temp

# 
crk=crk.$ytk_jar
jar -cMf ../$crk *
cd ..
rm -rf ytk-temp $ytk_jar
mv $crk $ytk_jar