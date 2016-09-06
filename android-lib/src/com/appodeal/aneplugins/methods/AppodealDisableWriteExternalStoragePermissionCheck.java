package com.appodeal.aneplugins.methods;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;

public class AppodealDisableWriteExternalStoragePermissionCheck implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        try {
            Appodeal.disableWriteExternalStoragePermissionCheck();
        } catch (Exception e) {
            Log.i("AppodealPlugin", e.toString());
        }
        return null;
    }


}
