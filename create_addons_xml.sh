#!/bin/bash

addons_file=humla_repo/addons.xml
md5_file=$addons_file.md5

echo "Creating new addons.xml file in " $addons_file
echo '<?xml version="1.0" encoding="UTF-8"?>' > $addons_file

echo "<addons>" >> $addons_file
for plugin in `ls -d */`
do
    if [ -f $plugin/addon.xml ]
    then
        if [ ! -f  $plugin/pre_release ]
        then 
             echo "Adding " $plugin
            tail -n +2  $plugin/addon.xml >> $addons_file
        fi
    fi
done
echo "</addons>" >> $addons_file

echo "Generating checksum file in " $md5_file
md5 -r $addons_file > $md5_file
echo "Successfully completed operation "
