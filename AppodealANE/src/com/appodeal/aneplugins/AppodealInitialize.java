package com.appodeal.aneplugins;

import android.app.Activity;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;

public class AppodealInitialize implements FREFunction {

	@Override
	public FREObject call(FREContext context, FREObject[] args) {
		
		String AppKey = null;
		try {
			AppKey = args[0].getAsString();
			Log.i("AppodealPlugin", "Got appKey="+AppKey);
	    } catch (Exception e) {
	    	Log.i("AppodealPlugin", e.toString());
	    }
		
		Activity activity = context.getActivity();
		Appodeal.initialize(activity, AppKey);
		Log.i("AppodealPlugin", "Initializing Appodeal" + AppKey);
		
		return null;

	}

}
