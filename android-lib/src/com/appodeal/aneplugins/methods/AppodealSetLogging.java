package com.appodeal.aneplugins.methods;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;

public class AppodealSetLogging implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        try {
            boolean logging = args[0].getAsBool();
            if (logging) {
                Appodeal.setLogLevel(com.appodeal.ads.utils.Log.LogLevel.verbose);
            } else {
                Appodeal.setLogLevel(com.appodeal.ads.utils.Log.LogLevel.none);
            }
        } catch (Exception exception) {
            Log.w("AppodealPlugin", exception);
        }
        return null;
    }

}
