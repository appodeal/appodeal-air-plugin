package {
    import com.appodeal.aneplugin.Appodeal;

    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;

    public class Main extends Sprite {

        private var appodeal:Appodeal = new Appodeal();
        private var label:String = "Initialize";
        private var label1:String = "Interstitial";
        private var label2:String = "Video";
        private var label3:String = "Rewarded Video";
        private var labelInit:TextField = new TextField();
        private var labelVideo:TextField = new TextField();
        private var labelRewardedVideo:TextField = new TextField();
        private var labelInterstitial:TextField = new TextField();
        private var labelHide:TextField = new TextField();


        public function Main() {

            this.stage.scaleMode = StageScaleMode.NO_SCALE;
            this.stage.align = StageAlign.TOP;

            appodeal.log("MYNEWAPP", appodeal.getVersion());
            appodeal.toast("Initialized");

            labelInit.defaultTextFormat = new TextFormat('Verdana', 30, 0x000000);
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


            labelInterstitial.defaultTextFormat = new TextFormat('Verdana', 30, 0x000000);
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


            labelVideo.defaultTextFormat = new TextFormat('Verdana', 30, 0x000000);
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

            labelHide.defaultTextFormat = new TextFormat('Verdana', 30, 0x000000);
            labelHide.text = "Banner";
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

            labelRewardedVideo.defaultTextFormat = new TextFormat('Verdana', 30, 0x000000);
            labelRewardedVideo.text = label3;
            labelRewardedVideo.width = 500;
            labelRewardedVideo.height = 100;
            labelRewardedVideo.background = labelRewardedVideo.border = true;
            labelRewardedVideo.selectable = false;
            var RewardedVideoButton:Sprite = new Sprite();
            RewardedVideoButton.mouseChildren = false;
            RewardedVideoButton.addChild(labelRewardedVideo);
            RewardedVideoButton.buttonMode = true;
            RewardedVideoButton.x = 100;
            RewardedVideoButton.y = 900;
            addChild(RewardedVideoButton);

            initButton.addEventListener(MouseEvent.CLICK, function (event:MouseEvent):void {
                appodeal.disableLocationPermissionCheck();
                var appKey:String = "fee50c333ff3825fd6ad6d38cff78154de3025546d47a84f";
                //appodeal.setTesting(true);
                appodeal.confirm(Appodeal.SKIPPABLE_VIDEO);
                appodeal.initialize(appKey, Appodeal.INTERSTITIAL | Appodeal.SKIPPABLE_VIDEO | Appodeal.REWARDED_VIDEO | Appodeal.BANNER);
                labelInit.text = "Initialized v." + appodeal.getVersion();
            });

            InterstitialButton.addEventListener(MouseEvent.CLICK, function (event:MouseEvent):void {
                if (appodeal.isLoaded(Appodeal.INTERSTITIAL)) {
                    appodeal.show(Appodeal.INTERSTITIAL);
                }
            });

            VideoButton.addEventListener(MouseEvent.CLICK, function (event:MouseEvent):void {
                if (appodeal.isLoaded(Appodeal.SKIPPABLE_VIDEO)) {
                    appodeal.show(Appodeal.SKIPPABLE_VIDEO);
                }
            });

            RewardedVideoButton.addEventListener(MouseEvent.CLICK, function (event:MouseEvent):void {
                if (appodeal.isLoaded(Appodeal.REWARDED_VIDEO)) {
                    appodeal.show(Appodeal.REWARDED_VIDEO);
                }
            });

            HideButton.addEventListener(MouseEvent.CLICK, function (event:MouseEvent):void {
                appodeal.show(Appodeal.BANNER_BOTTOM);

            });
        }
    }
}