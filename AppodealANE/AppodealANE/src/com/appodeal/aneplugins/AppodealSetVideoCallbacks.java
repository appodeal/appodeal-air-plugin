package com.appodeal.aneplugins;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;

public class AppodealSetVideoCallbacks implements FREFunction {

	@Override
	public FREObject call(FREContext context, FREObject[] args) {
		
		AppodealContext ctx = (AppodealContext)context;
		
		try {
			Appodeal.setVideoCallbacks(new AppodealVideoListener(ctx));
	    } catch (Exception exception) {
	    	Log.e("AppodealPlugin", String.valueOf(exception));
	    }
		return null;
		
	}

}