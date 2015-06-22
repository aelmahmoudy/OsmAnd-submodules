#!/bin/sh

WRAPPER_SUBDIR="core/android/wrapper"

err() {
	echo ERROR: "$@"
	exit 1
}

if [ -d $WRAPPER_SUBDIR ]
then
	cd $WRAPPER_SUBDIR || err "Could not enter $WRAPPER_SUBBDIR subdirectory"
fi
sed -i -e "/Native/ d" settings.gradle build.gradle
SWIG=/usr/bin/swig3.0 gradle compileDebugJava

