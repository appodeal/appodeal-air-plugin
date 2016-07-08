package com.appodeal.aneplugins.utils;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;

import android.util.Log;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.adobe.fre.FREWrongThreadException;
import com.appodeal.aneplugins.AppodealContext;
import com.appodeal.aneplugins.Constants;

public class AppodealGetAdID implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        AppodealContext ctx = (AppodealContext) context;
        Activity activity = ctx.getActivity();
        FREObject freObject = null;
        SharedPreferences sharedPref = activity.getSharedPreferences(Constants.SHARED_PREFERENCES_NAME, Context.MODE_PRIVATE);
        String androidId = sharedPref.getString(Constants.ADVERTISING_ID, null);
        try {
            freObject = FREObject.newObject(androidId);
        } catch (FREWrongThreadException e) {
            Log.w("AppodealPlugin", e);
        }
        return freObject;
    }

}
