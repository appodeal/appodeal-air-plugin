#import "AppodealANE.h"


void AppodealExtensionContextInitializer(
                                         void* extData,
                                         const uint8_t* ctxType,
                                         FREContext ctx,
                                         uint32_t* numFunctionsToSet,
                                         const FRENamedFunction** functionsToSet) {
    DLog(@"AppodealANE.AppodealExtensionContextInitializer");
    
    appodealAne = [[AppodealANE alloc] init];
    [appodealAne initContext:ctx];
    
    static FRENamedFunction functions[] = {
        MAP_FUNCTION(appodeal_initialize, NULL, appodeal_initialize),
        MAP_FUNCTION(appodeal_show, NULL, appodeal_show),
        MAP_FUNCTION(appodeal_showPlacement, NULL, appodeal_showPlacement),
        MAP_FUNCTION(appodeal_hide, NULL, appodeal_hide),
        MAP_FUNCTION(appodeal_cache, NULL, appodeal_cache),
        MAP_FUNCTION(appodeal_confirm, NULL, appodeal_confirm),
        MAP_FUNCTION(appodeal_setAutoCache, NULL, appodeal_setAutoCache),
        MAP_FUNCTION(appodeal_setTesting, NULL, appodeal_setTesting),
        MAP_FUNCTION(appodeal_setLogging, NULL, appodeal_setLogging),
        MAP_FUNCTION(appodeal_getVersion, NULL, appodeal_getVersion),
        MAP_FUNCTION(appodeal_logDebug, NULL, appodeal_logDebug),
        MAP_FUNCTION(appodeal_toastMessage, NULL, appodeal_toastMessage),
        MAP_FUNCTION(appodeal_disableNetwork, NULL, appodeal_disableNetwork),
        MAP_FUNCTION(appodeal_disableNetworkForAdType, NULL, appodeal_disableNetworkForAdType),
        MAP_FUNCTION(appodeal_disableLocationPermissionCheck, NULL, appodeal_disableLocationPermissionCheck),
        MAP_FUNCTION(appodeal_isLoaded, NULL, appodeal_isLoaded),
        MAP_FUNCTION(appodeal_setBannerAnimation, NULL, appodeal_setBannerAnimation),
        MAP_FUNCTION(appodeal_setBannerBackground, NULL, appodeal_setBannerBackground),
        MAP_FUNCTION(appodeal_setSmartBanners, NULL, appodeal_setSmartBanners),
        MAP_FUNCTION(appodeal_setCustomBooleanRule, NULL, appodeal_setCustomBooleanRule),
        MAP_FUNCTION(appodeal_setCustomIntegerRule, NULL, appodeal_setCustomIntegerRule),
        MAP_FUNCTION(appodeal_setCustomDoubleRule, NULL, appodeal_setCustomDoubleRule),
        MAP_FUNCTION(appodeal_setCustomStringRule, NULL, appodeal_setCustomStringRule),
        MAP_FUNCTION(appodeal_getIDFA, NULL, appodeal_getIDFA),
        MAP_FUNCTION(appodeal_getDensity, NULL, appodeal_getDensity),
        MAP_FUNCTION(appodeal_userSettings, NULL, appodeal_userSettings),
        MAP_FUNCTION(appodeal_callbacks, NULL, appodeal_callbacks),
    };
    
    *numFunctionsToSet = sizeof(functions)/sizeof(FRENamedFunction);
    *functionsToSet = functions;
}

void AppodealExtensionContextFinalizer(FREContext ctx) {
    DLog(@"AppodealANE.AppodealExtensionContextFinalizer");
    return;
}

void AppodealExtensionInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet) {
    DLog(@"AppodealANE.AppodealExtensionInitializer");
    
    *extDataToSet = NULL;
    *ctxInitializerToSet = &AppodealExtensionContextInitializer;
    *ctxFinalizerToSet = &AppodealExtensionContextFinalizer;
}

void AppodealExtensionFinalizer(void * extData) {
    DLog(@"AppodealANE.AppodealExtensionFinalizer");
    return;
}

