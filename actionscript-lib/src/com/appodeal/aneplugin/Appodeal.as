package com.appodeal.aneplugin {

    import flash.events.StatusEvent;
    import flash.events.EventDispatcher;
    import flash.system.Capabilities;
    import flash.external.ExtensionContext;

    /**
     * @eventType com.appodeal.aneplugin.AdEvent.INTERSTITIAL_SHOWN
     */
    [Event(name="interstitialShown", type="com.appodeal.aneplugin.AdEvent")]
    /**
     * @eventType com.appodeal.aneplugin.AdEvent.INTERSTITIAL_LOADED
     */
    [Event(name="interstitialLoaded", type="com.appodeal.aneplugin.AdEvent")]
    /**
     * @eventType com.appodeal.aneplugin.AdEvent.INTERSTITIAL_FAILED_TO_LOAD
     */
    [Event(name="interstitialFailedToLoad", type="com.appodeal.aneplugin.AdEvent")]
    /**
     * @eventType com.appodeal.aneplugin.AdEvent.INTERSTITIAL_CLOSED
     */
    [Event(name="interstitialClosed", type="com.appodeal.aneplugin.AdEvent")]
    /**
     * @eventType com.appodeal.aneplugin.AdEvent.INTERSTITIAL_CLICKED
     */
    [Event(name="interstitialClicked", type="com.appodeal.aneplugin.AdEvent")]

    /**
     * @eventType com.appodeal.aneplugin.AdEvent.NON_SKIPPABLE_VIDEO_SHOWN
     */
    [Event(name="nonSkippableVideoShown", type="com.appodeal.aneplugin.AdEvent")]
    /**
     * @eventType com.appodeal.aneplugin.AdEvent.NON_SKIPPABLE_VIDEO_LOADED
     */
    [Event(name="nonSkippableVideoLoaded", type="com.appodeal.aneplugin.AdEvent")]
    /**
     * @eventType com.appodeal.aneplugin.AdEvent.NON_SKIPPABLE_VIDEO_FINISHED
     */
    [Event(name="nonSkippableVideoFinished", type="com.appodeal.aneplugin.AdEvent")]
    /**
     * @eventType com.appodeal.aneplugin.AdEvent.NON_SKIPPABLE_VIDEO_FAILED_TO_LOAD
     */
    [Event(name="nonSkippableVideoFailedToLoad", type="com.appodeal.aneplugin.AdEvent")]
    /**
     * @eventType com.appodeal.aneplugin.AdEvent.NON_SKIPPABLE_VIDEO_CLOSED
     */
    [Event(name="nonSkippableVideoClosed", type="com.appodeal.aneplugin.AdEvent")]

    /**
     * @eventType com.appodeal.aneplugin.AdEvent.REWARDED_VIDEO_SHOWN
     */
    [Event(name="rewardedVideoShown", type="com.appodeal.aneplugin.AdEvent")]
    /**
     * @eventType com.appodeal.aneplugin.AdEvent.REWARDED_VIDEO_LOADED
     */
    [Event(name="rewardedVideoLoaded", type="com.appodeal.aneplugin.AdEvent")]
    /**
     * @eventType com.appodeal.aneplugin.AdEvent.REWARDED_VIDEO_FINISHED
     */
    [Event(name="rewardedVideoFinished", type="com.appodeal.aneplugin.AdEvent")]
    /**
     * @eventType com.appodeal.aneplugin.AdEvent.REWARDED_VIDEO_FAILED_TO_LOAD
     */
    [Event(name="rewardedVideoFailedToLoad", type="com.appodeal.aneplugin.AdEvent")]
    /**
     * @eventType com.appodeal.aneplugin.AdEvent.REWARDED_VIDEO_CLOSED
     */
    [Event(name="rewardedVideoClosed", type="com.appodeal.aneplugin.AdEvent")]

    /**
     * @eventType com.appodeal.aneplugin.AdEvent.BANNER_SHOWN
     */
    [Event(name="bannerShown", type="com.appodeal.aneplugin.AdEvent")]
    /**
     * @eventType com.appodeal.aneplugin.AdEvent.BANNER_LOADED
     */
    [Event(name="bannerLoaded", type="com.appodeal.aneplugin.AdEvent")]
    /**
     * @eventType com.appodeal.aneplugin.AdEvent.BANNER_CLICKED
     */
    [Event(name="bannerClicked", type="com.appodeal.aneplugin.AdEvent")]
    /**
     * @eventType com.appodeal.aneplugin.AdEvent.BANNER_FAILED_TO_LOAD
     */
    [Event(name="bannerFailedToLoad", type="com.appodeal.aneplugin.AdEvent")]
    public class Appodeal extends EventDispatcher {

        public static const NONE:int = 0;
        public static const INTERSTITIAL:int = 3;
        public static const BANNER:int = 4;
        public static const BANNER_BOTTOM:int = 8;
        public static const BANNER_TOP:int = 16;
        public static const REWARDED_VIDEO:int = 128;
        public static const NON_SKIPPABLE_VIDEO:int = 256;

        public static const VERSION:String = "3.0.7";

        private static const NOT_SUPPORTED_ON_IOS:String = 'not supported on iOS';
        private static const NOT_SUPPORTED_ON_ANDROID:String = 'not supported on ANDROID';

        private static var context:*;

        public function Appodeal() {
            if (!context) {
                if (isAndroid() || isIOS()) {
                    try {
                        context = ExtensionContext.createExtensionContext("com.appodeal.aneplugin", null);
                    } catch (error:Error) {
                        super.dispatchEvent(new AdError(AdError.NOT_CREATION_ERROR, error));
                    }
                }
            }
            if (context != null) {
                context.addEventListener(StatusEvent.STATUS, onStatus);
            } else {
                super.dispatchEvent(new AdError(AdError.NOT_CREATION_ERROR));
            }

            callbackIndexes = {};
            if (isIOS()) {
                callbackIndexes['setInterstitialCallbacks'] = [true, 1];
                callbackIndexes['setRewardedVideoCallbacks'] = [true, 2];
                callbackIndexes['setNonSkippableVideoCallbacks'] = [true, 3];
                callbackIndexes['setBannerCallbacks'] = [true, 4];
                //
                callbackIndexes['removeInterstitialCallbacks'] = [false, 1];
                callbackIndexes['removeRewardedVideoCallbacks'] = [false, 2];
                callbackIndexes['removeNonSkippableVideoCallbacks'] = [false, 3];
                callbackIndexes['removeBannerCallbacks'] = [false, 4];
            }
        }

        private static var callbackIndexes:Object;

        internal static function call(...params):* {
            if (!context) {
                trace('Error, context is null; call:', params.join(' '));
                return null;
            }

            var name:String = params[0];
            var temp:Array = callbackIndexes[name];
            if (temp) {
                name = 'callbacks';
                params = [name, temp[0], temp[1]].concat(params.slice(1));
            }

            params[0] = 'appodeal_' + name;
            var result:* = context.call.apply(null, params);
            return result;
        }

        public static function isAndroid():Boolean {
            return Capabilities.manufacturer.indexOf("Android") != -1;
        }

        public static function isIOS():Boolean {
            return Capabilities.manufacturer.indexOf("iOS") != -1;
        }

        public function initialize(appKey:String, adType:int):void {
            call("setFramework", "air", VERSION);
            call("initialize", appKey, adType);
        }

        public function show(adType:int):Boolean {
            return call("show", adType);
        }

        public function showWithPlacement(adType:int, placement:String):Boolean {
            return call("showPlacement", adType, placement);
        }

        public function isLoaded(adType:int):Boolean {
            return call("isLoaded", adType);
        }

        public function cache(adType:int):void {
            call("cache", adType);
        }

        public function hide(adType:int = 4):void {
            call("hide", adType);
        }

        public function setAutoCache(adType:int, autoCache:Boolean):void {
            call("setAutoCache", adType, autoCache);
        }

        public function isPrecache(adType:int):Boolean {
            return call("isPrecache", adType);
        }

        public function setBannerAnimation(bannerAnimation:Boolean):void {
            call("setBannerAnimation", bannerAnimation);
        }

        public function setBannerBackground(bannerBackground:Boolean):void {
            if (isAndroid()) {
                trace(NOT_SUPPORTED_ON_ANDROID);
                return;
            }
            call("setBannerBackground", bannerBackground);
        }

        public function setSmartBanners(smartBanner:Boolean):void {
            call("setSmartBanners", smartBanner);
        }

        public function setTabletBanners(tabletBanners:Boolean):void {
            call("setTabletBanners", tabletBanners);
        }

        public function setTesting(testing:Boolean):void {
            call("setTesting", testing);
        }

        public function setLogLevel(value:int):void {
            call("setLogLevel", value);
        }

        public function setChildDirectedTreatment(value:Boolean):void {
            call("setChildDirectedTreatment", value);
        }

        public function disableNetwork(network:String):void {
            call("disableNetwork", network);
        }

        public function disableNetworkForAdType(adType:int, network:String):void {
            call("disableNetworkForAdType", adType, network);
        }

        public function setTriggerOnLoadedOnPrecache(adType:int, autoCache:Boolean):void {
            call("setTriggerOnLoadedOnPrecache", adType, autoCache);
        }

        public function disableLocationPermissionCheck():void {
            call("disableLocationPermissionCheck");
        }

        public function disableWriteExternalStoragePermissionCheck():void {
            call("disableWriteExternalStoragePermissionCheck");
        }

        public function requestMPermissions():void {
            call("requestMPermissions");
        }

        public function muteVideosIfCallsMuted(value:Boolean):void {
            call("muteVideosIfCallsMuted", value);
        }

        public function showTestScreen():void {
            call("showTestScreen");
        }

        public function getVersion():String {
            return call("getVersion");
        }

        public function canShow(adType:int):Boolean {
            return call("canShow", adType);
        }

        public function canShowWithPlacement(adType:int, placement:String):Boolean {
            return call("canShowPlacement", adType, placement);
        }

        public function setCustomBooleanRule(name:String ,rule:Boolean):void {
            call("setCustomBooleanRule", name, rule);
        }

        public function setCustomIntegerRule(name:int ,rule:Boolean):void {
            call("setCustomIntegerRule", name, rule);
        }

        public function setCustomDoubleRule(name:Number ,rule:Boolean):void {
            call("setCustomDoublegRule", name, rule);
        }

        public function setCustomStringRule(name:String ,rule:Boolean):void {
            call("setCustomStringRule", name, rule);
        }

        public function getRewardedParameters():Object {
            var xml:XML = new XML(call("getRewardedParameters"));
            var map:Object = {};
            map.amount = xml.attribute("amount");
            map.currency = xml.attribute("currency");
            return map;
        }

        public function getRewardedParametersWithPlacement(placement:String):Object {
            var xml:XML = new XML(call("getRewardedParametersPlacement", placement));
            var map:Object = {};
            map.amount = xml.attribute("amount");
            map.currency = xml.attribute("currency");
            return map;
        }

        public function trackInAppPurchase(amount:Number, currency:String):void {
            call("trackInAppPurchase", amount, currency);
        }

        public function log(tag:String, message:String):void {
            call("logDebug", tag, message);
        }

        public function toast(message:String):void {
            call("toastMessage", message);
        }

        public function getDensity():Number {
            return call("getDensity");
        }

        public function getAdvertisingID():String {
            if (isIOS()) {
                trace(NOT_SUPPORTED_ON_IOS);
                return null;
            }
            return call("getAdvertisingID");
        }

        public function getIDFA():String {
            if (isAndroid()) {
                trace(NOT_SUPPORTED_ON_ANDROID);
                return null;
            }
            return call("getIDFA");
        }

        private var listenersCash:Object = {};
        private var interstitialEventCount:int = 0;
        private var nonSkippableVideoEventCount:int = 0;
        private var rewardedVideoEventCount:int = 0;
        private var bannerEventCount:int = 0;

        public override function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void {
            if (!listenersCash[type]) listenersCash[type] = [];
            if (listenersCash[type].indexOf(listener) != -1) {
                return;
            }
            listenersCash[type].push(listener);
            //
            super.addEventListener(type, listener, useCapture, priority, useWeakReference);
            //
            switch (type) {
                case AdEvent.INTERSTITIAL_LOADED:
                case AdEvent.INTERSTITIAL_FAILED_TO_LOAD:
                case AdEvent.INTERSTITIAL_SHOWN:
                case AdEvent.INTERSTITIAL_CLICKED:
                case AdEvent.INTERSTITIAL_CLOSED:
                    if (!interstitialEventCount) call('setInterstitialCallbacks');
                    interstitialEventCount++;
                    break;
                case AdEvent.NON_SKIPPABLE_VIDEO_LOADED:
                case AdEvent.NON_SKIPPABLE_VIDEO_FINISHED:
                case AdEvent.NON_SKIPPABLE_VIDEO_FAILED_TO_LOAD:
                case AdEvent.NON_SKIPPABLE_VIDEO_SHOWN:
                case AdEvent.NON_SKIPPABLE_VIDEO_CLOSED:
                    if (!nonSkippableVideoEventCount) call('setNonSkippableVideoCallbacks');
                    nonSkippableVideoEventCount++;
                    break;
                case AdEvent.REWARDED_VIDEO_LOADED:
                case AdEvent.REWARDED_VIDEO_FINISHED:
                case AdEvent.REWARDED_VIDEO_FAILED_TO_LOAD:
                case AdEvent.REWARDED_VIDEO_SHOWN:
                case AdEvent.REWARDED_VIDEO_CLOSED:
                    if (!rewardedVideoEventCount) call('setRewardedVideoCallbacks');
                    rewardedVideoEventCount++;
                    break;
                case AdEvent.BANNER_CLICKED:
                case AdEvent.BANNER_FAILED_TO_LOAD:
                case AdEvent.BANNER_LOADED:
                case AdEvent.BANNER_SHOWN:
                    if (!bannerEventCount) call('setBannerCallbacks');
                    bannerEventCount++;
                    break;
            }
        }

        public override function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void {
            if (!listenersCash[type]) return;
            var index:int = listenersCash[type].indexOf(listener);
            if (index == -1) {
                return;
            }
            listenersCash[type].splice(index, 1);
            //
            super.removeEventListener(type, listener, useCapture);
            //
            switch (type) {
                case AdEvent.INTERSTITIAL_LOADED:
                case AdEvent.INTERSTITIAL_FAILED_TO_LOAD:
                case AdEvent.INTERSTITIAL_SHOWN:
                case AdEvent.INTERSTITIAL_CLICKED:
                case AdEvent.INTERSTITIAL_CLOSED:
                    interstitialEventCount--;
                    if (!interstitialEventCount) call('removeInterstitialCallbacks');
                    break;
                case AdEvent.NON_SKIPPABLE_VIDEO_LOADED:
                case AdEvent.NON_SKIPPABLE_VIDEO_FINISHED:
                case AdEvent.NON_SKIPPABLE_VIDEO_FAILED_TO_LOAD:
                case AdEvent.NON_SKIPPABLE_VIDEO_SHOWN:
                case AdEvent.NON_SKIPPABLE_VIDEO_CLOSED:
                    nonSkippableVideoEventCount--;
                    if (!nonSkippableVideoEventCount) call('removeNonSkippableVideoCallbacks');
                    break;
                case AdEvent.REWARDED_VIDEO_LOADED:
                case AdEvent.REWARDED_VIDEO_FINISHED:
                case AdEvent.REWARDED_VIDEO_FAILED_TO_LOAD:
                case AdEvent.REWARDED_VIDEO_SHOWN:
                case AdEvent.REWARDED_VIDEO_CLOSED:
                    rewardedVideoEventCount--;
                    if (!rewardedVideoEventCount) call('removeRewardedVideoCallbacks');
                    break;
                case AdEvent.BANNER_CLICKED:
                case AdEvent.BANNER_FAILED_TO_LOAD:
                case AdEvent.BANNER_LOADED:
                case AdEvent.BANNER_SHOWN:
                    bannerEventCount--;
                    if (!bannerEventCount) call('removeBannerCallbacks');
                    break;
            }
        }

        protected function onStatus(event:StatusEvent):void {
            var e:AdEvent = null;
            switch (event.code) {
                case "INTERSTITIAL_LOADED":
                    e = new AdEvent(AdEvent.INTERSTITIAL_LOADED);
                    var xmlIL:XML = new XML(event.level);
                    e._isPrecacheInterstitial = xmlIL.attribute('precache');
                    break;
                case "INTERSTITIAL_FAILED_TO_LOAD":
                    e = new AdEvent(AdEvent.INTERSTITIAL_FAILED_TO_LOAD);
                    break;
                case "INTERSTITIAL_SHOWN":
                    e = new AdEvent(AdEvent.INTERSTITIAL_SHOWN);
                    break;
                case "INTERSTITIAL_CLICKED":
                    e = new AdEvent(AdEvent.INTERSTITIAL_CLICKED);
                    break;
                case "INTERSTITIAL_CLOSED":
                    e = new AdEvent(AdEvent.INTERSTITIAL_CLOSED);
                    break;

                case "NON_SKIPPABLE_VIDEO_LOADED":
                    e = new AdEvent(AdEvent.NON_SKIPPABLE_VIDEO_LOADED);
                    break;
                case "NON_SKIPPABLE_VIDEO_FINISHED":
                    e = new AdEvent(AdEvent.NON_SKIPPABLE_VIDEO_FINISHED);
                    break;
                case "NON_SKIPPABLE_VIDEO_FAILED_TO_LOAD":
                    e = new AdEvent(AdEvent.NON_SKIPPABLE_VIDEO_FAILED_TO_LOAD);
                    break;
                case "NON_SKIPPABLE_VIDEO_SHOWN":
                    e = new AdEvent(AdEvent.NON_SKIPPABLE_VIDEO_SHOWN);
                    break;
                case "NON_SKIPPABLE_VIDEO_CLOSED":
                    e = new AdEvent(AdEvent.NON_SKIPPABLE_VIDEO_CLOSED);
                    var xmlNSVC:XML = new XML(event.level);
                    e._isFinishedNonSkippableVideo = xmlNSVC.attribute('finished');
                    break;

                case "REWARDED_VIDEO_LOADED":
                    e = new AdEvent(AdEvent.REWARDED_VIDEO_LOADED);
                    break;
                case "REWARDED_VIDEO_FINISHED":
                    e = new AdEvent(AdEvent.REWARDED_VIDEO_FINISHED);
                    var xmlRVF:XML = new XML(event.level);
                    e._amount = xmlRVF.attribute('amount');
                    e._name = xmlRVF.attribute('name');
                    break;
                case "REWARDED_VIDEO_FAILED_TO_LOAD":
                    e = new AdEvent(AdEvent.REWARDED_VIDEO_FAILED_TO_LOAD);
                    break;
                case "REWARDED_VIDEO_SHOWN":
                    e = new AdEvent(AdEvent.REWARDED_VIDEO_SHOWN);
                    break;
                case "REWARDED_VIDEO_CLOSED":
                    e = new AdEvent(AdEvent.REWARDED_VIDEO_CLOSED);
                    var xmlRVC:XML = new XML(event.level);
                    e._isFinishedRewardedVideo = xmlRVC.attribute('finished');
                    break;
                case "BANNER_CLICKED":
                    e = new AdEvent(AdEvent.BANNER_CLICKED);
                    break;
                case "BANNER_FAILED_TO_LOAD":
                    e = new AdEvent(AdEvent.BANNER_FAILED_TO_LOAD);
                    break;
                case "BANNER_LOADED":
                    e = new AdEvent(AdEvent.BANNER_LOADED);
                    var xmlBL:XML = new XML(event.level);
                    e._isPrecacheBanner = xmlBL.attribute('precache');
                    break;
                case "BANNER_SHOWN":
                    e = new AdEvent(AdEvent.BANNER_SHOWN);
                    break;
            }
            if (e != null) {
                dispatchEvent(e);
            }
        }

    }
}
