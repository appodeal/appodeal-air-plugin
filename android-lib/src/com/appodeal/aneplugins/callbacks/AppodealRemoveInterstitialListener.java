package com.appodeal.aneplugins.callbacks;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;

public class AppodealRemoveInterstitialListener implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        try {
            Appodeal.setInterstitialCallbacks(null);
        } catch (Exception exception) {
            Log.e("AppodealPlugin", String.valueOf(exception));
        }
        return null;

    }

}