DEFINE_ANE_FUNCTION(appodeal_initialize)  {return [appodealAne initialize:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_show)  {return [appodealAne show:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_showPlacement)  {return [appodealAne showPlacement:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_hide) {return [appodealAne hide:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_cache) {return [appodealAne cache:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_confirm) {return [appodealAne confirm:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_setAutoCache) {return [appodealAne setAutoCache:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_setTesting) {return [appodealAne setTesting:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_setLogging) {return [appodealAne setLogging:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_getVersion) {return [appodealAne getVersion:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_logDebug) {return [appodealAne logDebug:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_toastMessage) {return [appodealAne toastMessage:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_disableNetwork) {return [appodealAne disableNetwork:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_disableNetworkForAdType) {return [appodealAne disableNetworkForAdType:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_disableLocationPermissionCheck) {return [appodealAne disableLocationPermissionCheck:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_isLoaded) {return [appodealAne isLoaded:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_setBannerAnimation) {return [appodealAne setBannerAnimation:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_setBannerBackground) {return [appodealAne setBannerBackground:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_setSmartBanners) {return [appodealAne setSmartBanners:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_setCustomBooleanRule) {return [appodealAne setCustomBooleanRule:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_setCustomIntegerRule) {return [appodealAne setCustomIntegerRule:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_setCustomDoubleRule) {return [appodealAne setCustomDoubleRule:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_setCustomStringRule) {return [appodealAne setCustomStringRule:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_getIDFA) {return [appodealAne getIDFA:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_getDensity) {return [appodealAne getDensity:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_userSettings) {return [appodealAne userSettings:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_callbacks) {return [appodealAne callbacks:argc paramseters:argv];}


@implementation AppodealANE
@synthesize context, rootController;

-(void) initContext:(FREContext)ctx {
    context = ctx;
    //
    NSArray* windows = [[UIApplication sharedApplication] windows];
    UIWindow* window = [windows objectAtIndex:0];
    rootController = [window rootViewController];
}

-(FREObject)initialize:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.initializeAdTypes");
    
    [Appodeal setFramework:APDFrameworkAdobeAir];
    NSString* key = appodeal_freToString(argv[0]);
    
    int type = appodeal_freToInt(argv[1]);
    [Appodeal initializeWithApiKey:key types:type];
    return NULL;
}

-(FREObject)show:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.show");
    int showStyle = appodeal_freToInt(argv[0]);
    BOOL res = [Appodeal showAd:showStyle rootViewController:rootController];
    return appodeal_boolToFre(res);
}
-(FREObject)showPlacement:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.showWithPlacement");
    int showStyle = appodeal_freToInt(argv[0]);
    BOOL res = [Appodeal showAd:showStyle forPlacement:appodeal_freToString(argv[1]) rootViewController:rootController];
    return appodeal_boolToFre(res);
}

-(FREObject)hide:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.hideBanner");
    [Appodeal hideBanner];
    return NULL;
}

-(FREObject)cache:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.cacheBanner");
    int type = appodeal_freToInt(argv[0]);
    [Appodeal cacheAd:type];
    return NULL;
}

-(FREObject)confirm:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.cacheBanner");
    int type = appodeal_freToInt(argv[0]);
    [Appodeal confirmUsage:type];
    return NULL;
}

-(FREObject)setAutoCache:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.setAutoCache");
    int type = appodeal_freToInt(argv[0]);
    [Appodeal setAutocache:appodeal_freToBool(argv[1]) types:type];
    return NULL;
}

-(FREObject)setTesting:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.setTesting");
    [Appodeal setTestingEnabled:appodeal_freToBool(argv[0])];
    return NULL;
}

-(FREObject)setLogging:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.setLogging");
    [Appodeal setDebugEnabled:appodeal_freToBool(argv[0])];
    return NULL;
}

-(FREObject)logDebug:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.logDebug");
    NSString *logMessage = appodeal_freToString(argv[0]);
    NSLog(@"%@", logMessage);
    return NULL;
}

-(FREObject)toastMessage:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.toastMessage");
    NSString *message = appodeal_freToString(argv[0]);
    UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [toast show];
    int duration = 1;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [toast dismissWithClickedButtonIndex:0 animated:YES];
    });
    return NULL;
}

-(FREObject)setBannerAnimation:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.setBannerAnimation");
    [Appodeal setBannerAnimationEnabled:appodeal_freToBool(argv[0])];
    return NULL;
}

-(FREObject)setBannerBackground:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.setBannerBackground");
    [Appodeal setBannerBackgroundVisible:appodeal_freToBool(argv[0])];
    return NULL;
}

-(FREObject)setSmartBanners:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.setSmartBanners");
    [Appodeal setSmartBannersEnabled:appodeal_freToBool(argv[0])];
    return NULL;
}

-(FREObject)getVersion:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.getVersion");
    return appodeal_stringToFre([Appodeal getVersion]);
}

-(FREObject)getIDFA:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.getIDFA");
    NSString *idfaString = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    return appodeal_stringToFre(idfaString);
}

-(FREObject)getDensity:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.getDensity");
    double density = 1;
    density = [UIScreen mainScreen].scale;
    return appodeal_doubleToFre(density);
}

-(FREObject)disableNetwork:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.disableNetwork");
    [Appodeal disableNetworkForAdType:AppodealAdTypeInterstitial name:appodeal_freToString(argv[1])];
    [Appodeal disableNetworkForAdType:AppodealAdTypeBanner name:appodeal_freToString(argv[1])];
    [Appodeal disableNetworkForAdType:AppodealAdTypeSkippableVideo name:appodeal_freToString(argv[1])];
    [Appodeal disableNetworkForAdType:AppodealAdTypeRewardedVideo name:appodeal_freToString(argv[1])];
    [Appodeal disableNetworkForAdType:AppodealAdTypeNonSkippableVideo name:appodeal_freToString(argv[1])];
    return NULL;
}

-(FREObject)disableNetworkForAdType:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.disableNetworkForAdType");
    [Appodeal disableNetworkForAdType:appodeal_freToInt(argv[0]) name:appodeal_freToString(argv[1])];
    return NULL;
}

-(FREObject)disableLocationPermissionCheck:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.disableLocationPermissionCheck");
    [Appodeal disableLocationPermissionCheck];
    return NULL;
}

-(FREObject)isLoaded:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.isReadyForShowWithStyle");
    int showStyle = appodeal_freToInt(argv[0]);
    return appodeal_boolToFre([Appodeal isReadyForShowWithStyle:showStyle]);
}

-(FREObject)setCustomBooleanRule:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.setCustomBooleanRule");
    NSString *name = appodeal_freToString(argv[0]);
    BOOL value = appodeal_freToBool(argv[1]);
    NSString *ValueFromBOOL;
    if(value) {
        ValueFromBOOL = @"true";
    } else {
        ValueFromBOOL = @"false";
    }
    NSDictionary *tempDictionary = @{name: ValueFromBOOL};
    NSDictionary *dict =  [NSDictionary dictionaryWithDictionary:tempDictionary];
    [Appodeal setCustomRule:dict];
    return NULL;
}

-(FREObject)setCustomIntegerRule:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.setCustomIntegerRule");
    NSString *name = appodeal_freToString(argv[0]);
    int value = appodeal_freToInt(argv[1]);
    NSDictionary *tempDictionary = @{name: [NSNumber numberWithInt:value]};
    NSDictionary *dict =  [NSDictionary dictionaryWithDictionary:tempDictionary];
    [Appodeal setCustomRule:dict];
    return NULL;
}

-(FREObject)setCustomDoubleRule:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.setCustomDoubleRule");
    NSString *name = appodeal_freToString(argv[0]);
    double value = appodeal_freToDouble(argv[1]);
    NSDictionary *tempDictionary = @{name: [NSNumber numberWithDouble:value]};
    NSDictionary *dict =  [NSDictionary dictionaryWithDictionary:tempDictionary];
    [Appodeal setCustomRule:dict];
    return NULL;
}

