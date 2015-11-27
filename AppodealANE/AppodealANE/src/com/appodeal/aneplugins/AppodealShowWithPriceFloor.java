package com.appodeal.aneplugins;

import android.app.Activity;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;

public class AppodealShowWithPriceFloor implements FREFunction {

	@Override
	public FREObject call(FREContext context, FREObject[] args) {

		try
		{
			Activity activity = context.getActivity();
			int AdType = args[0].getAsInt();
			boolean ready = Appodeal.showWithPriceFloor(activity, AdType);
			return FREObject.newObject(ready);
		}
		catch ( Exception exception )
		{
			Log.w("AppodealPlugin", exception);
		}
		return null;

	}

}
