/**
 * Created by sam on 01.12.15.
 */
package com.appodeal.aneplugin {
    public class UserSettings
    {
        public function UserSettings()
        {
        }

        private function call(name:String, ...args):void
        {
            trace(Appodeal.NOT_SUPPORTED_ON_PLATFORM);
        }

        public function set age(value:int):void
        {
            call('setAge', value);
        }

        public function setBirthday(time:Number, utc:Boolean=false):void
        {
            call('setBirthday', time);
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
            call('setRelationship', value);
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
