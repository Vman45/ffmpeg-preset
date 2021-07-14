#!/bin/bash

# How to execute (Install) 
# sudo bash ./install.bash

# How to execute (Uninstall)
# sudo bash ./install.bash uninstall

PROJECT_DIR=$(cd $(dirname $0); pwd)
BIN='/usr/local/bin'
BASH_FILES=${PROJECT_DIR}'/bash_files'

## Check superuser ======================================
if [ $(id -u) -ne 0 ]; then
    echo "You must execute this command as a superuser."
    echo "sudo bash ./install.bash or sudo bash ./install.bash uninstall"
    exit 1
fi

## UNINSTALL =============================================
if [ $# -ne 1 ]; then
    ## INSTALL =============================================

    for bash_file in $BASH_FILES/* ; do
        FILE=`basename $bash_file`
        echo "setting "$FILE"..."

        cp $bash_file $BIN/
        chmod +x $BIN/$FILE
    done

    exit 0
fi

if [ "uninstall" = $1 ]; then
    echo "uninstall ..."
    for bash_file in $BASH_FILES/* ; do
        FILE=`basename $bash_file`
        echo "uninstall "$FILE"..."

        rm $BIN/$FILE
    done
    echo "uninstalled"
    exit 0
fi
