ACOMPC="/Users/paveldunyashev/airsdk/bin/acompc"
ADT="/Users/paveldunyashev/airsdk/bin/adt"

SWFVERSION=14

INCLUDE_CLASSES="com.appodeal.aneplugin"
NAME="actionscript-lib"

echo "GENERATING SWC"
$ACOMPC -source-path /Users/paveldunyashev/Documents/Projects/Appodeal/plugin_master/appodeal-air-plugin/actionscript-lib/src/ -include-classes com.appodeal.aneplugin.Appodeal com.appodeal.aneplugin.AdError com.appodeal.aneplugin.AdEvent com.appodeal.aneplugin.AdType com.appodeal.aneplugin.UserSettings com.appodeal.aneplugin.constants.Alcohol com.appodeal.aneplugin.constants.Gender com.appodeal.aneplugin.constants.Occupation com.appodeal.aneplugin.constants.Relation com.appodeal.aneplugin.constants.Smoking -swf-version=$SWFVERSION -output $NAME.swc
sleep 3
