package com.appodeal.aneplugins.utils;

import com.appodeal.ads.Appodeal;

public class AppodealANEUtils {

    public static int getAdType(int adType) {
        int type = 0;

        if((adType & Appodeal.INTERSTITIAL) > 0) {
            type |= Appodeal.INTERSTITIAL;
        }

        if((adType & Appodeal.BANNER) > 0) {
            type |= Appodeal.BANNER;
        }

        if((adType & Appodeal.BANNER_BOTTOM) > 0) {
            type |= Appodeal.BANNER_BOTTOM;
        }

        if((adType & Appodeal.BANNER_TOP) > 0) {
            type |= Appodeal.BANNER_TOP;
        }

        if((adType & Appodeal.REWARDED_VIDEO) > 0) {
            type |= Appodeal.REWARDED_VIDEO;
        }

        if((adType & 256) > 0) {
            type |= Appodeal.NON_SKIPPABLE_VIDEO;
        }
        return type;
    }

}