-(FREObject)setCustomStringRule:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.setCustomStringRule");
    NSString *name = appodeal_freToString(argv[0]);
    NSString *value = appodeal_freToString(argv[1]);
    NSDictionary *tempDictionary = @{name: value};
    NSDictionary *dict =  [NSDictionary dictionaryWithDictionary:tempDictionary];
    [Appodeal setCustomRule:dict];
    return NULL;
}

-(FREObject)userSettings:(uint32_t)argc paramseters:(FREObject []) argv {
    int code = appodeal_freToInt(argv[0]);
    NSDate* date;
    uint value;

    switch (code) {
        case 1:
            [Appodeal setUserAge:appodeal_freToInt(argv[1])];
            break;
        case 2:
            value = appodeal_freToUint(argv[1]);
            date = [NSDate dateWithTimeIntervalSince1970:value];
            [Appodeal setUserBirthday:date];
            break;
        case 3:
            [Appodeal setUserEmail:appodeal_freToString(argv[1])];
            break;
        case 4:
            [Appodeal setUserInterests:appodeal_freToString(argv[1])];
            break;
        case 5:
            value = appodeal_freToInt(argv[1]);
            if (value) value = 3-value;
            [Appodeal setUserGender:value];
            break;
        case 6:
            [Appodeal setUserOccupation:appodeal_freToInt(argv[1])];
            break;
        case 7:
            [Appodeal setUserRelationship:appodeal_freToInt(argv[1])];
            break;
        case 8:
            [Appodeal setUserSmokingAttitude:appodeal_freToInt(argv[1])];
            break;
        case 9:
            [Appodeal setUserAlcoholAttitude:appodeal_freToInt(argv[1])];
            break;
        case 10:
            [Appodeal setUserId:appodeal_freToString(argv[1])];
            break;
    }
    return NULL;
}

