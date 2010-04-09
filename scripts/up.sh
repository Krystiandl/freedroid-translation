#!/bin/sh

cd map ;
git svn rebase ;
cd ../src ;
git svn rebase ;
cd ../dialogs ;
git svn rebase ; 
<<<<<<< HEAD

cd ..
cd dialogs ;
for i in *.dialog ; do  # update the pot files for the dialogs
=======
cd ../dialogs ;
for i in *.dialog ; do  # update the pot files
>>>>>>> 7e3db529183206ec05472609aa0ce94aa9b3fd02
    ../extract-strings-from-data.py . "${i}" "../po/${i/.dialog/.pot}" ;
done ;

cd .. ;
cd map ;
for i in $(grep -l '_"' *) ; do # update the pot files for items and title files
    ../extract-strings-from-data.py . "${i}" "../po/${i}.pot" ;
done ;

cd .. ;
