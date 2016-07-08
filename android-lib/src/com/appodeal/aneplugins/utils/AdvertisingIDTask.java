package com.appodeal.aneplugins.utils;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Build;

import android.util.Log;
import com.appodeal.aneplugins.Constants;
import com.google.android.gms.ads.identifier.AdvertisingIdClient;

public class AdvertisingIDTask extends AsyncTask<Void, Void, String> {

    private Activity mActivity;

    public AdvertisingIDTask(Activity activity) {
        mActivity = activity;
        activity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                if (Build.VERSION.SDK_INT >= 11) {
                    executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
                } else {
                    execute();
                }
            }
        });
    }

    @Override
    protected String doInBackground(Void... params) {
        SharedPreferences sharedPref = mActivity.getSharedPreferences(Constants.SHARED_PREFERENCES_NAME, Context.MODE_PRIVATE);

        String androidId = sharedPref.getString(Constants.ADVERTISING_ID, null);
        if (androidId == null) {
            try {
                Class.forName("com.google.android.gms.ads.identifier.AdvertisingIdClient");
                AdvertisingIdClient.class.getDeclaredMethod("getAdvertisingIdInfo", Context.class);
                AdvertisingIdClient.Info adInfo = AdvertisingIdClient.getAdvertisingIdInfo(mActivity);
                androidId = adInfo.getId();

                SharedPreferences.Editor editor = sharedPref.edit();
                editor.putString(Constants.ADVERTISING_ID, androidId);
                editor.apply();
                Log.w("AppodealPlugin", String.format("Advertising ID: %s", androidId));
            } catch (Exception e) {
                Log.w("AppodealPlugin", e);
            }
        }
        return androidId;
    }

    @Override
    protected void onPostExecute(String result) {
        Log.w("AppodealPlugin", String.format("Advertising ID: %s", result));
    }

}
