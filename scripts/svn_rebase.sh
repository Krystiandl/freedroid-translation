#!/bin/bash -x


export pref="${HOME}/src/freedroid_work/freedroid-translation"

cd ${pref}/dialogs
git svn rebase
cd ${pref}/src
git svn rebase
cd ${pref}/map
git svn rebase


cd ${pref}

#git commit src map dialogs -m "synchronization with the main repository"

#git pull
#git push
