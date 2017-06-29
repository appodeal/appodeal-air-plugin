#import <Foundation/Foundation.h>
#import <AdSupport/ASIdentifierManager.h>
#import "FlashRuntimeExtensions.h"
#import <UIKit/UIKit.h>
#import "freUtils.h"
#import <Appodeal/Appodeal.h>
#define DEFINE_ANE_FUNCTION(fn) FREObject (fn)(FREContext context, void* functionData, uint32_t argc, FREObject argv[])
#define DISPATCH_STATUS_EVENT(extensionContext, code, status) FREDispatchStatusEventAsync((extensionContext), (uint8_t*)code, (uint8_t*)status)

#define MAP_FUNCTION(fnVisibleName, data, fnActualName) { (const uint8_t*)(#fnVisibleName), (data), &(fnActualName) }

#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif

void AppodealExtensionContextInitializer( void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToSet, const FRENamedFunction** functionsToSet);
void AppodealExtensionContextFinalizer(FREContext ctx);
void AppodealExtensionInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet);
void AppodealExtensionFinalizer(void * extData);

DEFINE_ANE_FUNCTION(appodeal_initialize);
DEFINE_ANE_FUNCTION(appodeal_show);
DEFINE_ANE_FUNCTION(appodeal_showPlacement);
DEFINE_ANE_FUNCTION(appodeal_canShow);
DEFINE_ANE_FUNCTION(appodeal_hide);
DEFINE_ANE_FUNCTION(appodeal_cache);
DEFINE_ANE_FUNCTION(appodeal_setAutoCache);
DEFINE_ANE_FUNCTION(appodeal_setTesting);
DEFINE_ANE_FUNCTION(appodeal_setLogging);
DEFINE_ANE_FUNCTION(appodeal_getVersion);
DEFINE_ANE_FUNCTION(appodeal_logDebug);
DEFINE_ANE_FUNCTION(appodeal_toastMessage);
DEFINE_ANE_FUNCTION(appodeal_disableNetwork);
DEFINE_ANE_FUNCTION(appodeal_disableNetworkForAdType);
DEFINE_ANE_FUNCTION(appodeal_disableLocationPermissionCheck);
DEFINE_ANE_FUNCTION(appodeal_isLoaded);
DEFINE_ANE_FUNCTION(appodeal_setBannerAnimation);
DEFINE_ANE_FUNCTION(appodeal_setBannerBackground);
DEFINE_ANE_FUNCTION(appodeal_setSmartBanners);
DEFINE_ANE_FUNCTION(appodeal_setCustomBooleanRule);
DEFINE_ANE_FUNCTION(appodeal_setCustomIntegerRule);
DEFINE_ANE_FUNCTION(appodeal_setCustomDoubleRule);
DEFINE_ANE_FUNCTION(appodeal_setCustomStringRule);
DEFINE_ANE_FUNCTION(appodeal_getIDFA);
DEFINE_ANE_FUNCTION(appodeal_getDensity);
DEFINE_ANE_FUNCTION(appodeal_userSettings);
DEFINE_ANE_FUNCTION(appodeal_callbacks);

@interface AppodealANE : NSObject <AppodealInterstitialDelegate, AppodealBannerDelegate, AppodealRewardedVideoDelegate, AppodealNonSkippableVideoDelegate>

@property (nonatomic) FREObject context;
@property (nonatomic, strong) UIViewController* rootController;

-(void)initContext:(FREContext)context;

-(int) getAdType:(int)adType;
-(int) getShowType:(int)adType;

-(FREObject)initialize:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)show:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)showPlacement:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)canShow:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)hide:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)cache:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)setAutoCache:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)setTesting:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)setLogging:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)getVersion:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)logDebug:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)toastMessage:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)setBannerAnimation:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)setBannerBackground:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)setSmartBanners:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)setCustomBooleanRule:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)setCustomIntegerRule:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)setCustomDoubleRule:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)setCustomStringRule:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)getIDFA:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)getDensity:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)disableNetwork:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)disableNetworkForAdType:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)disableLocationPermissionCheck:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)isLoaded:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)userSettings:(uint32_t)argc paramseters:(FREObject []) argv;
-(FREObject)callbacks:(uint32_t)argc paramseters:(FREObject []) argv;
@end

AppodealANE* appodealAne;
