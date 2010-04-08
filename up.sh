#!/bin/sh

cd map ;
git svn rebase ;
cd ../src ;
git svn rebase ;
cd ../dialogs ;
git svn rebase ; 
cd ../dialogs ;
for i in *.dialog ; do  # update the pot files
    ../extract-strings-from-data.py . "${i}" "../po/${i/.dialog/.pot}" ;
done ;

git commit -a
git push
