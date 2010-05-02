#!/bin/bash

for lang in $(cat lang.txt)  ; do 
    msgmerge -v ../po/${lang}/LC_MESSAGES/${1}.po  ../po/${2}.pot  > ../po/${lang}/LC_MESSAGES/${2}.po ; 
    rm -v ../po/${lang}/LC_MESSAGES/${1}.po
done ;
