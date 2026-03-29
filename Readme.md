<div align="center">

# APIKey - Customer Management System

### Professional License Management & Authentication Framework

[![Version](https://img.shields.io/badge/version-5.7.4-blue.svg)](https://github.com/yourusername/APIKey)
[![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg)](https://www.apple.com/ios)
[![License](https://img.shields.io/badge/license-Proprietary-red.svg)](LICENSE)
[![Theos](https://img.shields.io/badge/built%20with-Theos-orange.svg)](https://theos.dev)

[English](#english-version) • [Tiếng Việt](#vietnamese-version)

</div>

---

## <a name="english-version"></a>English Version

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Configuration](#configuration)
- [API Reference](#api-reference)
- [Usage Examples](#usage-examples)
- [Support](#support)

---

## Overview

APIKey is a robust customer management and license authentication system designed for iOS jailbreak tweaks and applications. It provides secure key validation, device fingerprinting, and comprehensive user management capabilities.

### Key Benefits

- **Secure Authentication** - Industry-standard encryption and validation
- **Device Tracking** - UDID-based device identification
- **Easy Integration** - Simple API with minimal setup
- **Multi-language** - Built-in English and Vietnamese support
- **Real-time Validation** - Server-side key verification

---

## Features

- **License Key Management** - Create, validate, and revoke access keys
- **Device Information** - Retrieve detailed device and app information
- **Expiration Control** - Time-based license management
- **Clipboard Integration** - Easy key copying functionality
- **Jailbreak Detection** - Built-in security checks
- **WebSocket Support** - Real-time communication capabilities

---

## Requirements

| Component        | Version        |
| ---------------- | -------------- |
| **Platform**     | iOS 10.0+      |
| **Build System** | Theos          |
| **OS**           | macOS or Linux |
| **Language**     | Objective-C    |

---

## Installation

### 1. Install Theos

Follow the official Theos installation guide for your platform:

```bash
# macOS
brew install theos

# Or visit: https://theos.dev/docs/installation
```

### 2. Download APIKey

Download the latest release from the [Release section](https://github.com/pp7803/APIKey/releases):

```bash
# Download this resources
APIKey.h
libPPAPIKey.a
```

### 3. Account Registration

Create your developer account and obtain your package token:

🔗 **[Register at APIKey Portal](https://new.ppapikey.xyz)**

---

## Configuration

### Project Setup

Add APIKey to your Theos project's `Makefile`:

```makefile
# Link APIKey library
$(TWEAK_NAME)_LDFLAGS += libAPIKey.a

# Optional: Add frameworks if needed
$(TWEAK_NAME)_FRAMEWORKS = UIKit Foundation AudioTollbox
```

---

## API Reference

### PPAPIKey Interface

```objective-c
#import <Foundation/Foundation.h>

@interface PPAPIKey : NSObject

#pragma mark - Singleton
+ (instancetype)sharedInstance;

#pragma mark - Initialization & Configuration
/**
 * Initializes APIKey and executes completion block
 * @param execute Completion block called after successful initialization
 */
- (void)loading:(void (^)(void))execute;

/**
 * Sets the package authentication token
 * @param token Your unique package token from APIKey portal
 */
- (void)setPackageToken:(NSString *)token;

/**
 * Enables/disables English language mode
 * @param value YES for English, NO for Vietnamese
 */
- (void)setENLanguage:(BOOL)value;

/**
 * Sets the application version
 * @param version Version string (e.g., "1.0.0")
 */
- (void)setAppVersion:(NSString *)version;

#pragma mark - Key Management
/**
 * Removes the current license key
 */
- (void)exitKey;

/**
 * Copies the license key to system clipboard
 */
- (void)copyKey;

/**
 * Displays custom alert with key information
 * @param title Alert title
 * @param message Alert message
 * @param apiKeyLabel Label for API key field
 * @param doneTime Duration in seconds before auto-dismiss
 */
- (void)showCSAL:(NSString *)title
          message:(NSString *)message
      apiKeyLabel:(NSString *)apiKeyLabel
         doneTime:(NSInteger)doneTime;

#pragma mark - Information Retrieval
- (NSString *)getKey;              // Current license key
- (NSString *)getKeyExpire;        // Key expiration date
- (NSString *)getKeyAmount;        // Remaining key quota
- (NSString *)getUDID;             // Device UDID
- (NSString *)getDeviceName;       // Device name
- (NSString *)getiOSVersion;       // iOS version
- (NSString *)getAppVersion;       // App version
- (NSString *)getAppName;          // Application name
- (NSString *)getAppBundle;        // Bundle identifier
- (NSString *)getJailbreakStatus;  // Jailbreak detection status

@end
```

---

## Usage Examples

### Basic Implementation

```objective-c
#import "YourTweak.h"
#import <APIKey/PPAPIKey.h>

%hook YourClass

- (void)viewDidLoad {
    %orig;

    // Get shared instance
    PPAPIKey *apiKey = [PPAPIKey sharedInstance];

    // Configure settings
    [apiKey setPackageToken:NSSENCRYPT("your_package_token_here")];
    [apiKey setAppVersion:NSSENCRYPT("1.0.0")];
    [apiKey setENLanguage:YES];

    // Initialize and load
    [apiKey loading:^{
        NSLog(@"[APIKey] Initialized successfully");
        // Your code here - menu loading, feature activation, etc.
        // [self loadMenu];
    }];
}

%end
```

### Advanced Usage

```objective-c
// Retrieve device information
PPAPIKey *apiKey = [PPAPIKey sharedInstance];

NSString *currentKey = [apiKey getKey];
NSString *expireDate = [apiKey getKeyExpire];
NSString *deviceUDID = [apiKey getUDID];
NSString *deviceName = [apiKey getDeviceName];

NSLog(@"License Key: %@", currentKey);
NSLog(@"Expires: %@", expireDate);
NSLog(@"Device: %@ (%@)", deviceName, deviceUDID);

// Check jailbreak status
NSString *jailbreakStatus = [apiKey getJailbreakStatus];
if ([jailbreakStatus containsString:@"Jailbroken"]) {
    NSLog(@"[WARNING] Device is jailbroken");
}
```

### Display Custom Alert

```objective-c
PPAPIKey *apiKey = [PPAPIKey sharedInstance];

[apiKey showCSAL:@"Welcome"
          message:@"Please enter your license key to continue"
      apiKeyLabel:@"License Key:"
         doneTime:0]; // 0 = no auto-dismiss
```

### Key Management

```objective-c
PPAPIKey *apiKey = [PPAPIKey sharedInstance];

// Copy key to clipboard
[apiKey copyKey];
NSLog(@"Key copied to clipboard");

// Remove key (logout)
[apiKey exitKey];
NSLog(@"License key removed");
```

---

## Support

### Contact

- **Telegram**: [@pdp7803](https://t.me/pdp7803)
- **Email**: support@ppapikey.xyz

### Contributing

Contributions are welcome! Please ensure your code follows the project's coding standards.

---

## License & Copyright

```
Copyright © 2024-2026 Phat Pham (@pdp7803)
All rights reserved.

This is proprietary software. Unauthorized copying, modification,
distribution, or use of this software is strictly prohibited.
```

### Important Notes

**Security**: Never commit your package token to version control  
**Updates**: Keep APIKey updated for latest security patches  
**Compatibility**: Test on target iOS versions before release

---

## Changelog

### v5.7.4
- Added two new themes: ANDROID and NEWYEAR2026

### v5.7.2

- Enhanced WebSocket support
- Improved error handling
- Bug fixes and performance improvements
- iOS 14+ compatibility

---

## <a name="vietnamese-version"></a>Phiên Bản Tiếng Việt

## Mục Lục

- [Tổng Quan](#tổng-quan)
- [Tính Năng](#tính-năng)
- [Yêu Cầu Hệ Thống](#yêu-cầu-hệ-thống)
- [Cài Đặt](#cài-đặt)
- [Cấu Hình](#cấu-hình)
- [Tài Liệu API](#tài-liệu-api)
- [Ví Dụ Sử Dụng](#ví-dụ-sử-dụng)
- [Hỗ Trợ](#hỗ-trợ)

---

## Tổng Quan

APIKey là hệ thống quản lý khách hàng và xác thực giấy phép mạnh mẽ được thiết kế cho các tweak và ứng dụng iOS jailbreak. Hệ thống cung cấp xác thực key bảo mật, nhận diện thiết bị và khả năng quản lý người dùng toàn diện.

### Lợi Ích Chính

- **Xác Thực Bảo Mật** - Mã hóa và xác thực theo tiêu chuẩn công nghiệp
- **Theo Dõi Thiết Bị** - Nhận diện thiết bị dựa trên UDID
- **Tích Hợp Dễ Dàng** - API đơn giản với thiết lập tối thiểu
- **Đa Ngôn Ngữ** - Hỗ trợ sẵn tiếng Anh và tiếng Việt
- **Xác Thực Thời Gian Thực** - Kiểm tra key phía server

---

## Tính Năng

- **Quản Lý License Key** - Tạo, xác thực và thu hồi key truy cập
- **Thông Tin Thiết Bị** - Lấy thông tin chi tiết về thiết bị và ứng dụng
- **Kiểm Soát Hết Hạn** - Quản lý giấy phép theo thời gian
- **Tích Hợp Clipboard** - Sao chép key dễ dàng
- **Phát Hiện Jailbreak** - Kiểm tra bảo mật tích hợp
- **Hỗ Trợ WebSocket** - Khả năng giao tiếp thời gian thực

---

## Yêu Cầu Hệ Thống

| Thành Phần       | Phiên Bản        |
| ---------------- | ---------------- |
| **Nền Tảng**     | iOS 10.0+        |
| **Build System** | Theos            |
| **Hệ Điều Hành** | macOS hoặc Linux |
| **Ngôn Ngữ**     | Objective-C      |

---

## Cài Đặt

### 1. Cài Đặt Theos

Làm theo hướng dẫn cài đặt Theos chính thức cho nền tảng của bạn:

```bash
# macOS
brew install theos

# Hoặc truy cập: https://theos.dev/docs/installation
```

### 2. Tải APIKey

Tải phiên bản mới nhất từ [mục Release](https://github.com/yourusername/APIKey/releases):

```bash
# Tải những tài nguyên sau
APIKey.h
libPPAPIKey.a
```

### 3. Đăng Ký Tài Khoản

Tạo tài khoản nhà phát triển và lấy package token của bạn:

🔗 **[Đăng ký tại APIKey Portal](https://new.ppapikey.xyz)**

---

## Cấu Hình

### Thiết Lập Dự Án

Thêm APIKey vào `Makefile` của dự án Theos:

```makefile
# Liên kết thư viện APIKey
$(TWEAK_NAME)_LDFLAGS += libAPIKey.a

# Tùy chọn: Thêm frameworks nếu cần
$(TWEAK_NAME)_FRAMEWORKS = UIKit Foundation AudioToolBox
```

---

## Tài Liệu API

### Giao Diện PPAPIKey

```objective-c
#import <Foundation/Foundation.h>

@interface PPAPIKey : NSObject

#pragma mark - Singleton
+ (instancetype)sharedInstance;

#pragma mark - Khởi Tạo & Cấu Hình
/**
 * Khởi tạo APIKey và thực thi completion block
 * @param execute Completion block được gọi sau khi khởi tạo thành công
 */
- (void)loading:(void (^)(void))execute;

/**
 * Thiết lập token xác thực package
 * @param token Token package duy nhất từ APIKey portal
 */
- (void)setPackageToken:(NSString *)token;

/**
 * Bật/tắt chế độ ngôn ngữ tiếng Anh
 * @param value YES cho tiếng Anh, NO cho tiếng Việt
 */
- (void)setENLanguage:(BOOL)value;

/**
 * Thiết lập phiên bản ứng dụng
 * @param version Chuỗi phiên bản (ví dụ: "1.0.0")
 */
- (void)setAppVersion:(NSString *)version;

#pragma mark - Quản Lý Key
/**
 * Xóa license key hiện tại
 */
- (void)exitKey;

/**
 * Sao chép license key vào clipboard hệ thống
 */
- (void)copyKey;

/**
 * Hiển thị alert tùy chỉnh với thông tin key
 * @param title Tiêu đề alert
 * @param message Nội dung alert
 * @param apiKeyLabel Nhãn cho trường API key
 * @param doneTime Thời gian tính bằng giây trước khi tự động đóng
 */
- (void)showCSAL:(NSString *)title
          message:(NSString *)message
      apiKeyLabel:(NSString *)apiKeyLabel
         doneTime:(NSInteger)doneTime;

#pragma mark - Lấy Thông Tin
- (NSString *)getKey;              // License key hiện tại
- (NSString *)getKeyExpire;        // Ngày hết hạn key
- (NSString *)getKeyAmount;        // Số lượng key còn lại
- (NSString *)getUDID;             // UDID thiết bị
- (NSString *)getDeviceName;       // Tên thiết bị
- (NSString *)getiOSVersion;       // Phiên bản iOS
- (NSString *)getAppVersion;       // Phiên bản ứng dụng
- (NSString *)getAppName;          // Tên ứng dụng
- (NSString *)getAppBundle;        // Bundle identifier
- (NSString *)getJailbreakStatus;  // Trạng thái phát hiện jailbreak

@end
```

---

## Ví Dụ Sử Dụng

### Cài Đặt Cơ Bản

```objective-c
#import "YourTweak.h"
#import <APIKey/PPAPIKey.h>

%hook YourClass

- (void)viewDidLoad {
    %orig;

    // Lấy shared instance
    PPAPIKey *apiKey = [PPAPIKey sharedInstance];

    // Cấu hình thiết lập
    [apiKey setPackageToken:NSSENCRYPT("your_package_token_here")];
    [apiKey setAppVersion:NSSENCRYPT("1.0.0")];
    [apiKey setENLanguage:NO]; // NO = Tiếng Việt

    // Khởi tạo và tải
    [apiKey loading:^{
        NSLog(@"[APIKey] Khởi tạo thành công");
        // Code của bạn ở đây - tải menu, kích hoạt tính năng, v.v.
        // [self loadMenu];
    }];
}

%end
```

### Sử Dụng Nâng Cao

```objective-c
// Lấy thông tin thiết bị
PPAPIKey *apiKey = [PPAPIKey sharedInstance];

NSString *currentKey = [apiKey getKey];
NSString *expireDate = [apiKey getKeyExpire];
NSString *deviceUDID = [apiKey getUDID];
NSString *deviceName = [apiKey getDeviceName];

NSLog(@"License Key: %@", currentKey);
NSLog(@"Hết hạn: %@", expireDate);
NSLog(@"Thiết bị: %@ (%@)", deviceName, deviceUDID);

// Kiểm tra trạng thái jailbreak
NSString *jailbreakStatus = [apiKey getJailbreakStatus];
if ([jailbreakStatus containsString:@"Jailbroken"]) {
    NSLog(@"[WARNING] Thiết bị đã jailbreak");
}
```

### Hiển Thị Alert Tùy Chỉnh

```objective-c
PPAPIKey *apiKey = [PPAPIKey sharedInstance];

[apiKey showCSAL:@"Chào Mừng"
          message:@"Vui lòng nhập license key để tiếp tục"
      apiKeyLabel:@"License Key:"
         doneTime:0]; // 0 = không tự động đóng
```

### Quản Lý Key

```objective-c
PPAPIKey *apiKey = [PPAPIKey sharedInstance];

// Sao chép key vào clipboard
[apiKey copyKey];
NSLog(@"Đã sao chép key vào clipboard");

// Xóa key (đăng xuất)
[apiKey exitKey];
NSLog(@"Đã xóa license key");
```

---

## Hỗ Trợ

### Liên Hệ

- **Telegram**: [@pdp7803](https://t.me/pdp7803)
- **Website**: [v4.ppapikey.xyz](https://v4.ppapikey.xyz)

### Đóng Góp

Chúng tôi hoan nghênh mọi đóng góp! Vui lòng đảm bảo code của bạn tuân theo tiêu chuẩn coding của dự án.

---

## Giấy Phép & Bản Quyền

```
Copyright © 2024-2026 Phát Phạm (@pdp7803)
Bảo lưu mọi quyền.

Đây là phần mềm độc quyền. Nghiêm cấm sao chép, sửa đổi,
phân phối hoặc sử dụng phần mềm này mà không có sự cho phép.
```

### Lưu Ý Quan Trọng

**Bảo Mật**: Không bao giờ commit package token vào version control  
**Cập Nhật**: Giữ APIKey luôn được cập nhật để có các bản vá bảo mật mới nhất  
**Tương Thích**: Kiểm tra trên các phiên bản iOS mục tiêu trước khi release

---

## Lịch Sử Thay Đổi

### v5.7.4
- Bổ sung thêm giao diện mới NEWYEAR2026 và ANDROID

### v5.7.2

- Cải thiện hỗ trợ WebSocket
- Xử lý lỗi tốt hơn
- Sửa lỗi và cải thiện hiệu suất
- Tương thích iOS 14+

---

<div align="center">

### Made with love by [Phat Pham](https://t.me/pdp7803)

**[Back to top](#apikey---customer-management-system)**

</div>
