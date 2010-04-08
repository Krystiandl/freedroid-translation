#!/bin/sh

cd map ;
git svn rebase ;
cd ../src ;
git svn rebase ;
cd ../dialogs ;
git svn rebase ; 
cd ..
git commit -a
git push
