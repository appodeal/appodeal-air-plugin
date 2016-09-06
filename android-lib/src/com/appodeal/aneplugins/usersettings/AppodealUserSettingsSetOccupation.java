package com.appodeal.aneplugins.usersettings;

import android.app.Activity;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;
import com.appodeal.ads.UserSettings.Occupation;
import com.appodeal.aneplugins.AppodealContext;

public class AppodealUserSettingsSetOccupation implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        AppodealContext ctx = (AppodealContext) context;
        Activity activity = ctx.getActivity();

        try {
            int parameter = args[0].getAsInt();
            switch (parameter) {
                case 0:
                    Appodeal.getUserSettings(activity).setOccupation(Occupation.OTHER);
                case 1:
                    Appodeal.getUserSettings(activity).setOccupation(Occupation.WORK);
                case 2:
                    Appodeal.getUserSettings(activity).setOccupation(Occupation.SCHOOL);
                case 3:
                    Appodeal.getUserSettings(activity).setOccupation(Occupation.UNIVERSITY);
            }
        } catch (Exception e) {
            Log.i("AppodealPlugin", e.toString());
        }
        return null;
    }


}