-(FREObject)callbacks:(uint32_t)argc paramseters:(FREObject []) argv {
    bool isSet = appodeal_freToBool(argv[0]);
    int code = appodeal_freToInt(argv[1]);
    DLog(@"callbacks: %d, %d", code, isSet);
    switch (code) {
        case 1:
            [Appodeal setInterstitialDelegate:isSet?self:nil];
            break;
        case 2:
            [Appodeal setSkippableVideoDelegate:isSet?self:nil];
            break;
        case 3:
            [Appodeal setRewardedVideoDelegate:isSet?self:nil];
            break;
        case 4:
            [Appodeal setNonSkippableVideoDelegate:isSet?self:nil];
            break;
        case 5:
            [Appodeal setBannerDelegate:isSet?self:nil];
            break;
    }
    return NULL;
}


- (void)interstitialDidLoadAdisPrecache:(BOOL)precache {
    DLog(@"AppodealANE.interstitialDidLoadAd");
    DISPATCH_STATUS_EVENT(context, "INTERSTITIAL_LOADED", "");
}
- (void)interstitialDidFailToLoadAd {
    DLog(@"AppodealANE.interstitialDidFailToLoadAd");
    DISPATCH_STATUS_EVENT(context, "INTERSTITIAL_FAILED_TO_LOAD", "");
}
- (void)interstitialWillPresent {
    DLog(@"AppodealANE.interstitialWillPresent");
    DISPATCH_STATUS_EVENT(context, "INTERSTITIAL_SHOWN", "");
}
- (void)interstitialDidDismiss {
    DLog(@"AppodealANE.interstitialDidDismiss");
    DISPATCH_STATUS_EVENT(context, "INTERSTITIAL_CLOSED", "");
}
- (void)interstitialDidClick {
    DLog(@"AppodealANE.interstitialDidClick");
    DISPATCH_STATUS_EVENT(context, "INTERSTITIAL_CLICKED", "");
}

- (void)bannerDidLoadAdIsPrecache:(BOOL)precache {
   DLog(@"AppodealANE.bannerDidLoadAd");
   DISPATCH_STATUS_EVENT(context, "BANNER_LOADED", "");
}
- (void)bannerDidFailToLoadAd {
    DLog(@"AppodealANE.bannerDidFailToLoadAd");
    DISPATCH_STATUS_EVENT(context, "BANNER_FAILED_TO_LOAD", "");
}
- (void)bannerDidClick {
    DLog(@"AppodealANE.bannerDidClick");
    DISPATCH_STATUS_EVENT(context, "BANNER_CLICKED", "");
}
- (void)bannerDidShow {
    DLog(@"AppodealANE.bannerDidClick");
    DISPATCH_STATUS_EVENT(context, "BANNER_SHOWN", "");
}


