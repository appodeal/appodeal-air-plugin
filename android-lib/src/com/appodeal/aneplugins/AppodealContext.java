package com.appodeal.aneplugins;

import java.util.HashMap;
import java.util.Map;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.appodeal.aneplugins.callbacks.*;
import com.appodeal.aneplugins.methods.*;
import com.appodeal.aneplugins.usersettings.*;
import com.appodeal.aneplugins.utils.AppodealGetAdID;
import com.appodeal.aneplugins.utils.AppodealGetDensity;
import com.appodeal.aneplugins.utils.AppodealLog;
import com.appodeal.aneplugins.utils.AppodealToast;

public class AppodealContext extends FREContext {

    @Override
    public void dispose() { }

    @Override
    public Map<String, FREFunction> getFunctions() {
        Map<String, FREFunction> map = new HashMap<String, FREFunction>();
        map.put("appodeal_initialize", new AppodealInitialize());
        map.put("appodeal_show", new AppodealShow());
        map.put("appodeal_showPlacement", new AppodealShowPlacement());
        map.put("appodeal_isLoaded", new AppodealIsLoaded());
        map.put("appodeal_cache", new AppodealCache());
        map.put("appodeal_hide", new AppodealHide());
        map.put("appodeal_setAutoCache", new AppodealSetAutoCache());
        map.put("appodeal_isPrecache", new AppodealIsPrecache());

        map.put("appodeal_setTabletBanners", new AppodealSet728x90Banners());
        map.put("appodeal_setSmartBanners", new AppodealSetSmartBanners());
        map.put("appodeal_setBannerAnimation", new AppodealSetBannerAnimation());
        map.put("appodeal_setTesting", new AppodealSetTesting());
        map.put("appodeal_setLogLevel", new AppodealSetLogLevel());
        map.put("appodeal_setChildDirectedTreatment", new AppodealSetChildDirectedTreatment());
        map.put("appodeal_disableNetwork", new AppodealDisableNetwork());
        map.put("appodeal_disableNetworkForAdType", new AppodealDisableForAdType());
        map.put("appodeal_setTriggerOnLoadedOnPrecache", new AppodealSetTriggerOnLoadedOnPrecache());
        map.put("appodeal_disableLocationPermissionCheck", new AppodealDisableLocationPermissionCheck());
        map.put("appodeal_disableWriteExternalStoragePermissionCheck", new AppodealDisableWriteExternalStoragePermissionCheck());
        map.put("appodeal_requestMPermissions", new AppodealRequestMPermissions());
        map.put("appodeal_muteVideosIfCallsMuted", new AppodealMuteVideosIfCallsMuted());
        map.put("appodeal_showTestScreen", new AppodealShowTestScreen());
        map.put("appodeal_setFramework", new AppodealSetFramework());
        map.put("appodeal_getVersion", new AppodealGetVersion());

        map.put("appodeal_canShow", new AppodealCanShow());
        map.put("appodeal_canShowPlacement", new AppodealCanShowPlacement());
        map.put("appodeal_setCustomBooleanRule", new AppodealSetCustomBooleanRule());
        map.put("appodeal_setCustomIntegerRule", new AppodealSetCustomIntegerRule());
        map.put("appodeal_setCustomDoubleRule", new AppodealSetCustomDoubleRule());
        map.put("appodeal_setCustomStringRule", new AppodealSetCustomStringRule());
        map.put("appodeal_trackInAppPurchase", new AppodealTrackInAppPurchase());
        map.put("appodeal_getRewardedParameters", new AppodealGetRewardedParameters());
        map.put("appodeal_getRewardedParametersPlacement", new AppodealGetRewardedParametersPlacement());

        //Utils
        map.put("appodeal_getDensity", new AppodealGetDensity());
        map.put("appodeal_getAdvertisingID", new AppodealGetAdID());
        map.put("appodeal_logDebug", new AppodealLog());
        map.put("appodeal_toastMessage", new AppodealToast());

        //UserSettings
        map.put("appodeal_userSettings_setAge", new AppodealUserSettingsSetAge());
        map.put("appodeal_userSettings_setGender", new AppodealUserSettingsSetGender());
        map.put("appodeal_userSettings_setUserId", new AppodealUserSettingsSetUserId());

        map.put("appodeal_setBannerCallbacks", new AppodealSetBannerCallbacks());
        map.put("appodeal_setInterstitialCallbacks", new AppodealSetInterstitialCallbacks());
        map.put("appodeal_setNonSkippableVideoCallbacks", new AppodealSetNonSkippableVideoCallbacks());
        map.put("appodeal_setRewardedVideoCallbacks", new AppodealSetRewardedVideoCallbacks());
        map.put("appodeal_removeBannerCallbacks", new AppodealRemoveBannerListener());
        map.put("appodeal_removeInterstitialCallbacks", new AppodealRemoveInterstitialListener());
        map.put("appodeal_removeNonSkippableVideoCallbacks", new AppodealRemoveNonSkippableVideoListener());
        map.put("appodeal_removeRewardedVideoCallbacks", new AppodealRemoveRewardedVideoListener());

        return map;
    }

}