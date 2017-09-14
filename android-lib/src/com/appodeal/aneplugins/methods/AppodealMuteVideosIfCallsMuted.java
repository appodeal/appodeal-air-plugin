package com.appodeal.aneplugins.methods;

import android.util.Log;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;

public class AppodealMuteVideosIfCallsMuted implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        try {
            boolean value = args[0].getAsBool();
            Appodeal.muteVideosIfCallsMuted(value);
        } catch (Exception exception) {
            Log.w("AppodealPlugin", exception);
        }
        return null;
    }

}
