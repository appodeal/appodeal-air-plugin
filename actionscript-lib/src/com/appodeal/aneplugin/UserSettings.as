package com.appodeal.aneplugin {

    public class UserSettings {

        private var indexes:Object;

        public function UserSettings() { }

        private function call(name:String, ...args):void {
            var params:Array;
            if (Appodeal.isAndroid()) {
                params = ['userSettings_' + name];
            } else if (Appodeal.isIOS()) {
                indexes = {};
                indexes['setAge'] = 1;
                indexes['setGender'] = 2;
                indexes['setUserId'] = 3;

                params = ['userSettings', indexes[name]];
            }
            params = params.concat(args);
            Appodeal.call.apply(null, params);
        }

        public function setAge(value:int):void {
            call('setAge', value);
        }

        public function setGender(value:int):void {
            call('setGender', value);
        }

        public function setUserId(value:String):void {
            call('setUserId', value);
        }
    }
}