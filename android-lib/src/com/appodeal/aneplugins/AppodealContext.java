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
        map.put("appodeal_setBannerCallbacks", new AppodealSetBannerCallbacks());
        map.put("appodeal_setInterstitialCallbacks", new AppodealSetInterstitialCallbacks());
        map.put("appodeal_setSkippableVideoCallbacks", new AppodealSetSkippableVideoCallbacks());
        map.put("appodeal_setNonSkippableVideoCallbacks", new AppodealSetNonSkippableVideoCallbacks());
        map.put("appodeal_setRewardedVideoCallbacks", new AppodealSetRewardedVideoCallbacks());
        map.put("appodeal_removeAllCallbacks", new AppodealRemoveAllListeners());
        map.put("appodeal_removeBannerCallbacks", new AppodealRemoveBannerListener());
        map.put("appodeal_removeInterstitialCallbacks", new AppodealRemoveInterstitialListener());
        map.put("appodeal_removeSkippableVideoCallbacks", new AppodealRemoveSkippableVideoListener());
        map.put("appodeal_removeNonSkippableVideoCallbacks", new AppodealRemoveNonSkippableVideoListener());
        map.put("appodeal_removeRewardedVideoCallbacks", new AppodealRemoveRewardedVideoListener());
        map.put("appodeal_show", new AppodealShow());
        map.put("appodeal_showPlacement", new AppodealShowPlacement());
        map.put("appodeal_isLoaded", new AppodealIsLoaded());
        map.put("appodeal_isPrecache", new AppodealIsPrecache());
        map.put("appodeal_cache", new AppodealCache());
        map.put("appodeal_confirm", new AppodealConfirm());
        map.put("appodeal_setAutoCache", new AppodealSetAutoCache());
        map.put("appodeal_setOnLoadedTriggerBoth", new AppodealSetOnLoadedTriggerBoth());
        map.put("appodeal_disableNetwork", new AppodealDisableNetwork());
        map.put("appodeal_disableNetworkForAdType", new AppodealDisableForAdType());
        map.put("appodeal_hide", new AppodealHide());
        map.put("appodeal_disableLocationPermissionCheck", new AppodealDisableLocationPermissionCheck());
        map.put("appodeal_disableWriteExternalStoragePermissionCheck", new AppodealDisableWriteExternalStoragePermissionCheck());
        map.put("appodeal_requestMPermissions", new AppodealRequestMPermissions());
        map.put("appodeal_setTesting", new AppodealSetTesting());
        map.put("appodeal_setLogging", new AppodealSetLogging());
        map.put("appodeal_getVersion", new AppodealGetVersion());
        map.put("appodeal_trackInAppPurchase", new AppodealTrackInAppPurchase());

        //Utils
        map.put("appodeal_getDensity", new AppodealGetDensity());
        map.put("appodeal_getAdvertisingID", new AppodealGetAdID());
        map.put("appodeal_logDebug", new AppodealLog());
        map.put("appodeal_toastMessage", new AppodealToast());

        //UserSettings
        map.put("appodeal_userSettings_setAge", new AppodealUserSettingsSetAge());
        map.put("appodeal_userSettings_setBirthday", new AppodealUserSettingsSetBirthday());
        map.put("appodeal_userSettings_setEmail", new AppodealUserSettingsSetEmail());
        map.put("appodeal_userSettings_setFacebookId", new AppodealUserSettingsSetFacebookId());
        map.put("appodeal_userSettings_setVkId", new AppodealUserSettingsSetVkId());
        map.put("appodeal_userSettings_setInterests", new AppodealUserSettingsSetInterests());

        map.put("appodeal_userSettings_setAlcohol", new AppodealUserSettingsSetAlcohol());
        map.put("appodeal_userSettings_setGender", new AppodealUserSettingsSetGender());
        map.put("appodeal_userSettings_setOccupation", new AppodealUserSettingsSetOccupation());
        map.put("appodeal_userSettings_setRelation", new AppodealUserSettingsSetRelation());
        map.put("appodeal_userSettings_setSmoking", new AppodealUserSettingsSetSmoking());
        return map;
    }

}
