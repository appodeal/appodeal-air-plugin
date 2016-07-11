package com.appodeal.aneplugin {

import flash.events.StatusEvent;
import flash.events.EventDispatcher;
import flash.system.Capabilities;
import flash.utils.getDefinitionByName;

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
    public static const NONE:int = 0;
    public static const INTERSTITIAL:int = 1;
    public static const SKIPPABLE_VIDEO:int = 2;
    public static const BANNER:int = 4;
    public static const BANNER_BOTTOM:int = 8;
    public static const BANNER_TOP:int = 16;
    public static const REWARDED_VIDEO:int = 128;
    public static const NON_SKIPPABLE_VIDEO:int = 128;
    private static const ALL:int = 1023;

    public static const VERSION:int = 1;
    public static const BUILD:int = 8;

    private static const NOT_SUPPORTED_ON_IOS:String = 'not supported on iOS';
    private static const NOT_SUPPORTED_ON_ANDROID:String = 'not supported on ANDROID';

    private static var context:*;

    public function Appodeal() {
        if (!context) {
            if (isAndroid() || isIOS()) {
                try {
                    var ExtensionContextClass:Class = getDefinitionByName('flash.external.ExtensionContext') as Class;
                    context = ExtensionContextClass.createExtensionContext("com.appodeal.aneplugin", null);
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
        //
        _settings = new UserSettings();
        //
        callbackIndexes = {};
        if (isIOS()) {
            callbackIndexes['setInterstitialCallbacks'] = [true, 1];
            callbackIndexes['setSkippableVideoCallbacks'] = [true, 2];
            callbackIndexes['setRewardedVideoCallbacks'] = [true, 3];
            callbackIndexes['setNonSkippableVideoCallbacks'] = [true, 3];
            callbackIndexes['setBannerCallbacks'] = [true, 4];
            //
            callbackIndexes['removeInterstitialCallbacks'] = [false, 1];
            callbackIndexes['removeSkippableVideoCallbacks'] = [false, 2];
            callbackIndexes['removeRewardedVideoCallbacks'] = [false, 3];
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
        //
        var name:String = params[0];
        var temp:Array = callbackIndexes[name];
        if (temp) {
            name = 'callbacks';
            params = [name, temp[0], temp[1]].concat(params.slice(1));
        }
        //
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

    public static function get isSupported():Boolean {
        return true;
    }

    private static var _isInited:Boolean;
    public function get isInited():Boolean {
        return _isInited;
    }

    public function initialize(appKey:String, adType:int):void {
        if (_isInited) {
            super.dispatchEvent(new AdError(AdError.REINITIALIZATION_ERROR));
            return;
        }
        _isInited = true;
        call("initialize", appKey, adType);
    }

    public function show(adType:int):Boolean {
        return call("show", adType);
    }

    public function showWithPlacement(adType:int, placement:String):Boolean {
        return call("showPlacement", adType, placement);
    }

    public function hide(adType:int = 4):void {
        call("hide", adType);
    }

    public function cache(adType:int):void {
        call("cache", adType);
    }

    public function confirm(adType:int):void {
        if (isIOS()) {
            trace(NOT_SUPPORTED_ON_IOS);
            return;
        }
        call("confirm", adType);
    }

    public function setAutoCache(adType:int, autoCache:Boolean):void {
        call("setAutoCache", adType, autoCache);
    }

    public function setTesting(testing:Boolean):void {
        call("setTesting", testing);
    }

    public function getVersion():String {
        return call("getVersion");
    }

    public function log(tag:String, message:String):void {
        if (isIOS()) {
            trace(NOT_SUPPORTED_ON_IOS);
            return;
        }
        call("logDebug", tag, message);
    }

    public function toast(message:String):void {
        if (isIOS()) {
            trace(NOT_SUPPORTED_ON_IOS);
            return;
        }
        call("toastMessage", message);
    }

    public function disableNetwork(network:String):void {
        if (isAndroid()) {
            call("disableNetwork", network);
        } else {
            call("disableNetworkForAdType", 255, network);
        }
    }

    public function disableNetworkForAdType(network:String, adType:int):void {
        call("disableNetworkForAdType", network, adType);
    }

    public function trackInAppPurchase(amount:Number, currency:String):void {
        if (isIOS()) {
            trace(NOT_SUPPORTED_ON_IOS);
            return;
        }
        call("trackInAppPurchase", amount, currency);
    }

    public function disableLocationPermissionCheck():void {
        call("disableLocationPermissionCheck");
    }

    public function disableWriteExternalStoragePermissionCheck():void {
        if (isIOS()) {
            trace(NOT_SUPPORTED_ON_IOS);
            return;
        }
        call("disableWriteExternalStoragePermissionCheck");
    }

    public function requestMPermissions():void {
        if (isIOS()) {
            trace(NOT_SUPPORTED_ON_IOS);
            return;
        }
        call("requestMPermissions");
    }

    public function isLoaded(adType:int):Boolean {
        return call("isLoaded", adType);
    }

    public function isLoadedWithPriceFloor(adType:int):Boolean
    {
        if (isIOS()) {
            return call("isLoaded", adType);
        }
        return call("isLoadedWithPriceFloor", adType);
    }

    public function isPrecache(adType:int):Boolean {
        if (isIOS()) {
            trace(NOT_SUPPORTED_ON_IOS);
            return false;
        }
        return call("isPrecache", adType);
    }

    public function setOnLoadedTriggerBoth(adType:int, autoCache:Boolean):void {
        if (isIOS()) {
            trace(NOT_SUPPORTED_ON_IOS);
            return;
        }
        call("setOnLoadedTriggerBoth", adType, autoCache);
    }

    public function setLogging(logging:Boolean):void {
        if (isIOS()) {
            trace(NOT_SUPPORTED_ON_IOS);
            return;
        }
        call("setLogging", logging);
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
    private var skippableVideoEventCount:int = 0;
    private var nonSkippableVideoEventCount:int = 0;
    private var rewardedVideoEventCount:int = 0;
    private var bannerEventCount:int = 0;

    public override function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void {
        if (!_isInited) {
            super.dispatchEvent(new AdError(AdError.NOT_INITIALIZATION_ERROR));
            return;
        }
        //
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
            case AdEvent.SKIPPABLE_VIDEO_LOADED:
            case AdEvent.SKIPPABLE_VIDEO_FINISHED:
            case AdEvent.SKIPPABLE_VIDEO_FAILED_TO_LOAD:
            case AdEvent.SKIPPABLE_VIDEO_SHOWN:
            case AdEvent.SKIPPABLE_VIDEO_CLOSED:
                if (!skippableVideoEventCount) call('setSkippableVideoCallbacks');
                skippableVideoEventCount++;
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
            case AdEvent.SKIPPABLE_VIDEO_LOADED:
            case AdEvent.SKIPPABLE_VIDEO_FINISHED:
            case AdEvent.SKIPPABLE_VIDEO_FAILED_TO_LOAD:
            case AdEvent.SKIPPABLE_VIDEO_SHOWN:
            case AdEvent.SKIPPABLE_VIDEO_CLOSED:
                skippableVideoEventCount--;
                if (!skippableVideoEventCount) call('removeSkippableVideoCallbacks');
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

    private var _settings:UserSettings;
    public function get settings():UserSettings {
        return this._settings;
    }


    protected function onStatus(event:StatusEvent):void {
        var e:AdEvent = null;
        switch (event.code) {
            case "INTERSTITIAL_LOADED":
                e = new AdEvent(AdEvent.INTERSTITIAL_LOADED);
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

            case "SKIPPABLE_VIDEO_LOADED":
                e = new AdEvent(AdEvent.SKIPPABLE_VIDEO_LOADED);
                break;
            case "SKIPPABLE_VIDEO_FINISHED":
                e = new AdEvent(AdEvent.SKIPPABLE_VIDEO_FINISHED);
                break;
            case "SKIPPABLE_VIDEO_FAILED_TO_LOAD":
                e = new AdEvent(AdEvent.SKIPPABLE_VIDEO_FAILED_TO_LOAD);
                break;
            case "SKIPPABLE_VIDEO_SHOWN":
                e = new AdEvent(AdEvent.SKIPPABLE_VIDEO_SHOWN);
                break;
            case "SKIPPABLE_VIDEO_CLOSED":
                e = new AdEvent(AdEvent.SKIPPABLE_VIDEO_CLOSED);
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
                break;

            case "REWARDED_VIDEO_LOADED":
                e = new AdEvent(AdEvent.REWARDED_VIDEO_LOADED);
                break;
            case "REWARDED_VIDEO_FINISHED":
                e = new AdEvent(AdEvent.REWARDED_VIDEO_FINISHED);
                var xml:XML = new XML(event.level);
                e._amount = xml.attribute('amount');
                e._name = xml.attribute('name');
                break;
            case "REWARDED_VIDEO_FAILED_TO_LOAD":
                e = new AdEvent(AdEvent.REWARDED_VIDEO_FAILED_TO_LOAD);
                break;
            case "REWARDED_VIDEO_SHOWN":
                e = new AdEvent(AdEvent.REWARDED_VIDEO_SHOWN);
                break;
            case "REWARDED_VIDEO_CLOSED":
                e = new AdEvent(AdEvent.REWARDED_VIDEO_CLOSED);
                break;

            case "BANNER_CLICKED":
                e = new AdEvent(AdEvent.BANNER_CLICKED);
                break;
            case "BANNER_FAILED_TO_LOAD":
                e = new AdEvent(AdEvent.BANNER_FAILED_TO_LOAD);
                break;
            case "BANNER_LOADED":
                e = new AdEvent(AdEvent.BANNER_LOADED);
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