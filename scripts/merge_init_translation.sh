#!/bin/bash

# aims to merge the initial translation with the new po files
# dialog part
# the initial translation contains four language translation
# with an english source


for lang in "fr_FR" "sv_SE" "ru_RU" "de_DE" ; do
     
    cd .. ;
    echo "For the language ${lang}"
    # the initial .po file containing the initial dialog translation
    # is called freedroidrpg.po
    cd dialogs ;
    echo "in $(pwd)" ;
    
    for i in *.dialog ; do
        ../scripts/extract-strings-from-data.py "$(pwd)" "${i}" ../po/${i/.dialog/.pot} ;
        msgmerge ../po/${lang}/LC_MESSAGES/freedroidrpg_dialogs.po ../po/${i/.dialog/.pot} > ../po/${lang}/LC_MESSAGES/${i/.dialog/.po} ;
    done ;

    # item part
    cd .. ;

    # the initial .po file containing the initial translation is 
    # called freedroidrpg_data.po
    cd map ;
    echo "in $(pwd)" ;

    for i in $(grep -l '_"' *) ; do
        ../scripts/extract-strings-from-data.py "$(pwd)" "${i}" ../po/${i}.pot
        msgmerge  ../po/${lang}/LC_MESSAGES/freedroidrpg_data.po ../po/${i}.pot > ../po/${lang}/LC_MESSAGES/${i}.po ;
    done ;

done ;    
