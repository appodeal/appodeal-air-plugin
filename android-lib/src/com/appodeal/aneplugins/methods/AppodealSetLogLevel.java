package com.appodeal.aneplugins.methods;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;

public class AppodealSetLogLevel implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        try {
            int logLevel = args[0].getAsInt();

            switch (logLevel) {
                case 0:
                    Appodeal.setLogLevel(com.appodeal.ads.utils.Log.LogLevel.none);
                    break;
                case 1:
                    Appodeal.setLogLevel(com.appodeal.ads.utils.Log.LogLevel.debug);
                    break;
                case 2:
                    Appodeal.setLogLevel(com.appodeal.ads.utils.Log.LogLevel.verbose);
                    break;
                default:
                    Appodeal.setLogLevel(com.appodeal.ads.utils.Log.LogLevel.none);
                    break;
            }
        } catch (Exception exception) {
            Log.w("AppodealPlugin", exception);
        }
        return null;
    }

}