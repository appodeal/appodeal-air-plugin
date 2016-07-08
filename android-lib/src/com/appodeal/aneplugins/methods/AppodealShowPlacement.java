package com.appodeal.aneplugins.methods;

import android.app.Activity;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;

public class AppodealShowPlacement implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        try {
            Activity activity = context.getActivity();
            int AdType = args[0].getAsInt();
            String placement = args[1].getAsString();
            boolean ready = Appodeal.show(activity, AdType, placement);
            return FREObject.newObject(ready);
        } catch (Exception exception) {
            Log.w("AppodealPlugin", exception);
        }
        return null;
    }

}