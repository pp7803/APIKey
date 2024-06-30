//
//  APIKey.h
//
//  Created by PhatPham on 2024/6/26.
//
#import <Foundation/Foundation.h>
@interface PPAPIKey : NSObject

- (void) loading:(void (^)(void))execute;
- (void) setPackageToken:(NSString*) token;
- (void) setOKText:(NSString *) oktext;
- (void) setContactText:(NSString *) contacttext;
- (void) setENLanguage:(BOOL) value;
- (void) exitKey;      //Call this function to Clear key
- (void) showBundle;   //Call this function to Show App Bundle id
- (void) copyKey;      //Call this function to Copy key to clipboard

- (NSString*) tb64:(NSString *) text;//decrypt base64
- (NSString*) getKey;
- (NSString*) getTimeKey;
- (NSString*) getUDID;
- (NSString*) getDeviceName;
- (NSString*) getiOSVersion;
- (NSString*) getAppVersion;
- (NSString*) getAppBundle;
- (NSString*) checkJailbreak;

@end
