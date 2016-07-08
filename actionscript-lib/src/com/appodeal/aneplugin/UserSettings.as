package com.appodeal.aneplugin
{
    public class UserSettings
    {
        private var indexes:Object;
        public function UserSettings()
        {
            indexes = {};
            indexes['setAge'] = 1;
            indexes['setBirthday'] = 2;
            indexes['setEmail'] = 3;
            indexes['setFacebookId'] = 4;
            indexes['setVkId'] = 5;
            indexes['setInterests'] = 6;
            indexes['setGender'] = 7;
            indexes['setOccupation'] = 8;
            indexes['setRelation'] = 9;
            indexes['setSmoking'] = 10;
            indexes['setAlcohol'] = 11;
        }

        private function call(name:String, ...args):void
        {
            var params:Array;
            if (Appodeal.isAndroid()) {
                params = ['userSettings_' + name];
            } else {
                params = ['userSettings', indexes[name]];
            }
            params = params.concat(args);
            Appodeal.call.apply(null, params);
        }

        public function set age(value:int):void
        {
            call('setAge', value);
        }

        private var date:Date = new Date();
        public function setBirthday(time:Number, utc:Boolean=false):void
        {
            time -= !utc ? date.timezoneOffset*60000 : 0;
            if (Appodeal.isAndroid()) {
                date.time = time;
                call('setBirthday', date.getUTCDate()+'/'+date.getUTCMonth()+'/'+date.getUTCFullYear());
            } else {
                call('setBirthday', Math.floor(time/1000));
            }
        }

        public function set birthday(value:Number):void
        {
            setBirthday(value);
        }

        public function set email(value:String):void
        {
            call('setEmail', value);
        }

        public function set facebookId(value:String):void
        {
            call('setFacebookId', value);
        }

        public function set vkId(value:String):void
        {
            call('setVkId', value);
        }

        public function set interests(value:String):void
        {
            call('setInterests', value);
        }

        public function set gender(value:int):void
        {
            call('setGender', value);
        }

        public function set occupation(value:int):void
        {
            call('setOccupation', value);
        }

        public function set relationship(value:int):void
        {
            call('setRelation', value);
        }

        public function set smoking(value:int):void
        {
            call('setSmoking', value);
        }

        public function set alcohol(value:int):void
        {
            call('setAlcohol', value);
        }
    }
}
