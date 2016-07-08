package com.appodeal.aneplugins.methods;

import android.app.Activity;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;

public class AppodealDisableNetwork implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        try {
            String network = args[0].getAsString();
            Activity activity = context.getActivity();
            Appodeal.disableNetwork(activity, network);
        } catch (Exception e) {
            Log.e("AppodealPlugin", String.valueOf(e));
        }
        return null;

    }

}
