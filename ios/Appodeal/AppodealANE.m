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
        MAP_FUNCTION(appodeal_isLoaded, NULL, appodeal_isLoaded),
        MAP_FUNCTION(appodeal_cache, NULL, appodeal_cache),
        MAP_FUNCTION(appodeal_hide, NULL, appodeal_hide),
        MAP_FUNCTION(appodeal_setAutoCache, NULL, appodeal_setAutoCache),
        MAP_FUNCTION(appodeal_isPrecache, NULL, appodeal_isPrecache),
        
        MAP_FUNCTION(appodeal_setTabletBanners, NULL, appodeal_setTabletBanners),
        MAP_FUNCTION(appodeal_setSmartBanners, NULL, appodeal_setSmartBanners),
        MAP_FUNCTION(appodeal_setBannerAnimation, NULL, appodeal_setBannerAnimation),
        MAP_FUNCTION(appodeal_setBannerBackground, NULL, appodeal_setBannerBackground),
        MAP_FUNCTION(appodeal_setTesting, NULL, appodeal_setTesting),
        MAP_FUNCTION(appodeal_setLogLevel, NULL, appodeal_setLogLevel),
        MAP_FUNCTION(appodeal_setChildDirectedTreatment, NULL, appodeal_setChildDirectedTreatment),
        MAP_FUNCTION(appodeal_disableNetwork, NULL, appodeal_disableNetwork),
        MAP_FUNCTION(appodeal_disableNetworkForAdType, NULL, appodeal_disableNetworkForAdType),
        MAP_FUNCTION(appodeal_setTriggerOnLoadedOnPrecache, NULL, appodeal_setTriggerOnLoadedOnPrecache),
        MAP_FUNCTION(appodeal_disableLocationPermissionCheck, NULL, appodeal_disableLocationPermissionCheck),
        MAP_FUNCTION(appodeal_disableWriteExternalStoragePermissionCheck, NULL, appodeal_disableWriteExternalStoragePermissionCheck),
        MAP_FUNCTION(appodeal_requestMPermissions, NULL, appodeal_requestMPermissions),
        MAP_FUNCTION(appodeal_muteVideosIfCallsMuted, NULL, appodeal_muteVideosIfCallsMuted),
        MAP_FUNCTION(appodeal_showTestScreen, NULL, appodeal_showTestScreen),
        MAP_FUNCTION(appodeal_setFramework, NULL, appodeal_setFramework),
        MAP_FUNCTION(appodeal_getVersion, NULL, appodeal_getVersion),
        
        MAP_FUNCTION(appodeal_canShow, NULL, appodeal_canShow),
        MAP_FUNCTION(appodeal_canShowPlacement, NULL, appodeal_canShowPlacement),
        MAP_FUNCTION(appodeal_setCustomBooleanRule, NULL, appodeal_setCustomBooleanRule),
        MAP_FUNCTION(appodeal_setCustomIntegerRule, NULL, appodeal_setCustomIntegerRule),
        MAP_FUNCTION(appodeal_setCustomDoubleRule, NULL, appodeal_setCustomDoubleRule),
        MAP_FUNCTION(appodeal_setCustomStringRule, NULL, appodeal_setCustomStringRule),
        MAP_FUNCTION(appodeal_trackInAppPurchase, NULL, appodeal_trackInAppPurchase),
        MAP_FUNCTION(appodeal_getRewardedParameters, NULL, appodeal_getRewardedParameters),
        MAP_FUNCTION(appodeal_getRewardedParametersPlacement, NULL, appodeal_getRewardedParametersPlacement),
        
        MAP_FUNCTION(appodeal_getDensity, NULL, appodeal_getDensity),
        MAP_FUNCTION(appodeal_getIDFA, NULL, appodeal_getIDFA),
        MAP_FUNCTION(appodeal_logDebug, NULL, appodeal_logDebug),
        MAP_FUNCTION(appodeal_toastMessage, NULL, appodeal_toastMessage),
        
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
DEFINE_ANE_FUNCTION(appodeal_isLoaded) {return [appodealAne isLoaded:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_cache) {return [appodealAne cache:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_hide) {return [appodealAne hide:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_setAutoCache) {return [appodealAne setAutoCache:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_isPrecache) {return [appodealAne isPrecache:argc paramseters:argv];}

DEFINE_ANE_FUNCTION(appodeal_setTabletBanners) {return [appodealAne setTabletBanners:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_setSmartBanners) {return [appodealAne setSmartBanners:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_setBannerAnimation) {return [appodealAne setBannerAnimation:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_setBannerBackground) {return [appodealAne setBannerBackground:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_setTesting) {return [appodealAne setTesting:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_setLogLevel) {return [appodealAne setLogLevel:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_setChildDirectedTreatment) {return [appodealAne setChildDirectedTreatment:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_disableNetwork) {return [appodealAne disableNetwork:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_disableNetworkForAdType) {return [appodealAne disableNetworkForAdType:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_setTriggerOnLoadedOnPrecache) {return [appodealAne setTriggerOnLoadedOnPrecache:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_disableLocationPermissionCheck) {return [appodealAne disableLocationPermissionCheck:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_disableWriteExternalStoragePermissionCheck) {return [appodealAne disableWriteExternalStoragePermissionCheck:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_requestMPermissions) {return [appodealAne requestMPermissions:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_muteVideosIfCallsMuted) {return [appodealAne muteVideosIfCallsMuted:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_showTestScreen) {return [appodealAne showTestScreen:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_setFramework) {return [appodealAne setFramework:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_getVersion) {return [appodealAne getVersion:argc paramseters:argv];}

DEFINE_ANE_FUNCTION(appodeal_canShow)  {return [appodealAne canShow:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_canShowPlacement)  {return [appodealAne canShowPlacement:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_setCustomBooleanRule) {return [appodealAne setCustomBooleanRule:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_setCustomIntegerRule) {return [appodealAne setCustomIntegerRule:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_setCustomDoubleRule) {return [appodealAne setCustomDoubleRule:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_setCustomStringRule) {return [appodealAne setCustomStringRule:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_trackInAppPurchase) {return [appodealAne trackInAppPurchase:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_getRewardedParameters) {return [appodealAne getRewardedParameters:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_getRewardedParametersPlacement) {return [appodealAne getRewardedParametersPlacement:argc paramseters:argv];}

DEFINE_ANE_FUNCTION(appodeal_getDensity) {return [appodealAne getDensity:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_getIDFA) {return [appodealAne getIDFA:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_logDebug) {return [appodealAne logDebug:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_toastMessage) {return [appodealAne toastMessage:argc paramseters:argv];}

DEFINE_ANE_FUNCTION(appodeal_userSettings) {return [appodealAne userSettings:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_callbacks) {return [appodealAne callbacks:argc paramseters:argv];}


@implementation AppodealANE
@synthesize context, rootController;

bool isInterstitialPrecache;
bool isBannerPrecache;
bool isRewardedVideoFinished;
bool isNonSkippableVideoFinished;

-(int) getAdType:(int)adType {
    AppodealAdType type = 0;
    
    if((adType & 3) > 0) {
        type |= AppodealAdTypeInterstitial;
    }
    
    if((adType & 4) > 0 || (adType & 8) > 0 || (adType & 16) > 0) {
        type |= AppodealAdTypeBanner;
    }
    
    if((adType & 128) > 0) {
        type |= AppodealAdTypeRewardedVideo;
    }
    
    if((adType & 256) > 0) {
        type |= AppodealAdTypeNonSkippableVideo;
    }
    
    return type;
}

-(int) getShowType:(int)adType {
    
    if((adType & 3) > 0) {
        return AppodealShowStyleInterstitial;
    }
    
    if((adType & 4) > 0) {
        return AppodealShowStyleBannerBottom;
    }
        
    if((adType & 8) > 0) {
        return AppodealShowStyleBannerBottom;
    }
    
    if((adType & 16) > 0) {
        return AppodealShowStyleBannerTop;
    }
    
    if((adType & 128) > 0) {
        return AppodealShowStyleRewardedVideo;
    }
    
    if((adType & 256) > 0) {
        return AppodealShowStyleNonSkippableVideo;
    }
    
    return 0;
}

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
    [Appodeal initializeWithApiKey:key types:[self getAdType:type]];
    return NULL;
}

-(FREObject)show:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.show");
    int showStyle = appodeal_freToInt(argv[0]);
    BOOL res = [Appodeal showAd:[self getShowType:showStyle] rootViewController:rootController];
    return appodeal_boolToFre(res);
}

-(FREObject)showPlacement:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.showWithPlacement");
    int showStyle = appodeal_freToInt(argv[0]);
    BOOL res = [Appodeal showAd:[self getShowType:showStyle] forPlacement:appodeal_freToString(argv[1]) rootViewController:rootController];
    return appodeal_boolToFre(res);
}

-(FREObject)isLoaded:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.isReadyForShowWithStyle");
    int showStyle = appodeal_freToInt(argv[0]);
    return appodeal_boolToFre([Appodeal isReadyForShowWithStyle:[self getShowType:showStyle]]);
}

-(FREObject)cache:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.cacheBanner");
    int type = appodeal_freToInt(argv[0]);
    [Appodeal cacheAd:[self getAdType:type]];
    return NULL;
}

-(FREObject)hide:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.hideBanner");
    [Appodeal hideBanner];
    return NULL;
}

-(FREObject)setAutoCache:(uint32_t)argc paramseters:(FREObject []) argv {
    int type = appodeal_freToInt(argv[0]);
    DLog(@"AppodealANE.setAutoCache " + type);
    [Appodeal setAutocache:appodeal_freToBool(argv[1]) types:[self getAdType:type]];
    return NULL;
}

-(FREObject)isPrecache:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.isPrecache");
    int adType = [self getAdType:appodeal_freToInt(argv[0])];
    if(adType == AppodealAdTypeInterstitial) {
        return isInterstitialPrecache;
    } else if(adType == AppodealAdTypeBanner) {
        return isBannerPrecache;
    } else {
        return false;
    }
}

-(FREObject)setTabletBanners:(uint32_t)argc paramseters:(FREObject [])argv {
    DLog(@"AppodealANE.setTabletBanners");
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

-(FREObject)setTesting:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.setTesting");
    [Appodeal setTestingEnabled:appodeal_freToBool(argv[0])];
    return NULL;
}

-(FREObject)setLogLevel:(uint32_t)argc paramseters:(FREObject [])argv {
    DLog(@"AppodealANE.setLogLevel");
    int logLevel = appodeal_freToInt(argv[0]);
    switch (logLevel) {
        case 0:
            [Appodeal setLogLevel:APDLogLevelOff];
            break;
        case 1:
            [Appodeal setLogLevel:APDLogLevelDebug];
            break;
        case 2:
            [Appodeal setLogLevel:APDLogLevelVerbose];
            break;
        default:
            [Appodeal setLogLevel:APDLogLevelOff];
            break;
    }
    return NULL;
}

-(FREObject)setChildDirectedTreatment:(uint32_t)argc paramseters:(FREObject [])argv {
    DLog(@"AppodealANE.setChildDirectedTreatment");
    [Appodeal setChildDirectedTreatment:appodeal_freToBool(argv[0])];
    return NULL;
}

-(FREObject)disableNetwork:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.disableNetwork");
    [Appodeal disableNetworkForAdType:AppodealAdTypeInterstitial name:appodeal_freToString(argv[0])];
    [Appodeal disableNetworkForAdType:AppodealAdTypeBanner name:appodeal_freToString(argv[0])];
    [Appodeal disableNetworkForAdType:AppodealAdTypeSkippableVideo name:appodeal_freToString(argv[0])];
    [Appodeal disableNetworkForAdType:AppodealAdTypeRewardedVideo name:appodeal_freToString(argv[0])];
    [Appodeal disableNetworkForAdType:AppodealAdTypeNonSkippableVideo name:appodeal_freToString(argv[0])];
    return NULL;
}

-(FREObject)disableNetworkForAdType:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.disableNetworkForAdType");
    [Appodeal disableNetworkForAdType:[self getAdType:appodeal_freToInt(argv[0])] name:appodeal_freToString(argv[1])];
    return NULL;
}

-(FREObject)setTriggerOnLoadedOnPrecache:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.setTriggerOnLoadedOnPrecache");
    return NULL;
}

-(FREObject)disableLocationPermissionCheck:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.disableLocationPermissionCheck");
    [Appodeal setLocationTracking:NO];
    return NULL;
}

-(FREObject)disableWriteExternalStoragePermissionCheck:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.disableWriteExternalStoragePermissionCheck");
    return NULL;
}

-(FREObject)requestMPermissions:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.equestMPermissions");
    return NULL;
}

-(FREObject)muteVideosIfCallsMuted:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.muteVideosIfCallsMuted");
    return NULL;
}

-(FREObject)showTestScreen:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.showTestScreen");
    return NULL;
}

-(FREObject)setFramework:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.setFramework");
    [Appodeal setFramework:APDFrameworkAdobeAir];
    [Appodeal setPluginVersion:appodeal_freToString(argv[1])];
    return NULL;
}

-(FREObject)getVersion:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.getVersion");
    return appodeal_stringToFre([Appodeal getVersion]);
}

-(FREObject)canShow:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.canShow");
    int showStyle = appodeal_freToInt(argv[0]);
    BOOL res = [Appodeal canShowAd:[self getShowType:showStyle] forPlacement:@""];
    return appodeal_boolToFre(res);
}

-(FREObject)canShowPlacement:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.canShowPlacement");
    int showStyle = appodeal_freToInt(argv[0]);
    BOOL res = [Appodeal canShowAd:[self getShowType:showStyle] forPlacement:appodeal_freToString(argv[1])];
    return appodeal_boolToFre(res);
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
    NSDictionary *dict = [NSDictionary dictionaryWithDictionary:tempDictionary];
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

-(FREObject)trackInAppPurchase:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.trackInAppPurchase");
    NSString *currency = appodeal_freToString(argv[1]);
    double amount = appodeal_freToDouble(argv[0]);
    [[APDSdk sharedSdk] trackInAppPurchase:[NSNumber numberWithDouble:amount] currency:currency];
    return NULL;
}

-(FREObject)getRewardedParameters:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.getRewardedParameters");
    NSString *rewardCurrencyName = [[Appodeal rewardForPlacement:@""] currencyName];
    NSUInteger rewardAmount = [[Appodeal rewardForPlacement:@""] amount];
    NSString* info = [NSString stringWithFormat:@"<info amount='%d' currency='%@' />", (int)rewardAmount, rewardCurrencyName];
    return appodeal_stringToFre(info);
}

-(FREObject)getRewardedParametersPlacement:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.getRewardedParametersPlacement");
    NSString *placement = appodeal_freToString(argv[0]);
    NSString *rewardCurrencyName = [[Appodeal rewardForPlacement:placement] currencyName];
    NSUInteger rewardAmount = [[Appodeal rewardForPlacement:placement] amount];
    NSString* info = [NSString stringWithFormat:@"<info amount='%d' currency='%@' />", (int)rewardAmount, rewardCurrencyName];
    return appodeal_stringToFre(info);
}

-(FREObject)getDensity:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.getDensity");
    double density = 1;
    density = [UIScreen mainScreen].scale;
    return appodeal_doubleToFre(density);
}

-(FREObject)getIDFA:(uint32_t)argc paramseters:(FREObject []) argv {
    DLog(@"AppodealANE.getIDFA");
    NSString *idfaString = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    return appodeal_stringToFre(idfaString);
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

-(FREObject)userSettings:(uint32_t)argc paramseters:(FREObject []) argv {
    int code = appodeal_freToInt(argv[0]);
    uint value;

    switch (code) {
        case 1:
            [Appodeal setUserAge:appodeal_freToInt(argv[1])];
            break;
        case 2:
            value = appodeal_freToInt(argv[1]);
            if (value) value = 3-value;
            [Appodeal setUserGender:value];
            break;
        case 3:
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
            [Appodeal setRewardedVideoDelegate:isSet?self:nil];
            break;
        case 3:
            [Appodeal setNonSkippableVideoDelegate:isSet?self:nil];
            break;
        case 4:
            [Appodeal setBannerDelegate:isSet?self:nil];
            break;
    }
    return NULL;
}


- (void)interstitialDidLoadAdisPrecache:(BOOL)precache {
    DLog(@"AppodealANE.interstitialDidLoadAd");
    NSString* info = [NSString stringWithFormat:@"<info precache='%s'/>", precache ? "true" : "false"];
    DISPATCH_STATUS_EVENT(context, "INTERSTITIAL_LOADED", [info UTF8String]);
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
    NSString* info = [NSString stringWithFormat:@"<info precache='%s'/>", precache ? "true" : "false"];
    DISPATCH_STATUS_EVENT(context, "BANNER_LOADED", [info UTF8String]);
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
    isNonSkippableVideoFinished = true;
    DISPATCH_STATUS_EVENT(context, "NON_SKIPPABLE_VIDEO_FINISHED", "");
}
- (void)nonSkippableVideoDidPresent {
    DLog(@"AppodealANE.nonSkippableVideoDidPresent");
    isNonSkippableVideoFinished = false;
    DISPATCH_STATUS_EVENT(context, "NON_SKIPPABLE_VIDEO_SHOWN", "");
}
- (void)nonSkippableVideoWillDismiss {
    DLog(@"AppodealANE.nonSkippableVideoWillDismiss");
    NSString* info = [NSString stringWithFormat:@"<info finished='%s'/>", isNonSkippableVideoFinished ? "true" : "false"];
    DISPATCH_STATUS_EVENT(context, "NON_SKIPPABLE_VIDEO_CLOSED", [info UTF8String]);
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
    isRewardedVideoFinished = false;
    DISPATCH_STATUS_EVENT(context, "REWARDED_VIDEO_SHOWN", "");
}
- (void)rewardedVideoWillDismiss {
    DLog(@"AppodealANE.rewardedVideoWillDismiss");
    NSString* info = [NSString stringWithFormat:@"<info finished='%s'/>", isRewardedVideoFinished ? "true" : "false"];
    DISPATCH_STATUS_EVENT(context, "REWARDED_VIDEO_CLOSED", [info UTF8String]);

}
- (void)rewardedVideoDidClick {
    DLog(@"AppodealANE.rewardedVideoDidClick");
}
- (void)rewardedVideoDidFinish:(NSUInteger)rewardAmount name:(NSString *)rewardName {
    DLog(@"AppodealANE.rewardedVideoDidFinish: %d, %@", (int)rewardAmount, rewardName);
    isRewardedVideoFinished = true;
    NSString* info = [NSString stringWithFormat:@"<info amount='%d' name='%@' />", (int)rewardAmount, rewardName];
    DISPATCH_STATUS_EVENT(context, "REWARDED_VIDEO_FINISHED", [info UTF8String]);
}

@end
