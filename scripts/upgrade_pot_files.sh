#!/bin/sh
# this script upgrade the pot files for the translatable files
# listed below

# update the pot files for any msg string in the dialogs directory

# go in the dialogs directory
export pref=${HOME}/src/freedroid_work/freedroid-translation/
cd ${pref}dialogs ;

for i in *.dialog ; do  # update the pot files
    echo "extracting translatable strings in ${i}"
    ../scripts/extract-strings-from-data.py . "${i}" "../po/${i/.dialog/.pot}" ;
    if !  $(msgfmt -c "../po/${i/.dialog/.pot}")  ; then
        echo "../po/${i/.dialog/.pot} is broken"
        mv -v "../po/${i/.dialog/.pot}" "../po/${i/.dialog/.pot.broken}"
    fi
done ;

# update the pot files for any msg strings in the map directory

# go in the map directory
cd ${pref}map

# 
for i in $(grep -l '_"' *) ; do # update the pot files for items and title files
    echo "extracting translatable strings in ${i}"
    ../scripts/extract-strings-from-data.py . "${i}" "../po/${i}.pot" ;
    if ! $(msgfmt -c "../po/${i}.pot") ; then
        echo "../po/${i}.pot is broken"
        mv -v "../po/${i}.pot" "../po/${i}.pot.broken"
    fi
done ;

echo "update pot files done"
cd ${pref}
