package com.appodeal.aneplugins.methods;

import android.util.Log;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;

public class AppodealSet728x90Banners implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        try {
            boolean b728x90 = args[0].getAsBool();
            Appodeal.set728x90Banners(b728x90);
        } catch (Exception exception) {
            Log.w("AppodealPlugin", exception);
        }
        return null;

    }

}