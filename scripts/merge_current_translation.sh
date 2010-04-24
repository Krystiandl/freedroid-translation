#!/bin/bash

# aims to merge the initial translation with the new po files
# dialog part
# the initial translation contains four language translation
# with an english source

# extract the translation

./svn_rebase.sh

cd ..
cd dialogs ;
echo "in $(pwd)" ;

for i in *.dialog ; do
    ../scripts/extract-strings-from-data.py "$(pwd)" "${i}" ../po/${i/.dialog/.pot} ;
done ;

cd .. ;
cd map ;  
echo "in $(pwd)" ;

for i in $(grep -l '_"' *) ; do
    ../scripts/extract-strings-from-data.py "$(pwd)" "${i}" ../po/${i}.pot
done ;

git commit -a -m "update of the pot files from the dialogs/ and map/ directory"

# merge the translation with the new pots files

for lang in "fr" "sv" "ru" "de" "bn" "ar" "el" ; do

    echo "For the language ${lang}"
    cd .. ;

    # updating the .po files for the dialogs (dialogs/ directory)
    cd dialogs ;
    echo "in $(pwd)" ;
    
    for i in *.dialog ; do
        msgmerge  ../po/${lang}/LC_MESSAGES/${i/.dialog/.po}  ../po/${i/.dialog/.pot} > ../po/${lang}/LC_MESSAGES/${i/.dialog/.po}.tmp ;
        mv -v ../po/${lang}/LC_MESSAGES/${i/.dialog/.po}.tmp ../po/${lang}/LC_MESSAGES/${i/.dialog/.po}
    done ;

    git commit -a -m "Merge the translation with new pot files from the dialogs/directory and lang ${lang}" ;
    # item part
    

    cd .. ;

    # updating the .po files for the items (map/ directory)
    cd map ;
    echo "in $(pwd)" ;

    for i in $(grep -l '_"' *) ; do
        msgmerge  ../po/${lang}/LC_MESSAGES/${i}.po ../po/${i}.pot > ../po/${lang}/LC_MESSAGES/${i}.po.tmp ;
        mv -v ../po/${lang}/LC_MESSAGES/${i}.po.tmp ../po/${lang}/LC_MESSAGES/${i}.po
    done ;

    git commit -a -m "Merge the translation with new pot files from the map/ directory and lang ${lang}" ;

done ;    
