#!/bin/bash

# first argument : old name of the dialog file
# second argument : new name of the dialog file.

for lang in $(cat lang.txt)  ; do 
    msgmerge -v ../po/${lang}/LC_MESSAGES/${1}.po  ../po/${2}.pot  > ../po/${lang}/LC_MESSAGES/${2}.po ; 
    git rm  ../po/${lang}/LC_MESSAGES/${1}.po
done ;

git rm ../po/${1}.pot
