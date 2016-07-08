package com.appodeal.aneplugins.utils;

import android.content.res.Resources;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;

public class AppodealGetDensity implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        try {
            float density = Resources.getSystem().getDisplayMetrics().density;
            return FREObject.newObject(density);
        } catch (Exception exception) {
            Log.w("AppodealPlugin", exception);
        }
        return null;

    }

}
