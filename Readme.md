# APIKey - Customer Management System (v5.7.1)

---

<p align="center">
  <font size="5"><b>APIKey Usage Guide</b></font>
</p>

---

## Language / Ngôn ngữ

- [English](#english-version)
- [Tiếng Việt](#vietnamese-version)

---

## English Version {#english-version}

### Project Setup

1. **Install Theos**

   - Download and install Theos on **Linux** or **macOS**: [Theos Dev](https://theos.dev).

2. **Download APIKey**
   - Go to APIKey **Release** section, download the `.zip` file and extract it for configuration.

---

### Server Key & Account Setup

- **Register Account & Create Package:** [APIKey](https://new.ppapikey.xyz)

---

### APIKey Methods

```objective-c
#import <Foundation/Foundation.h>

@interface PPAPIKey : NSObject

// Initialization and processing
- (void)loading:(void (^)(void))execute;
- (void)setPackageToken:(NSString *)token;
- (void)setENLanguage:(BOOL)value;
- (void)setAppVersion:(NSString *)version;

// Key Management
- (void)exitKey;    // Delete Key
- (void)copyKey;    // Copy Key to Clipboard
- (void)showCSAL:(NSString *)title
          message:(NSString *)message
      apiKeyLabel:(NSString *)apiKeyLabel
         doneTime:(NSInteger)doneTime;

// System & App Information
- (NSString *)getKey;
- (NSString *)getKeyExpire;
- (NSString *)getKeyAmount;
- (NSString *)getUDID;
- (NSString *)getDeviceName;
- (NSString *)getiOSVersion;
- (NSString *)getAppVersion;
- (NSString *)getAppName;
- (NSString *)getAppBundle;
- (NSString *)getJailbreakStatus;

@end
```

---

### APIKey Setup Example

```objective-c
PPAPIKey *APIKey = [PPAPIKey sharedInstance];

// Configure parameters
[APIKey setPackageToken:NSSENCRYPT("xxxxx")];
[APIKey setAppVersion:NSSENCRYPT("1.0.0")];
[APIKey setENLanguage:YES];

// Load data or process after completion
[APIKey loading:^{
    // loadMenu();
}];
```

---

### Makefile Configuration for Theos Project

```makefile
$(TWEAK_NAME)_LDFLAGS += libAPIKey.a
```

---

### Author Information

**APIKey** is developed by [Phat Pham](https://t.me/pdp7803).  
Please keep updating to the latest API for long-term support.

---

### Notes

- Ensure your operating system and development tools are always updated to avoid compatibility issues.

---

Copyright © 2024 by [Phat Pham](https://t.me/pdp7803). All rights reserved.

---

## Vietnamese Version {#vietnamese-version}

### Cài Đặt Dự Án

1. **Cài Đặt Theos**

   - Tải và cài đặt Theos trên hệ điều hành **Linux** hoặc **macOS**: [Theos Dev](https://theos.dev).

2. **Tải APIKey**
   - Truy cập mục **Release** của APIKey, tải file `.zip` và giải nén để chuẩn bị cấu hình.

---

### Thiết Lập Server Key & Tài Khoản

- **Đăng Ký Tài Khoản & Tạo Package:** [APIKey](https://new.ppapikey.xyz)

---

### Các Phương Thức APIKey

```objective-c
#import <Foundation/Foundation.h>

@interface PPAPIKey : NSObject

// Khởi tạo và xử lý
- (void)loading:(void (^)(void))execute;
- (void)setPackageToken:(NSString *)token;
- (void)setENLanguage:(BOOL)value;
- (void)setAppVersion:(NSString *)version;

// Quản lý Key
- (void)exitKey;    // Xóa Key
- (void)copyKey;    // Sao chép Key vào Clipboard
- (void)showCSAL:(NSString *)title
          message:(NSString *)message
      apiKeyLabel:(NSString *)apiKeyLabel
         doneTime:(NSInteger)doneTime;

// Thông tin hệ thống & ứng dụng
- (NSString *)getKey;
- (NSString *)getKeyExpire;
- (NSString *)getKeyAmount;
- (NSString *)getUDID;
- (NSString *)getDeviceName;
- (NSString *)getiOSVersion;
- (NSString *)getAppVersion;
- (NSString *)getAppName;
- (NSString *)getAppBundle;
- (NSString *)getJailbreakStatus;

@end
```

---

### Ví Dụ Cài Đặt APIKey

```objective-c
PPAPIKey *APIKey = [PPAPIKey sharedInstance];

// Thiết lập các tham số cấu hình
[APIKey setPackageToken:NSSENCRYPT("xxxxx")];
[APIKey setAppVersion:NSSENCRYPT("1.0.0")];
[APIKey setENLanguage:YES];

// Tải dữ liệu hoặc xử lý sau khi hoàn tất
[APIKey loading:^{
    // loadMenu();
}];
```

---

### Cấu Hình Makefile Cho Dự Án Theos

```makefile
$(TWEAK_NAME)_LDFLAGS += libAPIKey.a
```

---

### Thông Tin Tác Giả

**APIKey** được phát triển bởi [Phát Phạm](https://t.me/pdp7803).  
Vui lòng liên tục cập nhật API mới nhất để được hỗ trợ lâu dài.

---

### Ghi Chú

- Đảm bảo hệ điều hành và các công cụ phát triển của bạn luôn được cập nhật để tránh các vấn đề tương thích.

---

Bản quyền © 2024 bởi [Phát Phạm](https://t.me/pdp7803). All rights reserved.
