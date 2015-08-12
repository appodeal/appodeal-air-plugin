package com.appodeal.aneplugins;

import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;

public class AppodealGetVersion implements FREFunction {

	@Override
	public FREObject call(FREContext context, FREObject[] args) {

		try
		{
			String isPrecache = Appodeal.getVersion();
			return FREObject.newObject(isPrecache);
		}
		catch ( Exception exception )
		{
			Log.w("AppodealPlugin", exception);
		}
		return null;

	}

}
