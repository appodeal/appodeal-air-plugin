package com.appodeal.aneplugins.utils;

import android.util.Log;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;

public class AppodealLog implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        try {
            String tag = args[0].getAsString();
            String message = args[1].getAsString();
            Log.d(tag, message);
        } catch (Exception e) {
            Log.e("AppodealPlugin", String.valueOf(e));
        }
        return null;

    }

}
