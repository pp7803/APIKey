#import "pp.h"
#define timer(sec) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, sec * NSEC_PER_SEC), dispatch_get_main_queue(), ^
NSString *token;
BOOL isContact;
NSString *urlContact;
static void didFinishLaunching(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef info) {
    token = NSSENCRYPT("1430dac71af2b4f7c67b23895e149aa7242597b0");
    urlContact = NSSENCRYPT("https:fb.com/pp.7803");//Liên kết MXH
    isContact = NO;  //đặt là NO/YES nếu bạn không muốn/muốn hiện nút contact
}
%ctor {
  CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), NULL, &didFinishLaunching, (CFStringRef)UIApplicationDidFinishLaunchingNotification, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}