- (void)skippableVideoDidLoadAd {
    DLog(@"AppodealANE.skippableVideoDidLoadAd");
    DISPATCH_STATUS_EVENT(context, "SKIPPABLE_VIDEO_LOADED", "");
}
- (void)skippableVideoDidFailToLoadAd {
    DLog(@"AppodealANE.skippableVideoDidFailToLoadAd");
    DISPATCH_STATUS_EVENT(context, "SKIPPABLE_VIDEO_FAILED_TO_LOAD", "");
}
- (void)skippableVideoDidPresent {
    DLog(@"AppodealANE.skippableVideoDidPresent");
    DISPATCH_STATUS_EVENT(context, "SKIPPABLE_VIDEO_SHOWN", "");
}
- (void)skippableVideoWillDismiss {
    DLog(@"AppodealANE.skippableVideoWillDismiss");
    DISPATCH_STATUS_EVENT(context, "SKIPPABLE_VIDEO_CLOSED", "");
}
- (void)skippableVideoDidClick {
    DLog(@"AppodealANE.skippableVideoDidClick");
}
- (void)skippableVideoDidFinish {
    DLog(@"AppodealANE.skippableVideoDidFinish");
    DISPATCH_STATUS_EVENT(context, "SKIPPABLE_VIDEO_FINISHED", "");
}


- (void)nonSkippableVideoDidLoadAd {
    DLog(@"AppodealANE.nonSkippableVideoDidLoadAd");
    DISPATCH_STATUS_EVENT(context, "NON_SKIPPABLE_VIDEO_LOADED", "");
}

- (void)nonSkippableVideoDidFailToLoadAd {
    DLog(@"AppodealANE.nonSkippableVideoDidFailToLoadAdd");
    DISPATCH_STATUS_EVENT(context, "NON_SKIPPABLE_VIDEO_FAILED_TO_LOAD", "");
}

- (void)nonSkippableVideoDidClick {
    DLog(@"AppodealANE.nonSkippableVideoDidClick");
}

- (void)nonSkippableVideoDidFinish {
    DLog(@"AppodealANE.nonSkippableVideoDidFinishd");
    DISPATCH_STATUS_EVENT(context, "NON_SKIPPABLE_VIDEO_FINISHED", "");
}

- (void)nonSkippableVideoDidPresent {
    DLog(@"AppodealANE.nonSkippableVideoDidPresent");
    DISPATCH_STATUS_EVENT(context, "NON_SKIPPABLE_VIDEO_SHOWN", "");
}

- (void)nonSkippableVideoWillDismiss {
    DLog(@"AppodealANE.nonSkippableVideoWillDismiss");
    DISPATCH_STATUS_EVENT(context, "NON_SKIPPABLE_VIDEO_CLOSED", "");
}


- (void)rewardedVideoDidLoadAd {
    DLog(@"AppodealANE.rewardedVideoDidLoadAd");
    DISPATCH_STATUS_EVENT(context, "REWARDED_VIDEO_LOADED", "");

}
- (void)rewardedVideoDidFailToLoadAd {
    DLog(@"AppodealANE.rewardedVideoDidFailToLoadAd");
    DISPATCH_STATUS_EVENT(context, "REWARDED_VIDEO_FAILED_TO_LOAD", "");
    
}
- (void)rewardedVideoDidPresent {
    DLog(@"AppodealANE.rewardedVideoDidPresent");
    DISPATCH_STATUS_EVENT(context, "REWARDED_VIDEO_SHOWN", "");
    }
- (void)rewardedVideoWillDismiss {
    DLog(@"AppodealANE.rewardedVideoWillDismiss");
    DISPATCH_STATUS_EVENT(context, "REWARDED_VIDEO_CLOSED", "");

}
- (void)rewardedVideoDidClick {
    DLog(@"AppodealANE.rewardedVideoDidClick");
}
- (void)rewardedVideoDidFinish:(NSUInteger)rewardAmount name:(NSString *)rewardName {
    DLog(@"AppodealANE.rewardedVideoDidFinish: %d, %@", (int)rewardAmount, rewardName);
    NSString* info = [NSString stringWithFormat:@"<info amount='%d' name='%@' />", (int)rewardAmount, rewardName];
    DISPATCH_STATUS_EVENT(context, "REWARDED_VIDEO_FINISHED", [info UTF8String]);
}

@end
