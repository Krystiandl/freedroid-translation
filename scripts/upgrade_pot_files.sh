#!/bin/sh
# this script upgrade the pot files for the translatable files
# listed below

# update the pot files for any msg string in the dialogs directory
cd ${HOME}/src/freedroid-translation/dialogs ;
for i in *.dialog ; do  # update the pot files
    ../scripts/extract-strings-from-data.py . "${i}" "../po/${i/.dialog/.pot}" ;
done ;

# update the pot files for any msg strings in the map directory
cd ${HOME}/src/freedroid-translation/map
for i in $(grep -l '_"' *) ; do # update the pot files for items and title files
    ../scripts/extract-strings-from-data.py . "${i}" "../po/${i}.pot" ;
done ;

echo "update pot files done"
