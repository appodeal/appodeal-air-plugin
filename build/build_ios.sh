#!/bin/sh

echo "------------> Build iOS"
scriptPath=`dirname $0`

cp "$CONFIGURATION_BUILD_DIR"/lib"$PROJECT_NAME".a "$scriptPath"/../out/AppodealDevice.a

cd "$scriptPath"

ant $1

if [ -d "../../release/ane/" ]; then
cp "../bin/AppodealANE.ane" "../../release/ane/Appodeal.ane"
fi