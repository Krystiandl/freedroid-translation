#!/bin/sh
# this script upgrade the pot files for the translatable files
# listed below
cd .. ;

cd map ;
git svn rebase ;
cd ../src ;
git svn rebase ;
cd ../dialogs ;
git svn rebase ; 

# update the pot files for any msg string in the dialogs directory
cd ..
cd dialogs ;
for i in *.dialog ; do  # update the pot files
    ../scripts/extract-strings-from-data.py . "${i}" "../po/${i/.dialog/.pot}" ;
done ;

# update the pot files for any msg strings in the map directory
cd .. ;
cd map ;
for i in $(grep -l '_"' *) ; do # update the pot files for items and title files
    ../scripts/extract-strings-from-data.py . "${i}" "../po/${i}.pot" ;
done ;

cd .. ;
echo "update pot files done"
