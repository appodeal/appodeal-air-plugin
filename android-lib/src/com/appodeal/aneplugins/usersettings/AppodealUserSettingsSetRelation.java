package com.appodeal.aneplugins.usersettings;

import android.app.Activity;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;
import com.appodeal.ads.UserSettings.Relation;
import com.appodeal.aneplugins.AppodealContext;

public class AppodealUserSettingsSetRelation implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        AppodealContext ctx = (AppodealContext) context;
        Activity activity = ctx.getActivity();

        try {
            int parameter = args[0].getAsInt();
            switch (parameter) {
                case 0:
                    Appodeal.getUserSettings(activity).setRelation(Relation.OTHER);
                case 1:
                    Appodeal.getUserSettings(activity).setRelation(Relation.SINGLE);
                case 2:
                    Appodeal.getUserSettings(activity).setRelation(Relation.DATING);
                case 3:
                    Appodeal.getUserSettings(activity).setRelation(Relation.ENGAGED);
                case 4:
                    Appodeal.getUserSettings(activity).setRelation(Relation.MARRIED);
                case 5:
                    Appodeal.getUserSettings(activity).setRelation(Relation.SEARCHING);
            }
        } catch (Exception e) {
            Log.i("AppodealPlugin", e.toString());
        }
        return null;
    }


}
