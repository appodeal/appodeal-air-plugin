package com.appodeal.aneplugins.methods;

import android.util.Log;
import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;

public class AppodealGetRewardedParametersPlacement implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        try {
            String placement = args[0].getAsString();
            String level = "<info amount='" + Appodeal.getRewardParameters(placement).first + "' currency='" + Appodeal.getRewardParameters(placement).second + "' ></info>";
            return FREObject.newObject(level);
        } catch (Exception exception) {
            Log.w("AppodealPlugin", exception);
        }
        return null;
    }

}