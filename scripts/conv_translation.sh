#!/bin/bash
# this script convert all the po files of the translation 
# from the encoding X to the encoding given as first argument

cd ..
cd po

for lang in $(cat ../scripts/lang.txt) ; do # all the po files
    for po_file in ${lang}/LC_MESSAGES/*.po ; do # all the po files
        msgconv  -o ${po_file}.tmp -t UTF-8 -w 72 ${po_file} 
        mv -v ${po_file}.tmp ${po_file}
    done ;
done ;

