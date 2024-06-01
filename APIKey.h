//
//  APIKey.h
//
//  Created by PhatPham on 2024/5/19.
//
#import <Foundation/Foundation.h>
@interface PPAPIKey : NSObject

- (void)loading:(void (^)(void))execute;
- (void)setPackageToken:(NSString*) token;
- (void)setOKText:(NSString *) oktext;
- (void)setContactText:(NSString *) contacttext;
- (void)setENLanguage:(BOOL) value;
- (void)isOnTapGes:(BOOL) value;
- (NSString*) tb64:(NSString *) text;//decrypt base64
- (NSString*) getKey;
- (NSString*) getTimeKey;
- (NSString*) getUDID;
- (NSString*) getDeviceName;
- (NSString*) getiOSVersion;

@end