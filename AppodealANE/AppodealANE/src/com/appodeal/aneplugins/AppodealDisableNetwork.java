package com.appodeal.aneplugins;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;

public class AppodealDisableNetwork implements FREFunction {

	@Override
	public FREObject call(FREContext context, FREObject[] args) {
		
		try {
			String network = args[0].getAsString();
			Appodeal.disableNetwork(network);
		} catch (Exception e) {
	    	Log.i("AppodealPlugin", e.toString());
	    }
		return null;

	}

}
