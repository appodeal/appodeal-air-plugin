package com.appodeal.aneplugins;

import android.app.Activity;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;

public class AppodealInitializeAdType implements FREFunction {

	@Override
	public FREObject call(FREContext context, FREObject[] args) {
		
		AppodealContext ctx = (AppodealContext)context;
		Activity activity = ctx.getActivity();
		
		try {
			String AppKey = args[0].getAsString();
			int AdType = args[1].getAsInt();
			Appodeal.initialize(activity, AppKey, AdType);
			//Log.i("AppodealPlugin", "Initializing Appodeal" + AppKey + "AdTypes: " + AdType);
			Appodeal.setInterstitialCallbacks(new AppodealInterstitialListener(ctx));
			//Log.i("AppodealPlugin", "Interstitial Callbacks initialized");
			Appodeal.setVideoCallbacks(new AppodealVideoListener(ctx));
			//Log.i("AppodealPlugin", "Video Callbacks initialized");
			Appodeal.setBannerCallbacks(new AppodealBannerListener(ctx));
			//Log.i("AppodealPlugin", "Video Banner initialized");
	    } catch (Exception e) {
	    	Log.i("AppodealPlugin", e.toString());
	    }
		return null;
	}


}
