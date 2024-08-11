# APIKey - Quản Lí Khách Hàng - v5.4
<p align="center">
  <font size="4">
    <b>Cách Dùng</b>
  </font>
</p>
<div style="background-color: #000; color: #ffffff;">
<pre>

## Cài đặt dự án
- Cài đặt Theos trên máy Linux/Mac của bạn [Theos Dev](https://theos.dev).
- Tải về Folder .zip của APIKey tại mục Release và giải nén
## Server Key và Tài Khoản
- Đăng kí tài khoản, tạo package tại [APIKey](https://v3.ppapikey.xyz)
- Link Cài đặt cấu hình Ứng dụng Server [APIKey](https://raw.githubusercontent.com/pp7803/APIKey/main/AppConfig/ppapikey.mobileconfig)
## Các Phương Thức
```Objective-C
- (void) loading:(void (^)(void))execute;
- (void) setPackageToken:(NSString*) token;
- (void) setOKText:(NSString *) oktext;
- (void) setContactText:(NSString *) contacttext;
- (void) setENLanguage:(BOOL) value;
- (void) setSCLTheme:(BOOL) value; //Set YES to use SCLAlert Theme
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
```
## Ví dụ cách thiết lập
```Objective-C
    PPAPIKey *APIKey = [[PPAPIKey alloc] init];
    [APIKey setPackageToken:NSSENCRYPT("")]; 
    [APIKey setOKText:NSSENCRYPT("OK")];
    [APIKey setContactText:NSSENCRYPT("Liên Hệ")];
    [APIKey setENLanguage:NO];
    [APIKey setSCLTheme:YES];
    [APIKey loading:^{
        //loadmenu()
    }];
```
## Makefile của dự án Theos của bạn
```Objective-C
    $(TWEAK_NAME)_LDFLAGS+= libAPIKey.a
```
## Một Số Hình Ảnh Minh Hoạ


## Tác Giả APIKey
Copyright By [Phát Phạm](https://t.me/pdp7803).

<p align="center">
  <img src="ex1.PNG" alt="My Logo" width="200"/>
  <img src="ex2.PNG" alt="My Logo" width="200"/>
</p>
<p align="center">
  <em>Hình 1: Mô tả hình ảnh minh hoạ 1</em>
  <em>Hình 2: Mô tả hình ảnh minh hoạ 2</em>
</p>
<p align="center">
  <img src="ex3.PNG" alt="My Logo" width="200"/>
  <img src="ex4.PNG" alt="My Logo" width="200"/>
</p>
<p align="center">
  <img src="ex5.PNG" alt="My Logo" width="200"/>
</p>
