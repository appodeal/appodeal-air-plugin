package com.appodeal.aneplugins.methods;

import android.util.Log;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;

public class AppodealSetFramework implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        try {
            String framework = args[0].getAsString();
            String version = args[1].getAsString();
            Appodeal.setFramework(framework, version);
        } catch (Exception e) {
            Log.e("AppodealPlugin", e.toString());
        }
        return null;
    }

}