#import <Foundation/Foundation.h>
#import "FlashRuntimeExtensions.h"

FREObject appodeal_boolToFre(bool value);
BOOL appodeal_freToBool(FREObject object);

int appodeal_freToInt(FREObject object);
FREObject appodeal_intToFre(int value);

uint appodeal_freToUint(FREObject object);
FREObject appodeal_uintToFre(uint value);

FREObject appodeal_doubleToFre(double value);
double appodeal_freToDouble(FREObject object);


FREObject appodeal_stringToFre(NSString *source);
NSString* appodeal_freToString(FREObject object);
