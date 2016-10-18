package com.appodeal.aneplugin {

    import flash.events.EventDispatcher;
    import flash.system.Capabilities;

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
     * @eventType com.appodeal.aneplugin.AdEvent.SKIPPABLE_VIDEO_SHOWN
     */
    [Event(name="skippableVideoShown", type="com.appodeal.aneplugin.AdEvent")]
    /**
     * @eventType com.appodeal.aneplugin.AdEvent.SKIPPABLE_VIDEO_LOADED
     */
    [Event(name="skippableVideoLoaded", type="com.appodeal.aneplugin.AdEvent")]
    /**
     * @eventType com.appodeal.aneplugin.AdEvent.SKIPPABLE_VIDEO_FINISHED
     */
    [Event(name="skippableVideoFinished", type="com.appodeal.aneplugin.AdEvent")]
    /**
     * @eventType com.appodeal.aneplugin.AdEvent.SKIPPABLE_VIDEO_FAILED_TO_LOAD
     */
    [Event(name="skippableVideoFailedToLoad", type="com.appodeal.aneplugin.AdEvent")]
    /**
     * @eventType com.appodeal.aneplugin.AdEvent.SKIPPABLE_VIDEO_CLOSED
     */
    [Event(name="skippableVideoClosed", type="com.appodeal.aneplugin.AdEvent")]

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
        public static const VERSION:int = 2;
        public static const BUILD:int = 0;

        internal static const NOT_SUPPORTED_ON_IOS:String = 'not supported on iOS';
        internal static const NOT_SUPPORTED_ON_PLATFORM:String = 'not supported on this platform';

        public function Appodeal() {
            _settings = new UserSettings();
        }

        public static function isAndroid():Boolean {
            return Capabilities.manufacturer.indexOf("Android") != -1;
        }

        public static function isIOS():Boolean {
            return Capabilities.manufacturer.indexOf("iOS") != -1;
        }

        public static function get isSupported():Boolean {
            return false;
        }

        public function initialize(appKey:String, adType:int):void {
            trace(NOT_SUPPORTED_ON_PLATFORM);
        }

        public function show(adType:int):Boolean {
            trace(NOT_SUPPORTED_ON_PLATFORM);
            return false;
        }

        public function showWithPlacement(adType:int, placement:String):Boolean {
            trace(NOT_SUPPORTED_ON_PLATFORM);
            return false;
        }

        public function hide(adType:int = 4):void {
            trace(NOT_SUPPORTED_ON_PLATFORM);
        }

        public function cache(adType:int):void {
            trace(NOT_SUPPORTED_ON_PLATFORM);
        }

        public function setAutoCache(adType:int, autoCache:Boolean):void {
            trace(NOT_SUPPORTED_ON_PLATFORM);
        }

        public function setTesting(testing:Boolean):void {
            trace(NOT_SUPPORTED_ON_PLATFORM);
        }

        public function setLogging(testing:Boolean):void {
            trace(NOT_SUPPORTED_ON_PLATFORM);
        }


        public function getVersion():String {
            trace(NOT_SUPPORTED_ON_PLATFORM);
            return null;
        }

        public function disableNetwork(network:String):void {
            trace(NOT_SUPPORTED_ON_PLATFORM);
        }

        public function disableNetworkForAdType(network:String, adType:int):void {
            trace(NOT_SUPPORTED_ON_PLATFORM);
        }

        public function disableLocationPermissionCheck():void {
            trace(NOT_SUPPORTED_ON_PLATFORM);
        }

        public function disableWriteExternalStoragePermissionCheck():void {
            trace(NOT_SUPPORTED_ON_PLATFORM);
        }

        public function requestMPermissions():void {
            trace(NOT_SUPPORTED_ON_PLATFORM);
        }

        public function confirm(adType:int):void {
            trace(NOT_SUPPORTED_ON_PLATFORM);
        }

        public function trackInAppPurchase(amount:Number, currency:String):void {
            trace(NOT_SUPPORTED_ON_PLATFORM);
        }

        public function isLoaded(adType:int):Boolean {
            trace(NOT_SUPPORTED_ON_PLATFORM);
            return false;
        }

        public function log(tag:String, message:String):void {
            trace(NOT_SUPPORTED_ON_PLATFORM);
        }

        public function toast(message:String):void {
            trace(NOT_SUPPORTED_ON_PLATFORM);
        }

        public function isPrecache(adType:int):Boolean {
            trace(NOT_SUPPORTED_ON_PLATFORM);
            return false;
        }

        public function setOnLoadedTriggerBoth(adType:int, autoCache:Boolean):void {
            trace(NOT_SUPPORTED_ON_PLATFORM);
        }

        //Platform Utils
        public function getAdvertisingID():String {
            trace(NOT_SUPPORTED_ON_PLATFORM);
            return null;
        }

        public function getIDFA():String {
            trace(NOT_SUPPORTED_ON_PLATFORM);
            return null;
        }

        public function getDensity():Number {
            trace(NOT_SUPPORTED_ON_PLATFORM);
            return 0;
        }

        public function setBannerAnimation(bannerAnimation:Boolean):void {
            trace(NOT_SUPPORTED_ON_PLATFORM);
        }

        public function setBannerBackground(bannerBackground:Boolean):void {
            trace(NOT_SUPPORTED_ON_PLATFORM);
        }

        public function set728x90Banners(set728Banners:Boolean):void {
            trace(NOT_SUPPORTED_ON_PLATFORM);
        }

        public function setSmartBanners(smartBanner:Boolean):void {
            trace(NOT_SUPPORTED_ON_PLATFORM);
        }

        public function setCustomBooleanRule(name:String ,rule:Boolean):void {
            trace(NOT_SUPPORTED_ON_PLATFORM);
        }

        public function setCustomIntegerRule(name:int ,rule:Boolean):void {
            trace(NOT_SUPPORTED_ON_PLATFORM);
        }

        public function setCustomDoubleRule(name:Number ,rule:Boolean):void {
            trace(NOT_SUPPORTED_ON_PLATFORM);
        }

        public function setCustomStringRule(name:String ,rule:Boolean):void {
            trace(NOT_SUPPORTED_ON_PLATFORM);
        }

        //Appodeal UserSettings
        private var _settings:UserSettings;
        public function get settings():UserSettings {
            return this._settings;
        }

    }
}
