#!/bin/sh

echo "------------> Build iOS"
scriptPath=`dirname $0`

cp "$CONFIGURATION_BUILD_DIR"/lib"$PROJECT_NAME".a "$scriptPath"/../out/AppodealDevice.a

source $scriptPath/build.sh