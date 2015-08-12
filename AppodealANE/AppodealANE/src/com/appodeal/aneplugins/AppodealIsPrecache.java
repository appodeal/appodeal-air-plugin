package com.appodeal.aneplugins;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;

public class AppodealIsPrecache implements FREFunction {

	@Override
	public FREObject call(FREContext context, FREObject[] args) {

		try
		{
			int AdType = args[0].getAsInt();
			boolean isPrecache = Appodeal.isPrecache(AdType);
			return FREObject.newObject(isPrecache);
		}
		catch ( Exception exception )
		{
			Log.w("AppodealPlugin", exception);
		}
		return null;

	}

}
