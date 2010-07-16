#!/bin/bash

# aims to merge the initial translation with the new po files
# dialog part
# the initial translation contains four language translation
# with an english source

dir=${HOME}/src/freedroid-translation

cd ${dir}/

for lang in $(cat scripts/lang.txt) ; do
     
    echo *Merging language ${lang}
    cd ${dir}/po
    for i in *.pot ; do
    
        echo *Merging ${i} for language ${lang}
        msgmerge ${lang}/LC_MESSAGES/${i/.pot/.po} ${i} > ${lang}/LC_MESSAGES/${i/.pot/.po}.merged ;
        mv -v ${lang}/LC_MESSAGES/${i/.pot/.po}.merged  ${lang}/LC_MESSAGES/${i/.pot/.po}
        
    done ;

done ;    
