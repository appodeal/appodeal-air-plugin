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
		
		AppodealContext ctx = (AppodealContext)context;
		Activity activity = ctx.getActivity();
		
		try {
			String AppKey = args[0].getAsString();
			Appodeal.initialize(activity, AppKey);
			//Log.i("AppodealPlugin", "Initializing Appodeal" + AppKey);
			Appodeal.setInterstitialCallbacks(new AppodealInterstitialListener(ctx));
			//Log.i("AppodealPlugin", "Interstitial Callbacks initialized");
			Appodeal.setVideoCallbacks(new AppodealVideoListener(ctx));
			//Log.i("AppodealPlugin", "Video Callbacks initialized");
			Appodeal.setBannerCallbacks(new AppodealBannerListener(ctx));
			//Log.i("AppodealPlugin", "Banner Callbacks initialized");
	    } catch (Exception e) {
	    	Log.i("AppodealPlugin", e.toString());
	    }
		return null;
	}

}