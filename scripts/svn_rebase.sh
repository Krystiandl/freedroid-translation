#!/bin/bash

cd ${HOME}/src/freedroid-translation/dialogs
git svn rebase
cd ${HOME}/src/freedroid-translation/src
git svn rebase
cd ${HOME}/src/freedroid-translation/map
git svn rebase
cd ${HOME}/src/freedroid-translation/po
git pull
