package com.appodeal.aneplugins.methods;

import android.app.Activity;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;

public class AppodealTrackInAppPurchase implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        try {
            Double amount = args[0].getAsDouble();
            String currency = args[1].getAsString();
            Activity activity = context.getActivity();
            Appodeal.trackInAppPurchase(activity, amount, currency);
        } catch (Exception e) {
            Log.e("AppodealPlugin", String.valueOf(e));
        }
        return null;

    }

}
