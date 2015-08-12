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
		
		public var _data:String; //extra info about event
		
		public function AdEvent(type:String, data:String = null)
		{
			super(type, false, false);
			_data = data;
		}
	}
}