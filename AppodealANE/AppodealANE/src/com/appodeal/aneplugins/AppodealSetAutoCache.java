package com.appodeal.aneplugins;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;

public class AppodealSetAutoCache implements FREFunction {

	@Override
	public FREObject call(FREContext context, FREObject[] args) {
		
		try {
			int AdType = args[0].getAsInt();
			boolean autoCache = args[1].getAsBool();
			Appodeal.setAutoCache(AdType, autoCache);
	    } catch (Exception exception) {
	    	Log.w("AppodealPlugin", exception);
	    }
		return null;

	}

}
