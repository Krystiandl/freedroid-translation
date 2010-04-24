#!/bin/bash

for lang in "fr_FR" "sv_SE" "ru_RU" "de_DE" ; do 
    msgmerge -v ../po/${lang}/LC_MESSAGES/${1}.po  ../po/${2}.pot  > ../po/${lang}/LC_MESSAGES/${2}.po ; 
done ;
