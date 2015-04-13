package com.appodeal.aneplugins;

import android.app.Activity;
import android.util.Log;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.appodeal.ads.Appodeal;

public class AppodealShowBanner implements FREFunction {

	@Override
	public FREObject call(FREContext context, FREObject[] args) {

		final Activity activity = context.getActivity();
		context.getActivity().runOnUiThread(new Runnable() {
			public void run() {
				Appodeal.showBanner(activity);
				//Toast.makeText(activity, "Initizlizing Appodeal",
					//	Toast.LENGTH_SHORT).show();
				Log.i("AppodealPlugin", "Showing Banner");
			}
		});
		return null;
	}

}
