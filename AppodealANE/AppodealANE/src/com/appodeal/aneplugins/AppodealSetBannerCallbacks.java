package com.appodeal.aneplugins;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;

public class AppodealSetBannerCallbacks implements FREFunction {

	@Override
	public FREObject call(FREContext context, FREObject[] args) {
		
		AppodealContext ctx = (AppodealContext)context;
		
		try {
			Appodeal.setBannerCallbacks(new AppodealBannerListener(ctx));
		} catch (Exception exception) {
	    	Log.e("AppodealPlugin", String.valueOf(exception));
	    }
		return null;
		
	}

}
