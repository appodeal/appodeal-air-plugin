#import "freUtils.h"
#import <UIKit/UIKit.h>

FREObject appodeal_boolToFre(bool value) {
    FREObject fo;
    if (value) {
        FRENewObjectFromBool(1, &fo);
    } else {
        FRENewObjectFromBool(0, &fo);
    }
    return fo;
}

BOOL appodeal_freToBool(FREObject object) {
    uint32_t boolean;
    FREGetObjectAsBool(object, &boolean);
    return boolean;
}

int appodeal_freToInt(FREObject object) {
    int32_t indexObject;
    FREGetObjectAsInt32(object, &indexObject);
    return (int)indexObject;
}

FREObject appodeal_intToFre(int value) {
    FREObject object;
    FRENewObjectFromInt32(value, &object);
    return object;
}

uint appodeal_freToUint(FREObject object) {
    uint32_t indexObject;
    FREGetObjectAsUint32(object, &indexObject);
    return (uint)indexObject;
}

FREObject appodeal_uintToFre(uint value) {
    FREObject object;
    FRENewObjectFromUint32(value, &object);
    return object;
}

FREObject appodeal_doubleToFre(double value) {
    FREObject object;
    FRENewObjectFromDouble(value, &object);
    return object;
}

double appodeal_freToDouble(FREObject object) {
    double value;
    FREGetObjectAsDouble(object, &value);
    return value;
}

FREObject appodeal_stringToFre(NSString *source) {
    FREObject fo;
    FRENewObjectFromUTF8((uint32_t)[source length], (uint8_t *)[source UTF8String], &fo);
    return fo;
}

NSString* appodeal_freToString(FREObject object) {
    if (object == nil) return nil;
    NSString* res;
    uint32_t length;
    const uint8_t *text;
    FREGetObjectAsUTF8(object, &length, &text);
    res = [NSString stringWithUTF8String:(char*)text];
    return res;
}
