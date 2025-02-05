# APIKey - Customer Management (v5.5.2)

<p align="center">
  <font size="5">
    <b>Comprehensive User Guide</b>
  </font>
</p>

---

## 🚀 **Project Setup**

### Prerequisites
- Install **Theos** on your Linux/Mac system: [Theos Development](https://theos.dev).
- Download the latest `.zip` release of **APIKey** from the [Releases](https://new.ppapikey.xyz) section and extract it.

---

## 🔐 **Server Key & Account Configuration**

1. **Register an Account:** Create your account and set up your package at [APIKey Registration Portal](https://new.ppapikey.xyz).
2. **Application Configuration:** Install the app configuration for the server via this link:
   [APIKey Mobile Config](https://raw.githubusercontent.com/pp7803/APIKey/main/AppConfig/ppapikey.mobileconfig).

---

## 📲 **Available Methods**

```objective-c
#import <Foundation/Foundation.h>

@interface PPAPIKey : NSObject

- (void)loading:(void (^)(void))execute;
- (void)setPackageToken:(NSString*)token;
- (void)setOKText:(NSString *)oktext;
- (void)setContactText:(NSString *)contacttext;
- (void)setENLanguage:(BOOL)value;
- (void)setAppVersion:(NSString *)version;
- (void)exitKey;       // Clears the current key
- (void)copyKey;       // Copies the key to the clipboard
- (void)showCSAL:(NSString *)title message:(NSString *)message apiKeyLabel:(NSString *)apiKeyLabel doneTime:(NSInteger)doneTime;

// Key Information Retrieval
- (NSString*)getKey;
- (NSString*)getKeyExpire;
- (NSString*)getKeyAmount;
- (NSString*)getUDID;
- (NSString*)getDeviceName;
- (NSString*)getiOSVersion;
- (NSString*)getAppVersion;
- (NSString*)getAppName;
- (NSString*)getAppBundle;
- (NSString*)getJailbreakStatus;
@end
```

---

## 📝 **Implementation Example**

```objective-c
PPAPIKey *APIKey = [[PPAPIKey alloc] init];

[APIKey setPackageToken:NSSENCRYPT("")];
[APIKey setOKText:NSSENCRYPT("OK")];
[APIKey setContactText:NSSENCRYPT("Liên Hệ")];
[APIKey setAppVersion:NSSENCRYPT("1.0.0")];
[APIKey setENLanguage:YES];

[APIKey loading:^{
    // Your load menu logic here
}];
```

---

## ⚙️ **Project Makefile Configuration (Theos)**

Ensure you link the APIKey library in your Theos tweak:

```makefile
$(TWEAK_NAME)_LDFLAGS += libAPIKey.a
```

---

## 👨‍💻 **Author**

Developed with 💙 by [Phát Phạm](https://t.me/ppnohope).

> For support and inquiries, feel free to reach out via the provided contact links.

