package com.appodeal.aneplugins.utils;

import android.app.Activity;
import android.util.Log;

import android.widget.Toast;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;

public class AppodealToast implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        try {
            String message = args[0].getAsString();
            Activity activity = context.getActivity();
            Toast.makeText(activity, message, Toast.LENGTH_SHORT).show();
        } catch (Exception e) {
            Log.e("AppodealPlugin", String.valueOf(e));
        }
        return null;

    }

}