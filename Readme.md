
# APIKey - Quản Lý Khách Hàng (v5.6.2)

---

<p align="center">
  <font size="5"><b>📋 Hướng Dẫn Sử Dụng APIKey</b></font>
</p>

---

### 🚀 **Cài Đặt Dự Án**

1. **Cài Đặt Theos**  
   - Tải và cài đặt Theos trên hệ điều hành **Linux** hoặc **macOS**: [Theos Dev](https://theos.dev).

2. **Tải APIKey**  
   - Truy cập mục **Release** của APIKey, tải file `.zip` và giải nén để chuẩn bị cấu hình.

---

### 🔑 **Thiết Lập Server Key & Tài Khoản**

- **Đăng Ký Tài Khoản & Tạo Package:** [APIKey Registration](https://new.ppapikey.xyz)
- **Cài Đặt Cấu Hình Ứng Dụng Server:**  
  [Tải File Cấu Hình](https://raw.githubusercontent.com/pp7803/APIKey/main/AppConfig/ppapikey.mobileconfig)

---

### 📚 **Các Phương Thức APIKey**

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

### ⚙️ **Ví Dụ Cài Đặt APIKey**

```objective-c
PPAPIKey *APIKey = [[PPAPIKey alloc] init];

// Thiết lập các tham số cấu hình
[APIKey setPackageToken:NSSENCRYPT("")];
[APIKey setOKText:NSSENCRYPT("OK")];
[APIKey setContactText:NSSENCRYPT("Liên Hệ")];
[APIKey setAppVersion:NSSENCRYPT("1.0.0")];
[APIKey setENLanguage:YES];

// Tải dữ liệu hoặc xử lý sau khi hoàn tất
[APIKey loading:^{
    // loadMenu();
}];
```

---

### 🛠️ **Cấu Hình Makefile Cho Dự Án Theos**

```makefile
$(TWEAK_NAME)_LDFLAGS += libAPIKey.a
```

---

### 👤 **Thông Tin Tác Giả**

**APIKey** được phát triển bởi [Phát Phạm](https://t.me/pdp7803).  
Vui lòng liên hệ trực tiếp để được hỗ trợ và cập nhật các tính năng mới nhất.

---

### 📄 **Ghi Chú**

- Đảm bảo hệ điều hành và các công cụ phát triển của bạn luôn được cập nhật để tránh các vấn đề tương thích.
- Sử dụng các phương thức **encrypt** dữ liệu để bảo mật thông tin quan trọng. 

---

Bản quyền © 2024 bởi [Phát Phạm](https://t.me/pdp7803). All rights reserved.
