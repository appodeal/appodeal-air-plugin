package com.appodeal.aneplugins;

import android.app.Activity;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;

public class AppodealDisableForAdType implements FREFunction {

	@Override
	public FREObject call(FREContext context, FREObject[] args) {
		
		try {
			String network = args[0].getAsString();
			int AdType = args[1].getAsInt();
			Activity activity = context.getActivity();
			Appodeal.disableNetwork(activity, network, AdType);
		} catch (Exception e) {
	    	Log.e("AppodealPlugin", String.valueOf(e));
	    }
		return null;

	}

}
