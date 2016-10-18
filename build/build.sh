#!/bin/sh

echo "------------> Build ANE"

scriptPath=`dirname $0`
cd "$scriptPath"

ant $1

if [ -d "../../release/ane/" ]; then
	cp "../bin/AppodealANE.ane" "../../release/ane/Appodeal.ane"
fi