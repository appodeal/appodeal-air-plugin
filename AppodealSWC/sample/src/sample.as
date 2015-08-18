package
{
	import com.appodeal.aneplugin.AdEvent;
	import com.appodeal.aneplugin.AdType;
	import com.appodeal.aneplugin.Appodeal;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import starling.core.Starling;
	
	public class sample extends Sprite
	{
		
		private var appodeal:Appodeal = new Appodeal();
		private var label:String = "Initialize";
		private var label1:String = "Interstitial Loading";
		private var label2:String = "Video Loading";
		private var labelInit:TextField = new TextField();
		private var labelVideo:TextField = new TextField();
		private var labelInterstitial:TextField = new TextField();
		private var labelHide:TextField = new TextField();
		private var mStarling:Starling;
		private var params = {};
		
		public function sample()
		{
			super();
			
			params.wmode = "direct";
			
			mStarling = new Starling(sample, stage);
			mStarling.stop();
			mStarling.start();
			
			labelInit.defaultTextFormat = new TextFormat('Verdana',30,0x000000);
			labelInit.text = label;
			labelInit.width = 500;
			labelInit.height = 100;
			labelInit.background = labelInit.border = true;
			labelInit.selectable = false;
			var initButton:Sprite = new Sprite();
			initButton.mouseChildren = false;
			initButton.addChild(labelInit);
			initButton.buttonMode = true;
			initButton.x = 100;
			initButton.y = 100;
			addChild(initButton);
			
			
			labelInterstitial.defaultTextFormat = new TextFormat('Verdana',30,0x000000);
			labelInterstitial.text = label1;
			labelInterstitial.width = 500;
			labelInterstitial.height = 100;
			labelInterstitial.background = labelInterstitial.border = true;
			labelInterstitial.selectable = false;
			var InterstitialButton:Sprite = new Sprite();
			InterstitialButton.mouseChildren = false;
			InterstitialButton.addChild(labelInterstitial);
			InterstitialButton.buttonMode = true;
			InterstitialButton.x = 100;
			InterstitialButton.y = 300;
			addChild(InterstitialButton);
			
			
			labelVideo.defaultTextFormat = new TextFormat('Verdana',30,0x000000);
			labelVideo.text = label2;
			labelVideo.width = 500;
			labelVideo.height = 100;
			labelVideo.background = labelVideo.border = true;
			labelVideo.selectable = false;
			var VideoButton:Sprite = new Sprite();
			VideoButton.mouseChildren = false;
			VideoButton.addChild(labelVideo);
			VideoButton.buttonMode = true;
			VideoButton.x = 100;
			VideoButton.y = 500;
			addChild(VideoButton);
			
			labelHide.defaultTextFormat = new TextFormat('Verdana',30,0x000000);
			labelHide.text = "Hide Banner";
			labelHide.width = 500;
			labelHide.height = 100;
			labelHide.background = labelHide.border = true;
			labelHide.selectable = false;
			var HideButton:Sprite = new Sprite();
			HideButton.mouseChildren = false;
			HideButton.addChild(labelHide);
			HideButton.buttonMode = true;
			HideButton.x = 100;
			HideButton.y = 700;
			addChild(HideButton);
			
			appodeal.addEventListener(AdEvent.VIDEO_LOADED, onVideoLoaded);
			appodeal.addEventListener(AdEvent.VIDEO_FAILED_TO_LOAD, onEvent);
			appodeal.addEventListener(AdEvent.VIDEO_FINISHED, onEvent);
			appodeal.addEventListener(AdEvent.VIDEO_SHOWN, onVideoShown);
			appodeal.addEventListener(AdEvent.VIDEO_CLOSED, onEvent);
			appodeal.addEventListener(AdEvent.INTERSTITIAL_LOADED, onInterstitialLoaded);
			appodeal.addEventListener(AdEvent.INTERSTITIAL_CLICKED, onEvent);
			appodeal.addEventListener(AdEvent.INTERSTITIAL_CLOSED, onEvent);
			appodeal.addEventListener(AdEvent.INTERSTITIAL_FAILED_TO_LOAD, onEvent);
			appodeal.addEventListener(AdEvent.INTERSTITIAL_SHOWN, onInterstitialShown);
			appodeal.addEventListener(AdEvent.BANNER_SHOWN, onEvent);
			appodeal.addEventListener(AdEvent.BANNER_LOADED, onBannerLoaded);
			appodeal.addEventListener(AdEvent.BANNER_FAILED_TO_LOAD, onEvent);
			appodeal.addEventListener(AdEvent.BANNER_CLICKED, onEvent);
			
			
			
			initButton.addEventListener(MouseEvent.CLICK, function(event:MouseEvent):void {
				appodeal.disableLocationPermissionCheck();
				var appKey:String = "453c5e41886fa92b78ffa648b3a2a629c2b5f705676feabc";
				appodeal.setTesting(true);
				appodeal.initializeAdType(appKey, AdType.ALL);
				labelInit.text = "Initialized v."+appodeal.getVersion();
			});
			
			InterstitialButton.addEventListener(MouseEvent.CLICK, function(event:MouseEvent):void {
				if(appodeal.isLoaded(AdType.INTERSTITIAL)){
					appodeal.show(AdType.INTERSTITIAL);
				}
			});
			
			VideoButton.addEventListener(MouseEvent.CLICK, function(event:MouseEvent):void {
				if(appodeal.isLoaded(AdType.VIDEO)){
					appodeal.show(AdType.VIDEO);
				}
			});
			
			HideButton.addEventListener(MouseEvent.CLICK, function(event:MouseEvent):void {
				appodeal.hide(AdType.BANNER);
			});
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;

		}
		
		protected function onEvent(ae:AdEvent):void
		{
			trace("Callbacks Working");
		}
		
		protected function onVideoLoaded(ae:AdEvent):void
		{
			labelVideo.text = "Video Ready"
		}
		
		protected function onInterstitialLoaded(ae:AdEvent):void
		{
			labelInterstitial.text = "Interstitial Ready";
		}
		
		protected function onBannerLoaded(ae:AdEvent):void
		{
			appodeal.show(AdType.BANNER_BOTTOM);
		}
		
		protected function onVideoShown(ae:AdEvent):void
		{
			labelVideo.text = "Video Loading"
		}
		
		protected function onInterstitialShown(ae:AdEvent):void
		{
			labelInterstitial.text = "Interstitial Loading";
		}

	}
}