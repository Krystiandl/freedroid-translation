#!/bin/bash

cd ${HOME}/src/freedroid-translation/dialogs
git svn rebase
cd ${HOME}/src/freedroid-translation/src
git svn rebase
cd ${HOME}/src/freedroid-translation/map
git svn rebase
cd ${HOME}/src/freedroid-translation/po

cd ${HOME}/src/freedroid-translation
git commit src map dialogs -m "synchronization with the main repository"

git pull
git push
