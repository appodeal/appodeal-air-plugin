package com.appodeal.aneplugins;

import java.util.HashMap;
import java.util.Map;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;

public class AppodealContext extends FREContext {

	@Override
	public void dispose() {	}

	@Override
	public Map<String, FREFunction> getFunctions() {
		Map<String, FREFunction> map = new HashMap<String, FREFunction>();
		
		map.put("initialize", new AppodealInitialize());
		map.put("initializeAdTypes", new AppodealInitializeAdType());
		map.put("show", new AppodealShowBanner());
		map.put("isLoaded", new AppodealIsLoaded());
		map.put("isPrecache", new AppodealIsPrecache());
		map.put("isLoadedWithPriceFloor", new AppodealIsLoadedWithPriceFloor());
		map.put("cacheBanner", new AppodealCacheBanner());
		map.put("setAutoCache", new AppodealSetAutoCache());
		map.put("setOnLoadedTriggerBoth", new AppodealSetOnLoadedTriggerBoth());
		map.put("showWithPriceFloor", new AppodealShowBannerWithPriceFloor());
		map.put("disableNetwork", new AppodealDisableNetwork());
		map.put("hide", new AppodealHide());
		map.put("disableLocationPermissionCheck", new AppodealDisableLocationPermissionCheck());
		map.put("setTesting", new AppodealSetTesting());
		map.put("getVersion", new AppodealGetVersion());
		return map;
	}

}
