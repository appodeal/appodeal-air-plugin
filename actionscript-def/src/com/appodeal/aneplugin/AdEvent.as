package com.appodeal.aneplugin {
	import flash.events.Event;

	public class AdEvent extends Event {
		public static const INTERSTITIAL_SHOWN:String = "interstitialShown";
		public static const INTERSTITIAL_LOADED:String = "interstitialLoaded";
		public static const INTERSTITIAL_FAILED_TO_LOAD:String = "interstitialFailedToLoad";
		public static const INTERSTITIAL_CLOSED:String = "interstitialClosed";
		public static const INTERSTITIAL_CLICKED:String = "interstitialClicked";

		public static const NON_SKIPPABLE_VIDEO_SHOWN:String = "nonSkippableVideoShown";
		public static const NON_SKIPPABLE_VIDEO_LOADED:String = "nonSkippableVideoLoaded";
		public static const NON_SKIPPABLE_VIDEO_FINISHED:String = "nonSkippableVideoFinished";
		public static const NON_SKIPPABLE_VIDEO_FAILED_TO_LOAD:String = "nonSkippableVideoFailedToLoad";
		public static const NON_SKIPPABLE_VIDEO_CLOSED:String = "nonSkippableVideoClosed";

		public static const REWARDED_VIDEO_SHOWN:String = "rewardedVideoShown";
		public static const REWARDED_VIDEO_LOADED:String = "rewardedVideoLoaded";
		public static const REWARDED_VIDEO_FINISHED:String = "rewardedVideoFinished";
		public static const REWARDED_VIDEO_FAILED_TO_LOAD:String = "rewardedVideoFailedToLoad";
		public static const REWARDED_VIDEO_CLOSED:String = "rewardedVideoClosed";

		public static const BANNER_SHOWN:String = "bannerShown";
		public static const BANNER_LOADED:String = "bannerLoaded";
		public static const BANNER_CLICKED:String = "bannerClicked";
		public static const BANNER_FAILED_TO_LOAD:String = "bannerFailedToLoad";

		internal var _amount:int;
		internal var _name:String;

		internal var _isPrecacheInterstitial:Boolean;
		internal var _isPrecacheBanner:Boolean;
		internal var _isFinishedRewardedVideo:Boolean;
		internal var _isFinishedNonSkippableVideo:Boolean;

		public function AdEvent(type:String) {
			super(type, false, false);
		}

		public function get amount():int { return _amount; }
		public function get name():String { return _name; }

		public function get isPrecacheInterstitial():Boolean { return _isPrecacheInterstitial; }
		public function get isPrecacheBanner():Boolean { return _isPrecacheBanner; }
		public function get isFinishedRewardedVideo():Boolean { return _isFinishedRewardedVideo; }
		public function get isFinishedNonSkippableVideo():Boolean { return _isFinishedNonSkippableVideo; }
	}
}