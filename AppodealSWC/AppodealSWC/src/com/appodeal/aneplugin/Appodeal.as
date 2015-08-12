package com.appodeal.aneplugin
{
	import flash.external.ExtensionContext;
	import flash.events.StatusEvent;
	import flash.events.EventDispatcher;
	
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
		
		public function initialize(appKey:String):void
		{
			context.call("initialize", appKey);
		}
		
		public function initializeAdType(appKey:String, adType:int):void
		{
			context.call("initializeAdTypes", appKey, adType);
		}
		
		public function show(adType:int):Boolean
		{
			var success : Boolean = context.call("showBanner", adType) as Boolean;
			return success;
		}
		
		public function showBannerWithPriceFloor(adType:int):Boolean
		{
			var success : Boolean = context.call("showBannerWithPriceFloor", adType) as Boolean;
			return success;
		}
		
		public function isLoaded(adType:int):Boolean
		{
			var loaded : Boolean = context.call("isLoaded", adType) as Boolean;
			return loaded;
		}
		
		public function isPrecache(adType:int):Boolean
		{
			var loaded : Boolean = context.call("isPrecache", adType) as Boolean;
			return loaded;
		}
		
		public function cacheBanner(adType:int):void
		{
			context.call("cacheBanner", adType);
		}
		
		public function setAutoCache(adType:int, autoCache:Boolean):void
		{
			context.call("setAutoCache", adType, autoCache);
		}
		
		public function setOnLoadedTriggerBoth(adType:int, autoCache:Boolean):void
		{
			context.call("setOnLoadedTriggerBoth", adType, autoCache);
		}
		
		public function disableNetwork(network:String):void
		{
			context.call("disableNetwork", network);
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
					
			}
			
			if(e != null){ dispatchEvent(e); }
				
		}
		
	}
}

