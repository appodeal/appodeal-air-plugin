/*  
 * Appodeal
 *
 * Created by Serious Sam on 26.11.15.
 * Copyright (c) 2015 __MyCompanyName__. All rights reserved.
*/

#import <Foundation/Foundation.h>
#import "FlashRuntimeExtensions.h"
#import <UIKit/UIKit.h>
#import "freUtils.h"
#import <Appodeal/Appodeal.h>
#import "GoogleMobileAds/GoogleMobileAds.h"
#import "UnityAds/UnityAds.h"
#import "VungleSDK/VungleSDK.h"
#define DEFINE_ANE_FUNCTION(fn) FREObject (fn)(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
#define DISPATCH_STATUS_EVENT(extensionContext, code, status) FREDispatchStatusEventAsync((extensionContext), (uint8_t*)code, (uint8_t*)status)

#define MAP_FUNCTION(fnVisibleName, data, fnActualName) { (const uint8_t*)(#fnVisibleName), (data), &(fnActualName) }

#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif

int nativeAdTypesForType(int adTypes);
int nativeShowStyleForType(int adTypes);

void AppodealExtensionContextInitializer( void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToSet, const FRENamedFunction** functionsToSet);
void AppodealExtensionContextFinalizer(FREContext ctx);
void AppodealExtensionInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet);
void AppodealExtensionFinalizer(void * extData);

DEFINE_ANE_FUNCTION(appodeal_initialize);
DEFINE_ANE_FUNCTION(appodeal_show);
DEFINE_ANE_FUNCTION(appodeal_showWithPlacement);
DEFINE_ANE_FUNCTION(appodeal_hide);
DEFINE_ANE_FUNCTION(appodeal_cache);
DEFINE_ANE_FUNCTION(appodeal_setAutoCache);
DEFINE_ANE_FUNCTION(appodeal_setTesting);
DEFINE_ANE_FUNCTION(appodeal_getVersion);
DEFINE_ANE_FUNCTION(appodeal_getIDFA);
DEFINE_ANE_FUNCTION(appodeal_getDensity);
DEFINE_ANE_FUNCTION(appodeal_disableNetworkForAdType);
DEFINE_ANE_FUNCTION(appodeal_disableLocationPermissionCheck);
DEFINE_ANE_FUNCTION(appodeal_isLoaded);
DEFINE_ANE_FUNCTION(appodeal_userSettings);
DEFINE_ANE_FUNCTION(appodeal_callbacks);


@interface AppodealANE : NSObject <AppodealInterstitialDelegate, AppodealBannerDelegate, AppodealSkippableVideoDelegate, AppodealRewardedVideoDelegate>

@property (nonatomic) FREObject context;
@property (nonatomic, strong) UIViewController* rootController;

-(void)initContext:(FREContext)context;

-(FREObject)initialize:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)show:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)showWithPlacement:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)hide:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)cache:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)setAutoCache:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)setTesting:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)getVersion:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)getIDFA:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)getDensity:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)disableNetworkForAdType:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)disableLocationPermissionCheck:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)isLoaded:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)userSettings:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)callbacks:(uint32_t)argc paramseters:(FREObject []) argv;
@end

AppodealANE* appodealAne;