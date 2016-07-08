/*
 * Appodeal.m
 * Appodeal
 *
 * Created by Serious Sam on 26.11.15.
 * Copyright (c) 2015 __MyCompanyName__. All rights reserved.
 */

#import "AppodealANE.h"

////////////////////////////////////
/// utils for native sdk types /////
////////////////////////////////////

const int INTERSTITIAL  = 1;
const int VIDEO         = 2;
const int BANNER        = 4;
const int BANNER_BOTTOM = 8;
const int BANNER_TOP    = 16;
const int BANNER_CENTER = 32;
const int REWARDED_VIDEO = 128;
const int ALL           = 1023;

int nativeAdTypesForType(int adTypes)
{
    if ((adTypes & ALL) > 0) {
        return AppodealAdTypeAll;
    }
    
    int nativeAdTypes = 0;
    
    if ((adTypes & INTERSTITIAL) > 0) {
        nativeAdTypes |= AppodealAdTypeInterstitial;
    }
    
    if ((adTypes & VIDEO) > 0) {
        nativeAdTypes |= AppodealAdTypeSkippableVideo;
    }
    
    if ((adTypes & REWARDED_VIDEO) > 0) {
        nativeAdTypes |= AppodealAdTypeRewardedVideo;
    }
    
    if ((adTypes & BANNER) > 0 ||
        (adTypes & BANNER_TOP) > 0 ||
        (adTypes & BANNER_CENTER) > 0 ||
        (adTypes & BANNER_BOTTOM) > 0) {
        
        nativeAdTypes |= AppodealAdTypeBanner;
    }
    
    return nativeAdTypes;
}

int nativeShowStyleForType(int adTypes)
{
    bool isInterstitial = (adTypes & INTERSTITIAL) > 0;
    bool isVideo = (adTypes & VIDEO) > 0;
    
    if (isInterstitial && isVideo) {
        return AppodealShowStyleVideoOrInterstitial;
    } else if (isVideo) {
        return AppodealShowStyleSkippableVideo;
    } else if (isInterstitial) {
        return AppodealShowStyleInterstitial;
    }
    
    if ((adTypes & REWARDED_VIDEO) > 0) {
        return AppodealShowStyleRewardedVideo;
    }
    
    if ((adTypes & BANNER_TOP) > 0) {
        return AppodealShowStyleBannerTop;
    }
    
    if ((adTypes & BANNER_CENTER) > 0) {
        return AppodealShowStyleBannerCenter;
    }
    
    if ((adTypes & BANNER_BOTTOM) > 0) {
        return AppodealShowStyleBannerBottom;
    }
    
    return 0;
}

////////////////////////////////////
/// initialization /////////////////
////////////////////////////////////

//static FREContext appodealFREContext;
//UIViewController* rootController;

void AppodealExtensionContextInitializer(
                                         void* extData,
                                         const uint8_t* ctxType,
                                         FREContext ctx,
                                         uint32_t* numFunctionsToSet,
                                         const FRENamedFunction** functionsToSet)
{
    DLog(@"AppodealANE.AppodealExtensionContextInitializer");
    //
    appodealAne = [[AppodealANE alloc] init];
    [appodealAne initContext:ctx];
    //
    static FRENamedFunction functions[] = {
        MAP_FUNCTION(appodeal_initialize, NULL, appodeal_initialize),
        MAP_FUNCTION(appodeal_show, NULL, appodeal_show),
        MAP_FUNCTION(appodeal_hide, NULL, appodeal_hide),
        MAP_FUNCTION(appodeal_cache, NULL, appodeal_cache),
        MAP_FUNCTION(appodeal_setAutoCache, NULL, appodeal_setAutoCache),
        MAP_FUNCTION(appodeal_setTesting, NULL, appodeal_setTesting),
        MAP_FUNCTION(appodeal_getVersion, NULL, appodeal_getVersion),
        MAP_FUNCTION(appodeal_getIDFA, NULL, appodeal_getIDFA),
        MAP_FUNCTION(appodeal_getDensity, NULL, appodeal_getDensity),
        MAP_FUNCTION(appodeal_disableNetworkForAdType, NULL, appodeal_disableNetworkForAdType),
        MAP_FUNCTION(appodeal_disableLocationPermissionCheck, NULL, appodeal_disableLocationPermissionCheck),
        MAP_FUNCTION(appodeal_isLoaded, NULL, appodeal_isLoaded),
        MAP_FUNCTION(appodeal_userSettings, NULL, appodeal_userSettings),
        MAP_FUNCTION(appodeal_callbacks, NULL, appodeal_callbacks),
    };
    
    *numFunctionsToSet = sizeof( functions ) / sizeof( FRENamedFunction );
    *functionsToSet = functions;
}

