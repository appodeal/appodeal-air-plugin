package com.appodeal.aneplugins.usersettings;

import android.app.Activity;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;
import com.appodeal.ads.UserSettings.Smoking;
import com.appodeal.aneplugins.AppodealContext;

public class AppodealUserSettingsSetSmoking implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        AppodealContext ctx = (AppodealContext) context;
        Activity activity = ctx.getActivity();

        try {
            int parameter = args[0].getAsInt();
            switch (parameter) {
                case 1:
                    Appodeal.getUserSettings(activity).setSmoking(Smoking.NEGATIVE);
                case 2:
                    Appodeal.getUserSettings(activity).setSmoking(Smoking.NEUTRAL);
                case 3:
                    Appodeal.getUserSettings(activity).setSmoking(Smoking.POSITIVE);
            }
        } catch (Exception e) {
            Log.i("AppodealPlugin", e.toString());
        }
        return null;
    }


}
