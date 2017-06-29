package com.appodeal.aneplugins.methods;

import android.app.Activity;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;
import com.appodeal.aneplugins.utils.AppodealANEUtils;

public class AppodealCache implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        try {
            int AdType = args[0].getAsInt();
            Activity activity = context.getActivity();
            Appodeal.cache(activity, AppodealANEUtils.getAdType(AdType));
        } catch (Exception exception) {
            Log.w("AppodealPlugin", exception);
        }
        return null;

    }

}
