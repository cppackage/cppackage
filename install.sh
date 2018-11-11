#!/usr/bin/env bash


# copy files to local directory
if [ -z $1 ]; then
    INSTALLATION_DIRECTORY=~/.cppackage
else
    INSTALLATION_DIRECTORY=$1
fi
mkdir $INSTALLATION_DIRECTORY
cp cppackage $INSTALLATION_DIRECTORY


# make commands executable
if [ -z $2 ]; then
    BASHRC=~/.bashrc
else
    BASHRC=$2
fi
PATH_COMMAND="export PATH=\$PATH:$INSTALLATION_DIRECTORY # make cppackage executable from anywhere"
if [ -z `grep "$PATH_COMMAND" "$BASHRC"` ]; then
    echo >> $BASHRC
    echo "$PATH_COMMAND" >> $BASHRC
fi
