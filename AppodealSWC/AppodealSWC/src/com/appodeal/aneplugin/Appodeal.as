package com.appodeal.aneplugin
{
	import flash.external.ExtensionContext;
	import flash.events.StatusEvent;
	import flash.events.EventDispatcher;
	import flash.system.Capabilities;
	
	public class Appodeal extends EventDispatcher
	{
		private var context:ExtensionContext;
		
		public function Appodeal()
		{
			if(!context)
				context = ExtensionContext.createExtensionContext("com.appodeal.aneplugin", null);
			if(context != null)
				context.addEventListener(StatusEvent.STATUS, onStatus);
			else
				trace("Error! Appodeal ANE was not properly added to your project.");
		}
		
		public static function isAndroid():Boolean {
			return Capabilities.manufacturer.indexOf("Android") != -1;
		}
		
		public static function isIOS():Boolean {
			return Capabilities.manufacturer.indexOf("iOS") != -1;
		}
		
		public function initialize(appKey:String):void
		{
			if (isAndroid())
				context.call("initialize", appKey);
		}
		
		public function initializeAdType(appKey:String, adType:int):void
		{
			if (isAndroid())
				context.call("initializeAdTypes", appKey, adType);
		}
		
		public function show(adType:int):Boolean
		{
			if (isAndroid()) var success : Boolean = context.call("show", adType) as Boolean;
			return success;
		}
		
		public function hide(adType:int):void
		{
			if (isAndroid()) context.call("hide", adType);
		}
		
		public function showWithPriceFloor(adType:int):Boolean
		{
			if (isAndroid()) var success : Boolean = context.call("showWithPriceFloor", adType) as Boolean;
			return success;
		}
		
		public function isLoaded(adType:int):Boolean
		{
			if (isAndroid()) var loaded : Boolean = context.call("isLoaded", adType) as Boolean;
			return loaded;
		}
		
		public function isPrecache(adType:int):Boolean
		{
			if (isAndroid()) var loaded : Boolean = context.call("isPrecache", adType) as Boolean;
			return loaded;
		}
		
		public function isLoadedWithPriceFloor(adType:int):Boolean
		{
			if (isAndroid()) var loaded : Boolean = context.call("isLoadedWithPriceFloor", adType) as Boolean;
			return loaded;
		}
		
		public function cache(adType:int):void
		{
			if (isAndroid()) context.call("cacheBanner", adType);
		}
		
		public function setAutoCache(adType:int, autoCache:Boolean):void
		{
			if (isAndroid()) context.call("setAutoCache", adType, autoCache);
		}
		
		public function setOnLoadedTriggerBoth(adType:int, autoCache:Boolean):void
		{
			if (isAndroid()) context.call("setOnLoadedTriggerBoth", adType, autoCache);
		}
		
		public function setTesting(testing:Boolean):void
		{
			if (isAndroid()) context.call("setTesting", testing);
		}
		
		public function disableNetwork(network:String):void
		{
			if (isAndroid()) context.call("disableNetwork", network);
		}
		
		public function disableLocationPermissionCheck():void
		{
			if (isAndroid()) context.call("disableLocationPermissionCheck");
		}
		
		public function getVersion():String
		{
			if (isAndroid()) var version : String = context.call("getVersion") as String;
			return version;
		}
		
		protected function onStatus(event:StatusEvent):void
		{
			var e:AdEvent = null;
			//trace(event.code+" onStatus");
			switch(event.code)
			{
				case "INTERSTITIAL_LOADED":
				{
					e = new AdEvent(AdEvent.INTERSTITIAL_LOADED);
					break;
				}
					
				case "INTERSTITIAL_FAILED_TO_LOAD":
				{
					e = new AdEvent(AdEvent.INTERSTITIAL_FAILED_TO_LOAD);
					break;
				}
					
				case "INTERSTITIAL_SHOWN":
				{
					e = new AdEvent(AdEvent.INTERSTITIAL_SHOWN);
					break;
				}
					
				case "INTERSTITIAL_CLICKED":
				{
					e = new AdEvent(AdEvent.INTERSTITIAL_CLICKED);
					break;
				}
					
				case "INTERSTITIAL_CLOSED":
				{
					e = new AdEvent(AdEvent.INTERSTITIAL_CLOSED);
					break;
				}
					
				case "VIDEO_LOADED":
				{
					e = new AdEvent(AdEvent.VIDEO_LOADED);
					break;
				}
					
				case "VIDEO_FINISHED":
				{
					e = new AdEvent(AdEvent.VIDEO_FINISHED);
					break;
				}
					
				case "VIDEO_FAILED_TO_LOAD":
				{
					e = new AdEvent(AdEvent.VIDEO_FAILED_TO_LOAD);
					break;
				}
					
				case "VIDEO_SHOWN":
				{
					e = new AdEvent(AdEvent.VIDEO_SHOWN);
					break;
				}
					
				case "VIDEO_CLOSED":
				{
					e = new AdEvent(AdEvent.VIDEO_CLOSED);
					break;
				}
					
				case "BANNER_CLICKED":
				{
					e = new AdEvent(AdEvent.BANNER_CLICKED);
					break;
				}
					
				case "BANNER_FAILED_TO_LOAD":
				{
					e = new AdEvent(AdEvent.BANNER_FAILED_TO_LOAD);
					break;
				}
					
				case "BANNER_LOADED":
				{
					e = new AdEvent(AdEvent.BANNER_LOADED);
					break;
				}
					
				case "BANNER_SHOWN":
				{
					e = new AdEvent(AdEvent.BANNER_SHOWN);
					break;
				}
					
			}
			
			if(e != null){ dispatchEvent(e); }
				
		}
		
	}
}

