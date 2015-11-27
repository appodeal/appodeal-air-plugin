package com.appodeal.aneplugin
{
	import flash.events.Event;

	public class AdEvent extends Event
	{
		public static const INTERSTITIAL_SHOWN:String = "INTERSTITIAL_SHOWN";
		public static const INTERSTITIAL_LOADED:String = "INTERSTITIAL_LOADED";
		public static const INTERSTITIAL_FAILED_TO_LOAD:String = "INTERSTITIAL_FAILED_TO_LOAD";
		public static const INTERSTITIAL_CLOSED:String = "INTERSTITIAL_CLOSED";
		public static const INTERSTITIAL_CLICKED:String = "INTERSTITIAL_CLICKED";
		public static const VIDEO_SHOWN:String = "VIDEO_SHOWN";
		public static const VIDEO_LOADED:String = "VIDEO_LOADED";
		public static const VIDEO_FINISHED:String = "VIDEO_FINISHED";
		public static const VIDEO_FAILED_TO_LOAD:String = "VIDEO_FAILED_TO_LOAD";
		public static const VIDEO_CLOSED:String = "VIDEO_CLOSED";
		public static const REWARDED_VIDEO_SHOWN:String = "REWARDED_VIDEO_SHOWN";
		public static const REWARDED_VIDEO_LOADED:String = "REWARDED_VIDEO_LOADED";
		public static const REWARDED_VIDEO_FINISHED:String = "REWARDED_VIDEO_FINISHED";
		public static const REWARDED_VIDEO_FAILED_TO_LOAD:String = "REWARDED_VIDEO_FAILED_TO_LOAD";
		public static const REWARDED_VIDEO_CLOSED:String = "REWARDED_VIDEO_CLOSED";
		public static const BANNER_SHOWN:String = "BANNER_SHOWN";
		public static const BANNER_LOADED:String = "BANNER_LOADED";
		public static const BANNER_CLICKED:String = "BANNER_CLICKEDD";
		public static const BANNER_FAILED_TO_LOAD:String = "BANNER_FAILED_TO_LOAD";
		
		public var _data:String; //extra info about event
		
		public function AdEvent(type:String, data:String = null)
		{
			super(type, false, false);
			_data = data;
		}
	}
}