void AppodealExtensionContextFinalizer(FREContext ctx)
{
    DLog(@"AppodealANE.AppodealExtensionContextFinalizer");
    return;
}

void AppodealExtensionInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet)
{
    DLog(@"AppodealANE.AppodealExtensionInitializer");
    
    *extDataToSet = NULL;
    *ctxInitializerToSet = &AppodealExtensionContextInitializer;
    *ctxFinalizerToSet = &AppodealExtensionContextFinalizer;
}

void AppodealExtensionFinalizer(void * extData)
{
    DLog(@"AppodealANE.AppodealExtensionFinalizer");
    return;
}



DEFINE_ANE_FUNCTION(appodeal_initialize)  {return [appodealAne initialize:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_show)  {return [appodealAne show:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_hide) {return [appodealAne hide:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_cache) {return [appodealAne cache:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_setAutoCache) {return [appodealAne setAutoCache:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_setTesting) {return [appodealAne setTesting:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_getVersion) {return [appodealAne getVersion:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_getIDFA) {return [appodealAne getIDFA:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_getDensity) {return [appodealAne getDensity:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_disableNetworkForAdType) {return [appodealAne disableNetworkForAdType:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_disableLocationPermissionCheck) {return [appodealAne disableLocationPermissionCheck:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_isLoaded) {return [appodealAne isLoaded:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_userSettings) {return [appodealAne userSettings:argc paramseters:argv];}
DEFINE_ANE_FUNCTION(appodeal_callbacks) {return [appodealAne callbacks:argc paramseters:argv];}


@implementation AppodealANE
@synthesize context, rootController;

////////////////////////////////////
/// utils for native sdk types /////
////////////////////////////////////

////////////////////////////////////
/// implementation /////////////////
////////////////////////////////////

-(void) initContext:(FREContext)ctx
{
    context = ctx;
    //
    NSArray* windows = [[UIApplication sharedApplication] windows];
    UIWindow* window = [windows objectAtIndex:0];
    rootController = [window rootViewController];
}


-(FREObject)initialize:(uint32_t)argc paramseters:(FREObject []) argv
{
    DLog(@"AppodealANE.initializeAdTypes");
    NSString* key = appodeal_freToString(argv[0]);
    int type = appodeal_freToInt(argv[1]);
    type = nativeAdTypesForType(type);
    [Appodeal initializeWithApiKey:key
                             types:type];
    //
    /*
    [Appodeal setInterstitialDelegate:self];
    [Appodeal setBannerDelegate:self];
    [Appodeal setVideoDelegate:self];
    [Appodeal setRewardedVideoDelegate:self];
     */
    //
    return NULL;
}
-(FREObject)show:(uint32_t)argc paramseters:(FREObject []) argv
{
    DLog(@"AppodealANE.show");
    int showStyle = appodeal_freToInt(argv[0]);
    showStyle = nativeShowStyleForType(showStyle);
    //
    BOOL res = [Appodeal showAd:showStyle
             rootViewController:rootController];
    return appodeal_boolToFre(res);
}
-(FREObject)hide:(uint32_t)argc paramseters:(FREObject []) argv
{
    DLog(@"AppodealANE.hideBanner");
    [Appodeal hideBanner];
    return NULL;
}
-(FREObject)cache:(uint32_t)argc paramseters:(FREObject []) argv
{
    DLog(@"AppodealANE.cacheBanner");
    int type = appodeal_freToInt(argv[0]);
    type = nativeAdTypesForType(type);
    [Appodeal cacheAd:type];
    return NULL;
}
-(FREObject)setAutoCache:(uint32_t)argc paramseters:(FREObject []) argv
{
    int type = appodeal_freToInt(argv[0]);
    type = nativeAdTypesForType(type);
    //
    [Appodeal setAutocache:appodeal_freToBool(argv[1]) types:type];
    return nil;
}
-(FREObject)setTesting:(uint32_t)argc paramseters:(FREObject []) argv
{
    DLog(@"AppodealANE.setTesting");
    [Appodeal setDebugEnabled:appodeal_freToBool(argv[0])];
    return NULL;
}
-(FREObject)getVersion:(uint32_t)argc paramseters:(FREObject []) argv
{
    DLog(@"AppodealANE.getVersion");
    return appodeal_stringToFre([Appodeal getVersion]);
}
-(FREObject)getIDFA:(uint32_t)argc paramseters:(FREObject []) argv
{
    DLog(@"AppodealANE.getIDFA");
    return appodeal_stringToFre(appodeal_getIDFAValue());
}
-(FREObject)getDensity:(uint32_t)argc paramseters:(FREObject []) argv
{
    DLog(@"AppodealANE.getDensity");
    return appodeal_doubleToFre(appodeal_getDensityValue());
}
-(FREObject)disableNetworkForAdType:(uint32_t)argc paramseters:(FREObject []) argv
{
    DLog(@"AppodealANE.disableNetwork");
    [Appodeal disableNetworkForAdType:appodeal_freToInt(argv[0]) name:appodeal_freToString(argv[1])];
    return NULL;
}
-(FREObject)disableLocationPermissionCheck:(uint32_t)argc paramseters:(FREObject []) argv
{
    DLog(@"AppodealANE.disableLocationPermissionCheck");
    [Appodeal disableLocationPermissionCheck];
    return NULL;
}
-(FREObject)isLoaded:(uint32_t)argc paramseters:(FREObject []) argv
{
    DLog(@"AppodealANE.isReadyForShowWithStyle");
    int showStyle = appodeal_freToInt(argv[0]);
    showStyle = nativeShowStyleForType(showStyle);
    return appodeal_boolToFre([Appodeal isReadyForShowWithStyle:showStyle]);
}
-(FREObject)userSettings:(uint32_t)argc paramseters:(FREObject []) argv
{
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
            [Appodeal setUserFacebookId:appodeal_freToString(argv[1])];
            break;
        case 5:
            [Appodeal setUserVkId:appodeal_freToString(argv[1])];
            break;
        case 6:
            [Appodeal setUserInterests:appodeal_freToString(argv[1])];
            break;
        case 7:
            value = appodeal_freToInt(argv[1]);
            if (value) value = 3-value;
            [Appodeal setUserGender:value];
            break;
        case 8:
            [Appodeal setUserOccupation:appodeal_freToInt(argv[1])];
            break;
        case 9:
            [Appodeal setUserRelationship:appodeal_freToInt(argv[1])];
            break;
        case 10:
            [Appodeal setUserSmokingAttitude:appodeal_freToInt(argv[1])];
            break;
        case 11:
            [Appodeal setUserAlcoholAttitude:appodeal_freToInt(argv[1])];
            break;
    }
    return nil;
}

-(FREObject)callbacks:(uint32_t)argc paramseters:(FREObject []) argv
{
    bool isSet = appodeal_freToBool(argv[0]);
    int code = appodeal_freToInt(argv[1]);
    DLog(@"callbacks: %d, %d", code, isSet);
    switch (code) {
        case 1:
            if (isSet) {
                DLog(@"111111111");
                [Appodeal setInterstitialDelegate:self];
            } else {
                DLog(@"222222222");
                [Appodeal setInterstitialDelegate:nil];
            }
            break;
        case 2:
            [Appodeal setVideoDelegate:isSet?self:nil];
            break;
        case 3:
            [Appodeal setRewardedVideoDelegate:isSet?self:nil];
            break;
        case 4:
            [Appodeal setBannerDelegate:isSet?self:nil];
            break;
    }
    return nil;
}


- (void)interstitialDidLoadAd
{
    DLog(@"AppodealANE.interstitialDidLoadAd");
    DISPATCH_STATUS_EVENT(context, "INTERSTITIAL_LOADED", "");
}
- (void)interstitialDidFailToLoadAd
{
    DLog(@"AppodealANE.interstitialDidFailToLoadAd");
    DISPATCH_STATUS_EVENT(context, "INTERSTITIAL_FAILED_TO_LOAD", "");
}
- (void)interstitialWillPresent
{
    DLog(@"AppodealANE.interstitialWillPresent");
    DISPATCH_STATUS_EVENT(context, "INTERSTITIAL_SHOWN", "");
}
- (void)interstitialDidDismiss
{
    DLog(@"AppodealANE.interstitialDidDismiss");
    DISPATCH_STATUS_EVENT(context, "INTERSTITIAL_CLOSED", "");
}
- (void)interstitialDidClick
{
    DLog(@"AppodealANE.interstitialDidClick");
    DISPATCH_STATUS_EVENT(context, "INTERSTITIAL_CLICKED", "");
}


- (void)bannerDidLoadAd
{
   DLog(@"AppodealANE.bannerDidLoadAd");
   DISPATCH_STATUS_EVENT(context, "BANNER_LOADED", "");
}
- (void)bannerDidFailToLoadAd
{
    DLog(@"AppodealANE.bannerDidFailToLoadAd");
    DISPATCH_STATUS_EVENT(context, "BANNER_FAILED_TO_LOAD", "");
}
- (void)bannerDidClick
{
    DLog(@"AppodealANE.bannerDidClick");
    DISPATCH_STATUS_EVENT(context, "BANNER_CLICKED", "");
}


- (void)videoDidLoadAd
{
    DLog(@"AppodealANE.videoDidLoadAd");
    DISPATCH_STATUS_EVENT(context, "SKIPPABLE_VIDEO_LOADED", "");
}
- (void)videoDidFailToLoadAd
{
    DLog(@"AppodealANE.videoDidFailToLoadAd");
    DISPATCH_STATUS_EVENT(context, "SKIPPABLE_VIDEO_FAILED_TO_LOAD", "");
}
- (void)videoDidPresent
{
    DLog(@"AppodealANE.videoDidPresent");
    DISPATCH_STATUS_EVENT(context, "SKIPPABLE_VIDEO_SHOWN", "");
}
- (void)videoWillDismiss
{
    DLog(@"AppodealANE.videoWillDismiss");
    DISPATCH_STATUS_EVENT(context, "SKIPPABLE_VIDEO_CLOSED", "");
}
- (void)videoDidFinish
{
    DLog(@"AppodealANE.videoDidFinish");
    DISPATCH_STATUS_EVENT(context, "SKIPPABLE_VIDEO_FINISHED", "");
}


- (void)rewardedVideoDidLoadAd
{
    DLog(@"AppodealANE.rewardedVideoDidLoadAd");
    DISPATCH_STATUS_EVENT(context, "REWARDED_VIDEO_LOADED", "");
    DISPATCH_STATUS_EVENT(context, "NON_SKIPPABLE_VIDEO_LOADED", "");
}
- (void)rewardedVideoDidFailToLoadAd
{
    DLog(@"AppodealANE.rewardedVideoDidFailToLoadAd");
    DISPATCH_STATUS_EVENT(context, "REWARDED_VIDEO_FAILED_TO_LOAD", "");
    DISPATCH_STATUS_EVENT(context, "NON_SKIPPABLE_VIDEO_FAILED_TO_LOAD", "");
}
- (void)rewardedVideoDidPresent
{
    DLog(@"AppodealANE.rewardedVideoDidPresent");
    DISPATCH_STATUS_EVENT(context, "REWARDED_VIDEO_SHOWN", "");
    DISPATCH_STATUS_EVENT(context, "NON_SKIPPABLE_VIDEO_SHOWN", "");
}
- (void)rewardedVideoWillDismiss
{
    DLog(@"AppodealANE.rewardedVideoWillDismiss");
    DISPATCH_STATUS_EVENT(context, "REWARDED_VIDEO_CLOSED", "");
    DISPATCH_STATUS_EVENT(context, "NON_SKIPPABLE_VIDEO_CLOSED", "");
}
- (void)rewardedVideoDidFinish:(NSUInteger)rewardAmount name:(NSString *)rewardName
{
    DLog(@"AppodealANE.rewardedVideoDidFinish: %d, %@", (int)rewardAmount, rewardName);
    NSString* info = [NSString stringWithFormat:@"<info amount='%d' name='%@' />", (int)rewardAmount, rewardName];
    DISPATCH_STATUS_EVENT(context, "REWARDED_VIDEO_FINISHED", [info UTF8String]);
    DISPATCH_STATUS_EVENT(context, "NON_SKIPPABLE_VIDEO_FINISHED", "");
}


@end

