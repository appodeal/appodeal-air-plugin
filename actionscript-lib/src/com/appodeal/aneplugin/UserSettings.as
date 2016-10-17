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
                indexes['setBirthday'] = 2;
                indexes['setEmail'] = 3;
                indexes['setInterests'] = 4;
                indexes['setGender'] = 5;
                indexes['setOccupation'] = 6;
                indexes['setRelation'] = 7;
                indexes['setSmoking'] = 8;
                indexes['setAlcohol'] = 9;
                indexes['setUserId'] = 10;

                params = ['userSettings', indexes[name]];
            }
            params = params.concat(args);
            Appodeal.call.apply(null, params);
        }

        public function setAge(value:int):void {
            call('setAge', value);
        }

        public function setBirthday(value:String):void {
            call('setBirthday', value);
        }

        public function setEmail(value:String):void {
            call('setEmail', value);
        }

        public function setInterests(value:String):void {
            call('setInterests', value);
        }

        public function setGender(value:int):void {
            call('setGender', value);
        }

        public function setOccupation(value:int):void {
            call('setOccupation', value);
        }

        public function setRelationship(value:int):void {
            call('setRelation', value);
        }

        public function setSmoking(value:int):void {
            call('setSmoking', value);
        }

        public function setAlcohol(value:int):void {
            call('setAlcohol', value);
        }

        public function setUserId(value:String):void {
            call('setUserId', value);
        }
    }
}