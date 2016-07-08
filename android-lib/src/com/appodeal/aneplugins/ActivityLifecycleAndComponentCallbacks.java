package com.appodeal.aneplugins;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Application;
import android.content.ComponentCallbacks;
import android.content.res.Configuration;
import android.os.Bundle;
import android.util.Log;

@TargetApi(14)
public class ActivityLifecycleAndComponentCallbacks implements Application.ActivityLifecycleCallbacks, ComponentCallbacks {

    @Override
    public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
        Log.d(Constants.LOG_TAG, activity.getLocalClassName()+" activity created");
    }

    @Override
    public void onActivityStarted(Activity activity) {
        Log.d(Constants.LOG_TAG, activity.getLocalClassName()+" activity started");
    }

    @Override
    public void onActivityResumed(Activity activity) {
        Log.d(Constants.LOG_TAG, activity.getLocalClassName()+" activity resumed");
    }

    @Override
    public void onActivityPaused(Activity activity) {
        Log.d(Constants.LOG_TAG, activity.getLocalClassName()+" activity paused");
    }

    @Override
    public void onActivityStopped(Activity activity) {
        Log.d(Constants.LOG_TAG, activity.getLocalClassName()+" activity stopped");
    }

    @Override
    public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
        Log.d(Constants.LOG_TAG, activity.getLocalClassName()+" activity saved");
    }

    @Override
    public void onActivityDestroyed(Activity activity) {
        Log.d(Constants.LOG_TAG, activity.getLocalClassName()+" activity destroyed");
    }

    @Override
    public void onConfigurationChanged(Configuration newConfig) {
        Log.d(Constants.LOG_TAG, "activity configuration changed " + newConfig.orientation);
    }

    @Override
    public void onLowMemory() { }

}
