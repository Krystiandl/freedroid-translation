cd ../po
for i in *.pot ; do 
    if [ ! -f ../dialogs/${i/.pot/.dialog} -a ! -f ../map/${i/.pot/} ] ; then 
        echo $i ; 
    fi ; 
done
