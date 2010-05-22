#!/bin/bash


cd ${HOME}/src/freedroid-translation/po/

echo "for the language code ${1}"

if [ ! -d "${1}" ]; then 
    mkdir "${1}" ;
fi ;

if [ ! -d "${1}/LC_MESSAGES" ] ; then
    mkdir "${1}/LC_MESSAGES"
fi ;
        
for i in *.pot ; do  # on all the pot files 

    msginit -i "${i}" -o "${1}/LC_MESSAGES/${i/.pot/.po}" -l ${1} -w 72 --no-translator ;

done ;
