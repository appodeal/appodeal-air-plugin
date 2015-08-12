package com.appodeal.aneplugins;

import com.appodeal.ads.InterstitialCallbacks;

public class AppodealInterstitialListener implements InterstitialCallbacks {
	
	protected AppodealContext _ctx = null;
	
	public AppodealInterstitialListener(AppodealContext ctx)
	{
		_ctx = ctx;
	}

	@Override
	public void onInterstitialClicked() {
		_ctx.dispatchStatusEventAsync("INTERSTITIAL_CLICKED", "");
	}

	@Override
	public void onInterstitialClosed() {
		_ctx.dispatchStatusEventAsync("INTERSTITIAL_CLOSED", ""); 
	}

	@Override
	public void onInterstitialFailedToLoad() {
		_ctx.dispatchStatusEventAsync("INTERSTITIAL_FAILED_TO_LOAD", "");
	}

	@Override
	public void onInterstitialLoaded(boolean arg0) {
		_ctx.dispatchStatusEventAsync("INTERSTITIAL_LOADED", "");
	}

	@Override
	public void onInterstitialShown() {
		_ctx.dispatchStatusEventAsync("INTERSTITIAL_SHOWN", "");
	}

}
