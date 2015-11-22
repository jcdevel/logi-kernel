#!/bin/sh

INSTALL=$1

if [ -z "$KERNEL_DIR" ]; then
	echo "Please set KERNEL_DIR variable"
	exit 1
fi

if [ -z "$CROSS_COMPILE" ]; then
        echo "Please set CROSS_COMPILE variable"
        exit 1
fi

if [ -z "$ARCH" ]; then
        echo "Please set ARCH variable"
        exit 1
fi


make CROSS_COMPILE=$CROSS_COMPILE ARCH=$ARCH -C $KERNEL_DIR M=$PWD modules

if [ "x$INSTALL" == "xinstall" ]; then
	sudo -E make CROSS_COMPILE=$CROSS_COMPILE ARCH=$ARCH -C $KERNEL_DIR M=$PWD INSTALL_MOD_PATH=$INSTALL_MOD_PATH modules_install
fi
