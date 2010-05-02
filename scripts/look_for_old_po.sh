cd ../po

for i in $(cat ../scripts/lang.txt) ; do
#   pwd
    cd ${i}/LC_MESSAGES/ 
#   pwd
    for j in *.po ; do
        if [ ! -f ../../${j/.po/.pot} ] ; then 
            echo "${i}/LC_MESSAGES/${j/.pot/.po}"
#           ls ../../${j/.po/.pot}
        fi 
    done
    cd ../..
#   pwd
done
