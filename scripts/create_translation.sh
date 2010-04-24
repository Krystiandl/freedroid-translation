#!/bin/bash

cd ..
cd po/

echo "for the language code ${1}"
pwd
if [ ! -d "${1}/LC_MESSAGES" ]; then 
    mkdir "${1}" ;
    mkdir "${i}/LC_MESSAGES" ;
fi ;

for i in *.pot ; do  # on all the pot files 

    msginit -i "${i}" -o "${1}/LC_MESSAGES/${i/.pot/.po}" -l ${1} -w 72 --no-translator ;

done ;
