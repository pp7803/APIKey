<div align="center">

# APIKey 6.2

**Enterprise-grade license authentication, active tamper defense & customer management for iOS tweaks**

[![Version](https://img.shields.io/badge/release-6.2.0-2563EB?style=flat-square)](https://github.com/pp7803/APIKey/releases)
[![Platform](https://img.shields.io/badge/iOS-14.0%2B-lightgrey?style=flat-square)](https://www.apple.com/ios)
[![Architecture](https://img.shields.io/badge/arch-arm64%20%7C%20arm64e-blue?style=flat-square)]()
[![License](https://img.shields.io/badge/license-Proprietary-red?style=flat-square)](LICENSE)
[![Theos](https://img.shields.io/badge/build-Theos-orange?style=flat-square)](https://theos.dev)

[Tiếng Việt](#phiên-bản-tiếng-việt) · [English](#english-version) · [Changelog](#lịch-sử-thay-đổi) · [Portal](https://v5.ppapikey.xyz)

</div>

---

## <a name="phiên-bản-tiếng-việt"></a>Phiên Bản Tiếng Việt

### Mục Lục

| | |
|---|---|
| Bắt đầu | [Tổng quan](#tổng-quan-vi) · [Yêu cầu](#yêu-cầu-hệ-thống-vi) · [Cài đặt](#cài-đặt-vi) · [Cấu hình](#cấu-hình-vi) |
| **Tích hợp** | [API (`PPAPIKey.h`)](#tài-liệu-api-vi) · [C Bridge](#c-bridge-api-vi) · [Ví dụ](#ví-dụ-sử-dụng-vi) · [Thư viện](#biến-thể-thư-viện) |
| Sản phẩm | [Phát hành 6.2.0](#phát-hành-620) · [Chủ đề](#chủ-đề-vi) · [Anti-Hex](#ứng-dụng-anti-hex) · [Changelog](#lịch-sử-thay-đổi) |
| Hỗ trợ | [Liên hệ](#hỗ-trợ-vi) · [Giấy phép](#giấy-phép--bản-quyền) |

---

## <a name="phát-hành-620"></a>Phát Hành 6.2.0

> **Bốn lựa chọn:** `6.2B` · `6.2F` · `6.2BC` · `6.2FC`

| Hạng mục | Tóm tắt |
| -------- | ------- |
| **Phòng thủ chủ động** | Khi phát hiện thiết bị bị can thiệp (hook, gắn trình gỡ lỗi, vượt rào kiểm tra, bật proxy nghe lén hoặc chỉnh sửa file trên bản Full), thư viện sẽ âm thầm gửi báo cáo mã hóa về server trước khi đóng ứng dụng. |
| **Tự động cấm thiết bị (Auto-Ban)** | Server tự động đưa thiết bị vi phạm vào danh sách đen, khóa key liên quan và ghi lại lịch sử vi phạm. Có tùy chọn bật/tắt **Auto-Ban** riêng cho từng package trên Web Portal & App Mobile. |
| **Chặn thiết bị thời gian thực** | Chặn ngay thiết bị bị cấm khi kiểm tra key và đẩy lệnh khóa tức thì về máy đang mở ứng dụng nếu Admin hoặc chủ package bấm cấm. |
| **Giao tiếp thuần C (`PPAPIKey.h`)** | Loại bỏ hoàn toàn lớp gọi Objective-C cũ (`[PPAPIKey shared]`, `setToken:`, `loading:`, ...) để chống giả mạo lời gọi hàm; mọi tích hợp sử dụng thống nhất các hàm C như `setTokenC`, `setENC`, `setVerC`, `loadingC`, `packageData`, … |
| **Giao thức bảo mật v3** | Nâng cấp toàn bộ luồng kiểm tra key và lấy dữ liệu lên chuẩn bảo mật mới, mã hóa hai chiều và chống gửi lại gói tin cũ. |
| **Âm thanh phản hồi mới** | Làm mới toàn bộ âm thanh tương tác: âm thanh đang tải (2 giây), xác thực thành công (1 giây) và thất bại (1 giây) gọn gàng, rõ nét. |
| **Tương thích `arm64e` & bản Compat (`BC`/`FC`)** | Hỗ trợ đầy đủ cả máy đời mới (`arm64e`) và `arm64`. Bổ sung nhánh Compat (`BC`/`FC`) tương thích cao cho các dự án có cấu hình hoặc công cụ bảo vệ riêng. |

`B` là **Basic**, `F` là **Full**, còn hậu tố `C` là bản **Compat / Custom** (tương thích cao cho môi trường đặc thù).

---

## <a name="tổng-quan-vi"></a>Tổng Quan

**APIKey** là bộ thư viện xác thực bản quyền (license) hoàn chỉnh cho tweak iOS — xử lý kiểm tra key, gắn định danh thiết bị, tự vệ chủ động trước hành vi crack, giao tiếp bảo mật với server và hiển thị giao diện nhiều chủ đề, giúp bạn tập trung phát triển tính năng chính.

Phiên bản **6.2** tiếp nối kiến trúc tách biệt gọn gàng từ **6.0** (tweak và thư viện lõi giao tiếp qua `PPAPIKey.h`), đồng thời nâng cấp khả năng bảo vệ từ phía máy khách lên cơ chế **phát hiện & tự động khóa thiết bị tấn công từ phía server**.

### Vì sao chọn APIKey 6.2

| Khả năng | Mô tả |
| -------- | ----- |
| **Kiến trúc tách biệt** | Tweak và thư viện lõi độc lập, dễ cập nhật mà không ảnh hưởng code chính |
| **Giao tiếp thuần C** | Bộ hàm đơn giản: `setTokenC`, `loadingC`, `packageData`, `exitKeyC`, `copyKeyC`, … |
| **Hai cấp & 4 biến thể** | `basic` / `full` (chống chỉnh sửa file, VIP3) cùng 2 bản `compat` (`BC` / `FC`) |
| **Phòng thủ chủ động** | Tự động gửi báo cáo khi bị can thiệp, khóa thiết bị vi phạm và đẩy lệnh khóa tức thì |
| **13 theme UI** | Giao diện loading, nhập key, lấy UDID, cập nhật — tùy chỉnh riêng theo package |
| **Bảo mật đa lớp** | Mã hóa gói tin, chống sửa đổi, chống gỡ lỗi, chống gửi lại gói tin và nhận diện phần cứng |
| **Đa ngôn ngữ** | Tích hợp sẵn Tiếng Việt và Tiếng Anh |

---

## <a name="tính-năng-mới-trong-60"></a>Tính Năng Mới & Thay Đổi API (5.7 / 6.0 → 6.2)

| API cũ (5.7 / 6.0 ObjC) | API 6.2 (Thuần C)                        | Ghi Chú                                            |
| ----------------------- | ---------------------------------------- | -------------------------------------------------- |
| `sharedInstance` / `shared` | *Đã loại bỏ*                         | Không còn gọi qua class Objective-C; gọi thẳng hàm C |
| `setPackageToken:` / `setToken:` | **`setTokenC(const char *)`**   | Loại bỏ `setToken:`, chỉ dùng `setTokenC`          |
| `setENLanguage:` / `setEN:`      | **`setENC(int)`**               | `1 = Tiếng Anh`, `0 = Tiếng Việt`                  |
| `setAppVersion:` / `setVer:`     | **`setVerC(const char *)`**     | Thiết lập phiên bản ứng dụng                       |
| `loading:`                       | **`loadingC(execute)`**         | Khởi tạo & chạy code chính khi xác thực thành công |
| `packageData:`                   | **`packageData(version, cb)`**  | Lấy dữ liệu package (`version` chỉ hỗ trợ `1` hoặc `2`) |
| `getKey` / `getDeviceKey`        | **`getDeviceKeyC()`**           | Trả về mã key hiện tại                             |
| `getUDID` / `getDeviceID`        | **`getDeviceIDC()`**            | Trả về mã thiết bị (UDID / UUID)                   |
| `exitKey` / `copyKey`            | **`exitKeyC(cb)` / `copyKeyC(cb)`** | Bổ sung kết quả thành công/thất bại qua callback |
| —                                | **Giao thức v3 & chống lặp gói** | Mã hóa gói tin mạnh mẽ và chống gửi lại request cũ |
| —                                | **Báo cáo can thiệp & Auto-Ban** | Tự động báo về server và cấm thiết bị vi phạm      |
| —                                | **4 Biến Thể (`B`, `F`, `BC`, `FC`)** | Hỗ trợ đầy đủ cả bản tiêu chuẩn lẫn bản tương thích cao |

**Đã loại bỏ:**
- **Từ 6.0:** `showCSAL:`, `getDeviceName`, `getiOSVersion`, `getAppVersion`, `getAppName`, `getJailbreakStatus`.
- **Từ 6.2:** Toàn bộ các hàm gọi kiểu Objective-C (`[PPAPIKey shared]`, `setToken:`, `setEN:`, `setVer:`, `loading:`, `packageData:`, `getDeviceKey`, `getKeyExpire`, `getKeyAmount`, `getDeviceID`, `getAppBundle`, `exitKey`, `copyKey`) — chuyển sang **100% hàm C (`PPAPIKey.h`)** để tránh bị hook hoặc đánh tráo lời gọi hàm.

---

## <a name="tính-năng-vi"></a>Tính Năng

| Module | Khả năng |
| ------ | -------- |
| **Bản quyền (License)** | Kiểm tra key, ngày hết hạn, giới hạn số máy, lưu bản quyền offline an toàn, sao chép key |
| **Thiết bị** | Gắn mã máy (UDID/IDFV), kiểm soát bundle ID, đồng bộ dữ liệu package, chặn máy bị cấm ngay lập tức |
| **Bảo mật** | Chống gỡ lỗi, chống hook, chống sửa file (bản Full), phát hiện proxy, báo cáo can thiệp & tự động cấm |
| **Tích hợp** | Dùng trực tiếp qua `PPAPIKey.h` · Hỗ trợ `arm64` & `arm64e` |
| **Phân phối** | `libPPAPIKey_basic.a` · `libPPAPIKey_full.a` · `libPPAPIKey_compat_basic.a` · `libPPAPIKey_compat_full.a` |
| **Trải nghiệm** | 13 chủ đề giao diện · song ngữ Việt/Anh · âm thanh phản hồi mới · thông báo toast · rung phản hồi |

---

## <a name="yêu-cầu-hệ-thống-vi"></a>Yêu Cầu Hệ Thống

| Thành Phần       | Phiên Bản                |
| ---------------- | ------------------------ |
| **Nền Tảng**     | iOS 14.0+                |
| **Kiến Trúc**    | `arm64`, `arm64e`        |
| **Build System** | Theos                    |
| **Chuẩn C++**    | `gnu++17` / `c++17`      |
| **Ngôn Ngữ**     | Objective-C / C / C++    |

---

## <a name="cài-đặt-vi"></a>Cài Đặt

> **Quy trình nhanh:** Cài Theos → tải bản release 6.2 → đăng ký [portal](https://v5.ppapikey.xyz) → link thư viện trong `Makefile`.

### 1. Cài Đặt Theos

Làm theo hướng dẫn cài đặt Theos chính thức cho nền tảng của bạn:

```bash
# macOS
brew install theos

# Hoặc truy cập: https://theos.dev/docs/installation
```

### 2. Tải APIKey 6.2

Tải phiên bản mới nhất từ [mục Release](https://github.com/pp7803/APIKey/releases):

```
PPAPIKey.h
libPPAPIKey_full.a          # Standard Full (có Anti-Hex, yêu cầu VIP3)
libPPAPIKey_basic.a         # Standard Basic (không cần Anti-Hex)
libPPAPIKey_compat_full.a   # Compat Full (tương thích cao, có Anti-Hex, yêu cầu VIP3)
libPPAPIKey_compat_basic.a  # Compat Basic (tương thích cao, không cần Anti-Hex)
```

### 3. Đăng Ký Tài Khoản

Tạo tài khoản nhà phát triển và lấy package token:

🔗 **[Đăng ký tại APIKey Portal](https://v5.ppapikey.xyz)**

---

## <a name="cấu-hình-vi"></a>Cấu Hình

### Thiết Lập Dự Án

Thêm APIKey vào `Makefile` của dự án Theos:

```makefile
ARCHS = arm64
TARGET = iphone:clang:latest:14.0

TWEAK_NAME = YourTweak

$(TWEAK_NAME)_FRAMEWORKS = UIKit AVFoundation Foundation SystemConfiguration SafariServices AudioToolbox Accelerate

# Liên kết thư viện APIKey (chọn một)
# $(TWEAK_NAME)_LDFLAGS += libPPAPIKey_full.a          # Standard Full (VIP3)
$(TWEAK_NAME)_LDFLAGS += libPPAPIKey_basic.a           # Standard Basic (mọi người dùng)
# $(TWEAK_NAME)_LDFLAGS += libPPAPIKey_compat_full.a   # Compat Full (tương thích cao, VIP3)
# $(TWEAK_NAME)_LDFLAGS += libPPAPIKey_compat_basic.a  # Compat Basic (tương thích cao)

$(TWEAK_NAME)_CCFLAGS = -std=gnu++17 -Wno-deprecated-declarations -Wno-unused-variable
$(TWEAK_NAME)_FILES = tweak.mm

include $(THEOS_MAKE_PATH)/tweak.mk
```

---

## <a name="tài-liệu-api-vi"></a>Tài Liệu API

### Giao Diện `PPAPIKey.h` (C Bridge API — Chuẩn 6.2)

`PPAPIKey.h` cung cấp C Bridge thuần, cho phép gọi từ Objective-C, Objective-C++ hoặc C/C++ (khi hỗ trợ blocks `-fblocks`):

```c
#import <Foundation/Foundation.h>

#ifdef __cplusplus
extern "C" {
#endif

// Thiết lập token xác thực package (lấy từ APIKey Portal)
void setTokenC(const char *_Nullable token);

// Bật/tắt chế độ ngôn ngữ tiếng Anh (1 = English, 0 = Tiếng Việt)
void setENC(int enable);

// Thiết lập phiên bản ứng dụng (ví dụ: "1.0")
void setVerC(const char *_Nullable ver);

// Khởi tạo APIKey, kiểm tra thiết bị/license và thực thi block khi hợp lệ
void loadingC(void (^_Nonnull execute)(void));

// Lấy dữ liệu package từ server (version chỉ hỗ trợ 1 hoặc 2; khuyến nghị dùng 2 cho bảo vệ replay API v3)
void packageData(int version, void (^_Nonnull completion)(id _Nullable data));

// Lấy thông tin thiết bị & key hiện tại
const char *getDeviceKeyC(void);   // License key hiện tại
const char *getKeyExpireC(void);   // Ngày hết hạn key
const char *getKeyAmountC(void);   // Số lượng máy / quota
const char *getDeviceIDC(void);    // UDID / UUID thiết bị
const char *getAppBundleC(void);   // Bundle identifier của app

// Quản lý key
void exitKeyC(void (^_Nonnull completion)(BOOL success)); // Xóa / đăng xuất key hiện tại
void copyKeyC(void (^_Nonnull completion)(BOOL success)); // Sao chép key vào clipboard

#ifdef __cplusplus
}
#endif
```

---

## <a name="c-bridge-api-vi"></a>Lưu Ý Khi Sử Dụng

- **Giữ giá trị chuỗi:** Các hàm trả về `const char *` (`getDeviceKeyC`, `getKeyExpireC`, `getKeyAmountC`, `getDeviceIDC`, `getAppBundleC`) trả về vùng nhớ tạm; hãy sao chép sang `NSString` hoặc biến riêng nếu cần dùng lại nhiều lần sau này.
- **Thứ tự gọi chuẩn:** Luôn gọi `setTokenC`, `setENC`, `setVerC` **trước khi** gọi `loadingC`.
- **Tham số `packageData(version, completion)`:** Chỉ hỗ trợ `version = 1` (tiêu chuẩn) hoặc `version = 2` (khuyến nghị — bảo mật cao hơn và chống gửi lại gói tin cũ). Mọi giá trị khác `1` hoặc `2` sẽ trả về `nil`.
- **Bảo vệ đoạn code bên trong `loadingC`:** Trong bản `6.2`, đoạn code thực thi chỉ được chạy sau khi xác thực token thành công, thiết bị không nằm trong danh sách cấm và vượt qua kiểm tra toàn vẹn.

---

## <a name="ví-dụ-sử-dụng-vi"></a>Ví Dụ Sử Dụng

### Cài Đặt Cơ Bản (C Bridge trong `tweak.mm`)

```objective-c
#import "YourTweak.h"
#import "PPAPIKey.h"

%hook YourClass

- (void)viewDidLoad {
    %orig;

    setTokenC("your_package_token_here");
    setENC(0);       // 0 = Tiếng Việt, 1 = English
    setVerC("1.0");

    loadingC(^{
        NSLog(@"[APIKey] Khởi tạo và xác thực thành công");
        // Code của bạn ở đây — tải menu, kích hoạt tính năng, v.v.
    });
}

%end
```

### Lấy Dữ Liệu Package (`packageData`)

```objective-c
// version = 1 (tiêu chuẩn) hoặc 2 (khuyến nghị — API v3 + replay guard)
packageData(2, ^(id _Nullable data) {
    if (data) {
        NSLog(@"[APIKey] Package data: %@", data);
    }
});
```

### Lấy Thông Tin Thiết Bị & Key

```objective-c
const char *key    = getDeviceKeyC();
const char *expire = getKeyExpireC();
const char *amount = getKeyAmountC();
const char *udid   = getDeviceIDC();
const char *bundle = getAppBundleC();

NSLog(@"Key: %s, Hết hạn: %s, Còn lại: %s", key, expire, amount);
NSLog(@"Thiết bị: %s, Bundle: %s", udid, bundle);
```

### Quản Lý Key (`copyKeyC` & `exitKeyC`)

```objective-c
// Sao chép key vào clipboard
copyKeyC(^(BOOL success) {
    NSLog(@"[APIKey] Copy key: %@", success ? @"OK" : @"FAIL");
});

// Xóa key hiện tại (đăng xuất)
exitKeyC(^(BOOL success) {
    NSLog(@"[APIKey] Exit key: %@", success ? @"OK" : @"FAIL");
});
```

### Template Tweak Đầy Đủ (`tweak.mm`)

```objective-c
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include <CoreFoundation/CoreFoundation.h>

#import "PPAPIKey.h"

// ---- Phát hiện launch qua CFNotificationCenter ----
static void launch_callback(CFNotificationCenterRef __unused c,
                            void *__unused o,
                            CFStringRef __unused n,
                            const void *__unused obj,
                            CFDictionaryRef __unused ui)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        setTokenC("your_package_token_here");
        setENC(0);
        setVerC("1.0");
        loadingC(^{
            NSLog(@"[APIKey] Sẵn sàng");
        });
    });
}

__attribute__((constructor))
static void tweak_init(void)
{
    CFNotificationCenterAddObserver(
        CFNotificationCenterGetLocalCenter(),
        NULL,
        launch_callback,
        (CFStringRef)UIApplicationDidFinishLaunchingNotification,
        NULL,
        CFNotificationSuspensionBehaviorDeliverImmediately
    );
}
```

---

## <a name="biến-thể-thư-viện"></a>Biến Thể Thư Viện

| Mã | Phiên bản | File | Phù hợp với |
| -- | --------- | ---- | ----------- |
| **B** | Standard Basic | `libPPAPIKey_basic.a` | Nhu cầu thông thường, gọn nhẹ và dễ tích hợp, không cần bước Anti-Hex. |
| **F** | Standard Full | `libPPAPIKey_full.a` | Gói đầy đủ cho bản phát hành chính thức, có lớp bảo vệ Anti-Hex dành cho VIP3. |
| **BC** | Compat Basic | `libPPAPIKey_compat_basic.a` | Bản Basic tương thích cao, phù hợp với dự án có cấu hình mạng hoặc công cụ bảo vệ riêng. |
| **FC** | Compat Full | `libPPAPIKey_compat_full.a` | Bản Full tương thích cao kèm lớp bảo vệ Anti-Hex dành cho VIP3. |

> **Khác biệt bảo vệ giữa Basic & Full trong 6.2:**
> - **Cả Basic (`B`/`BC`) và Full (`F`/`FC`)** đều có đầy đủ các lớp tự vệ khi chạy: chống gắn trình gỡ lỗi, chống hook hàm, phát hiện proxy nghe lén, tự động gửi báo cáo can thiệp và khóa thiết bị từ server.
> - **Riêng Full (`F`/`FC`)** bổ sung thêm lớp **Anti-Hex** để chống sửa mã máy hoặc vô hiệu hóa kiểm tra trực tiếp trên file dylib.
> - **Bản Lite đã bị loại bỏ** từ 6.1.0; các dự án cũ cần chuyển sang `basic` hoặc `full`.

---

## <a name="ứng-dụng-anti-hex"></a>Ứng Dụng Anti-Hex

Chúng tôi cung cấp ứng dụng Anti-Hex chuyên dụng trên 3 nền tảng (macOS, Windows, iOS) để giúp bạn bảo vệ tweak sử dụng bản **Full (`F` / `FC`)**:

### Tải về

- [PPAPIKey Hash Generator (zip)](https://ppapikey.xyz/PPAPIkeyHashGenerator.zip) — bao gồm `PPAPIKey Hash Generator.dmg`, `PPAPIKey Hash Generator.ipa`, `PPHashGenerator.Windows-win-x64.zip`

<div align="center">

|            macOS             |              Windows               |            iOS             |
| :--------------------------: | :--------------------------------: | :------------------------: |
| ![macOS](AntiHexApp/MAC.png) | ![Windows](AntiHexApp/Windows.png) | ![iOS](AntiHexApp/iOS.png) |

</div>

### Quy Trình (Flow)

#### Quyền đăng nhập Tool

| Tài khoản | Đăng nhập Tool |
| --------- | -------------- |
| **Admin** | Được phép, không phụ thuộc thời hạn VIP |
| **VIP3 còn hạn** | Được phép trong thời hạn VIP |
| **VIP3 hết hạn, VIP1, VIP2 hoặc tài khoản thường** | Không được phép |

Quyền đăng nhập được kiểm tra trên server. Tài khoản VIP1/VIP2 cần nâng cấp lên **VIP3**; tài khoản VIP3 hết hạn cần gia hạn trước khi sử dụng Tool.

#### Anti-Hex Full

1. Tải và mở Tool phù hợp với nền tảng của bạn.
2. Đăng nhập bằng tài khoản **VIP3 còn hạn** hoặc **Admin**.
3. Đưa file `Dylib` vào Tool và thực hiện **Anti-Hex Full**.

---

## <a name="chủ-đề-vi"></a>Chủ Đề

APIKey 6.2 tiếp tục hỗ trợ ba nhóm giao diện độc lập. Có thể chọn cùng một theme cho cả ba nhóm hoặc phối theme khác nhau theo package.

| Nhóm | Hiển thị ở đâu | Lựa chọn |
| ---- | ------------- | -------- |
| **CHECKKEY** | Loading, trạng thái kiểm tra key và thông báo kết quả | 13 theme |
| **ENTERKEY** | Màn hình nhập và gửi license key | 13 theme + giao diện UIKit (`UIAL`) |
| **EXTENSION** | Get UDID, thông báo cập nhật và xác nhận bỏ qua | 13 theme |

Các theme chung gồm: `ANDROID`, `CST`, `GLASS`, `HACKER`, `JG`, `LINUX`, `MAC`, `MBP`, `MINECRAFT`, `NEWYEAR2026`, `PGAM`, `SCL` và `XP`.

### CHECKKEY

<div align="center">

| | | |
| :---: | :---: | :---: |
| **ANDROID**<br>![ANDROID Check Key](APITheme/CHECKKEY/ANDROID.png) | **CST**<br>![CST Check Key](APITheme/CHECKKEY/CST.png) | **GLASS**<br>![GLASS Check Key](APITheme/CHECKKEY/GLASS.png) |
| **HACKER**<br>![HACKER Check Key](APITheme/CHECKKEY/HACKER.png) | **JG**<br>![JG Check Key](APITheme/CHECKKEY/JG.png) | **LINUX**<br>![LINUX Check Key](APITheme/CHECKKEY/LINUX.png) |
| **MAC**<br>![MAC Check Key](APITheme/CHECKKEY/MAC.png) | **MBP**<br>![MBP Check Key](APITheme/CHECKKEY/MBP.png) | **MINECRAFT**<br>![MINECRAFT Check Key](APITheme/CHECKKEY/MINECRAFT.png) |
| **NEWYEAR2026**<br>![NEWYEAR2026 Check Key](APITheme/CHECKKEY/NEWYEAR2026.png) | **PGAM**<br>![PGAM Check Key](APITheme/CHECKKEY/PGAM.png) | **SCL**<br>![SCL Check Key](APITheme/CHECKKEY/SCL.png) |
| **XP**<br>![XP Check Key](APITheme/CHECKKEY/XP.png) | | |

</div>

### ENTERKEY

Ngoài 13 theme chung, nhóm Enter Key có thêm `UIAL` — giao diện nhập key quen thuộc của iOS. Ảnh minh họa được đặt tên `UIKIT.PNG`.

<div align="center">

| | | |
| :---: | :---: | :---: |
| **ANDROID**<br>![ANDROID Enter Key](APITheme/ENTERKEY/ANDROID.PNG) | **CST**<br>![CST Enter Key](APITheme/ENTERKEY/CST.PNG) | **GLASS**<br>![GLASS Enter Key](APITheme/ENTERKEY/GLASS.PNG) |
| **HACKER**<br>![HACKER Enter Key](APITheme/ENTERKEY/HACKER.PNG) | **JG**<br>![JG Enter Key](APITheme/ENTERKEY/JG.PNG) | **LINUX**<br>![LINUX Enter Key](APITheme/ENTERKEY/LINUX.PNG) |
| **MAC**<br>![MAC Enter Key](APITheme/ENTERKEY/MAC.PNG) | **MBP**<br>![MBP Enter Key](APITheme/ENTERKEY/MBP.PNG) | **MINECRAFT**<br>![MINECRAFT Enter Key](APITheme/ENTERKEY/MINECRAFT.PNG) |
| **NEWYEAR2026**<br>![NEWYEAR2026 Enter Key](APITheme/ENTERKEY/NEWYEAR2026.PNG) | **PGAM**<br>![PGAM Enter Key](APITheme/ENTERKEY/PGAM.PNG) | **SCL**<br>![SCL Enter Key](APITheme/ENTERKEY/SCL.PNG) |
| **XP**<br>![XP Enter Key](APITheme/ENTERKEY/XP.PNG) | **UIAL / UIKit**<br>![UIKit Enter Key](APITheme/ENTERKEY/UIKIT.PNG) | |

</div>

### EXTENSION

Extension dùng cho Get UDID, màn hình cập nhật và xác nhận bỏ qua. Nếu không chọn riêng, nhóm này sẽ dùng theo theme Check Key.

<div align="center">

| | | |
| :---: | :---: | :---: |
| **ANDROID**<br>![ANDROID Extension](APITheme/EXTENSION/ANDROID.PNG) | **CST**<br>![CST Extension](APITheme/EXTENSION/CST.PNG) | **GLASS**<br>![GLASS Extension](APITheme/EXTENSION/GLASS.PNG) |
| **HACKER**<br>![HACKER Extension](APITheme/EXTENSION/HACKER.PNG) | **JG**<br>![JG Extension](APITheme/EXTENSION/JG.PNG) | **LINUX**<br>![LINUX Extension](APITheme/EXTENSION/LINUX.PNG) |
| **MAC**<br>![MAC Extension](APITheme/EXTENSION/MAC.PNG) | **MBP**<br>![MBP Extension](APITheme/EXTENSION/MBP.PNG) | **MINECRAFT**<br>![MINECRAFT Extension](APITheme/EXTENSION/MINECRAFT.PNG) |
| **NEWYEAR2026**<br>![NEWYEAR2026 Extension](APITheme/EXTENSION/NEWYEAR2026.PNG) | **PGAM**<br>![PGAM Extension](APITheme/EXTENSION/PGAM.PNG) | **SCL**<br>![SCL Extension](APITheme/EXTENSION/SCL.PNG) |
| **XP**<br>![XP Extension](APITheme/EXTENSION/XP.PNG) | | |

</div>

---

## <a name="hỗ-trợ-vi"></a>Hỗ Trợ

| Kênh | Liên hệ |
| ---- | ------- |
| **Portal developer** | [v5.ppapikey.xyz](https://v5.ppapikey.xyz) |
| **Telegram** | [@pdp7803](https://t.me/pdp7803) |
| **Email** | duyphatpham783@gmail.com |

Cấu hình package, bật/tắt Auto-Ban thiết bị, chọn theme và thiết lập Anti-Hex thực hiện trên dashboard portal hoặc App Mobile.

---

## Giấy Phép & Bản Quyền

```
Copyright © 2024–2026 Phát Phạm (@pdp7803). All rights reserved.
```

### Khuyến nghị

1. **Tắt tùy chọn Auto-Ban** trên dashboard đối với các package đang trong giai đoạn thử nghiệm nội bộ để tránh tự khóa thiết bị cá nhân, và bật lại khi phát hành chính thức.
2. **Cập nhật APIKey** thường xuyên để nhận các bản vá bảo mật và tương thích mới nhất.

---

## <a name="lịch-sử-thay-đổi"></a>Lịch Sử Thay Đổi

<details open>
<summary><strong>v6.2.0</strong> — Phòng thủ chủ động, Auto-Ban thiết bị & Âm thanh mới</summary>

**Build:** `PPAPIKey 6.2B` · `PPAPIKey 6.2F` · `PPAPIKey 6.2BC` · `PPAPIKey 6.2FC`

| Hạng mục | Thay đổi |
| -------- | -------- |
| **Thuần C (`PPAPIKey.h`)** | Loại bỏ hoàn toàn cách gọi Objective-C cũ (`[PPAPIKey shared]`, `setToken:`, `loading:`, …) để chống giả mạo lời gọi; chuyển toàn bộ sang các hàm C (`setTokenC`, `loadingC`, `packageData`, …). |
| **Giao thức v3 & Bảo vệ thực thi** | Nâng cấp toàn bộ `loading`, `key`, `package`, `packagedata` lên chuẩn mã hóa mới chống lặp gói tin; ngăn chặn bỏ qua bước kiểm tra để chạy thẳng chức năng chính và tăng cường bảo vệ bản quyền offline. |
| **Tự động báo cáo can thiệp** | Khi phát hiện hành vi crack (hook hàm, gắn trình gỡ lỗi, vượt rào kiểm tra, bật proxy nghe lén hoặc chỉnh sửa file trên bản Full), thư viện âm thầm gửi báo cáo mã hóa về server trước khi thoát ứng dụng. |
| **Server Auto-Ban** | Server tự động đưa thiết bị vi phạm vào danh sách cấm, khóa key liên quan và lưu lịch sử chi tiết. Hỗ trợ bật/tắt **Auto-Ban** riêng cho từng package trên Web Portal & App Mobile. |
| **Chặn thiết bị thời gian thực** | Áp dụng chặn thiết bị bị cấm khi xác thực key và đẩy lệnh khóa tức thì về máy đang sử dụng. |
| **Âm thanh mới & Sửa lỗi** | Thay mới âm thanh khi tải (2 giây), thành công (1 giây), thất bại (1 giây); khắc phục lỗi nhận dữ liệu bị chia nhỏ từ máy chủ. |
| **Tương thích mở rộng** | Hỗ trợ đầy đủ cả `arm64` và `arm64e` cùng 4 biến thể `B`, `F`, `BC`, `FC`. |

</details>

<details>
<summary><strong>v6.1.0</strong> — Theme đầy đủ & bản Custom</summary>

**Build:** `PPAPIKey 6.1.0B` · `PPAPIKey 6.1.0F` · `PPAPIKey 6.1.0BC` · `PPAPIKey 6.1.0FC`

| Hạng mục | Thay đổi |
| -------- | -------- |
| **Theme** | Hoàn thiện ba nhóm Check Key, Enter Key và Extension cho 13 phong cách; Enter Key có thêm lựa chọn UIKit (`UIAL`) |
| **Giao diện** | Làm mới bố cục, hiệu ứng nền, góc card, màu Dark Mode và khả năng hiển thị trên nhiều màn hình |
| **Phân phối** | Thêm bản Basic Custom (`BC`) và Full Custom (`FC`) bên cạnh Basic (`B`) và Full (`F`) tiêu chuẩn |
| **Ổn định** | Cải thiện chuyển tiếp giữa loading, Get UDID, nhập key, cập nhật và thông báo kết quả |

</details>

<details>
<summary><strong>v6.0.5</strong> — Sửa lỗi giao diện (Fix bug UI)</summary>

**Build:** `PPAPIKey 6.0.5B` · `PPAPIKey 6.0.5F`

| Hạng mục | Thay đổi |
| -------- | -------- |
| **Sửa lỗi UI** | Căn giữa Loading HUD khi bật `pp_isHide = ON`; dọn sạch dim background tránh liệt cảm ứng nút khi chuyển modal; chống đè modal offline khi host retry; loại bỏ hiện tượng chớp tắt loading thông tin thiết bị |

</details>

<details>
<summary><strong>v6.0.4</strong> — Tinh chỉnh Glass UI & chính sách âm thanh</summary>

**Build:** `PPAPIKey 6.0.4B` · `PPAPIKey 6.0.4F`

| Hạng mục | Thay đổi |
| -------- | -------- |
| **UI · Glass** | Blur fullscreen; layout trực tiếp trên nền; OK tím; FA icon; countdown moto; spacing loading/alert |
| **Âm thanh** | Gỡ `enterkey_showing`, `getudid_showing`; giữ haptic |
| **Tài liệu** | Một README chính thức |

</details>

<details>
<summary><strong>v6.0.3</strong> — Hệ thống UDID & enter-key PGAM</summary>

**Build:** `PPAPIKey 6.0.3B` · `PPAPIKey 6.0.3F`

> **Migration:** Hệ UDID/UUID thay đổi. Khuyến nghị **cài lại sạch** khi nâng cấp.

| Hạng mục | Thay đổi |
| -------- | -------- |
| **UI** | Giao diện Get UDID · theme nhập key **PGAM** |
| **Âm thanh** | Thêm âm thanh khi giao diện xuất hiện |
| **Bảo mật** | Lớp anti-crack |
| **Sửa lỗi** | Overlay che app khi cài `.tipa` · bỏ blur nền toàn cục |

</details>

<details>
<summary><strong>v6.0.2</strong> — Theme nhập key & hiệu năng</summary>

**Build:** `PPAPIKey 6.0.2B` · `PPAPIKey 6.0.2F`

- Làm lại giao diện nhập key và alert xác thực trên mọi theme
- Engine nhập key mới: **UIAL** và **GLASS**
- Sửa mã hóa gây CPU cao / nóng máy
- Sửa bug lấy UUID/UDID

</details>

<details>
<summary><strong>v6.0.1</strong> — Polish HUD theo theme</summary>

**Build:** `PPAPIKey 6.0.1B` · `PPAPIKey 6.0.1F`

- **CST** — Accent bar khớp góc bo card
- **JG / MBP** — Vòng loading quanh logo
- **SCL** — HUD overlay tùy chỉnh; chuyển loading → alert mượt
- **Minecraft** — Dim từng pixel; panel chữ trong suốt
- **Glass** — Layout card HUD ban đầu

</details>

<details>
<summary><strong>v6.0.0</strong> — Viết lại lớn</summary>

- Kiến trúc tweak / core tách biệt · C Bridge API
- Đổi tên API: `shared`, `setToken:`, `getDeviceKey`, `getDeviceID`, …
- Thư viện kép (`basic` / `full`) · toast độc lập
- iOS tối thiểu **14.0** · **gnu++17**

</details>

---

## <a name="english-version"></a>English Version

### Table of Contents

| | |
|---|---|
| Getting started | [Overview](#overview) · [Requirements](#requirements) · [Installation](#installation) · [Configuration](#configuration) |
| Integration | [API Reference](#api-reference) · [C Bridge](#c-bridge-api) · [Examples](#usage-examples) · [Library Variants](#library-variants) |
| Product | [Release 6.2.0](#release-620) · [Themes](#themes) · [Anti-Hex](#anti-hex-app) · [Changelog](#changelog) |
| Support | [Contact](#support) · [License](#license--copyright) |

---

## <a name="release-620"></a>Release 6.2.0

> **Four options:** `6.2B` · `6.2F` · `6.2BC` · `6.2FC`

| Category | Summary |
| -------- | ------- |
| **Active Defense** | When tampering is detected (function hooks, debugger attachment, verification bypass, packet-sniffing proxy, or file edits on Full builds), the library silently sends an encrypted report to the server before closing the app. |
| **Server Auto-Ban** | The server automatically blacklists offending devices, revokes related keys, and logs incident history. Includes a per-package **Auto-Ban** toggle on the Web Portal and Mobile App. |
| **Real-Time Device Blocking** | Blocks banned devices during key verification and pushes an instant lock signal to active apps whenever an admin or package owner bans a device. |
| **Pure C API (`PPAPIKey.h`)** | Removed the legacy Objective-C class (`[PPAPIKey shared]`, `setToken:`, `loading:`, etc.) to prevent method spoofing; all integration now uses pure C functions (`setTokenC`, `setENC`, `setVerC`, `loadingC`, `packageData`, …). |
| **v3 Security Protocol** | Upgraded key validation and package data flows to stronger encrypted transport and protection against replaying old requests. |
| **Refreshed Audio Feedback** | Updated built-in sound effects: 2-second loading sound and crisp 1-second success and failure feedback. |
| **`arm64e` & Compat (`BC`/`FC`)** | Full support for both `arm64` and newer `arm64e` devices, plus high-compatibility `BC`/`FC` variants for projects with custom setups or protection tools. |

`B` means **Basic**, `F` means **Full**, and the `C` suffix identifies a **Compat / Custom** build.

---

## Overview

**APIKey** is a complete license authentication library for iOS tweaks. It handles key verification, device binding, active anti-tamper defense, secure server communication, and a customizable UI — letting you focus on your main features.

Version **6.2** continues the clean modular design from **6.0** (separating your tweak from the core library via `PPAPIKey.h`), while upgrading protection from local-only app exits to **real-time server-side detection and automatic device banning**.

### Why APIKey 6.2

| Capability | Description |
| ---------- | ----------- |
| **Modular design** | Your tweak and core library stay independent for effortless updates |
| **Pure C API** | Clean functions: `setTokenC`, `loadingC`, `packageData`, `exitKeyC`, `copyKeyC`, … |
| **Two tiers & 4 builds** | `basic` / `full` (anti-file-modification for VIP3) plus `compat` (`BC` / `FC`) |
| **Active defense** | Silent tamper reporting + server auto-ban + instant device lock |
| **13 UI themes** | Loading, key entry, Get UDID, and update prompts — configurable per package |
| **Multi-layer security** | Encrypted transport, anti-tamper, anti-debug, anti-replay, and device binding |
| **Localization** | Built-in English and Vietnamese |

---

## What's New & API Changes (5.7 / 6.0 → 6.2)

| Legacy API (5.7 / 6.0 ObjC) | 6.2 API (Pure C)                         | Notes                                      |
| --------------------------- | ---------------------------------------- | ------------------------------------------ |
| `sharedInstance` / `shared` | *Removed*                                | No Objective-C class; call C functions directly |
| `setPackageToken:` / `setToken:` | **`setTokenC(const char *)`**       | Removed `setToken:`; use `setTokenC` only  |
| `setENLanguage:` / `setEN:`      | **`setENC(int)`**                   | `1 = English`, `0 = Vietnamese`            |
| `setAppVersion:` / `setVer:`     | **`setVerC(const char *)`**         | Sets application version                   |
| `loading:`                       | **`loadingC(execute)`**             | Initializes and runs your code on success  |
| `packageData:`                   | **`packageData(version, cb)`**      | Fetches package data (`version` supports `1` or `2` only) |
| `getKey` / `getDeviceKey`        | **`getDeviceKeyC()`**               | Returns current license key                |
| `getUDID` / `getDeviceID`        | **`getDeviceIDC()`**                | Returns device ID (UDID / UUID)            |
| `exitKey` / `copyKey`            | **`exitKeyC(cb)` / `copyKeyC(cb)`** | Includes `BOOL success` completion callback|
| —                                | **v3 Security & Anti-Replay**       | Stronger encryption and protection against replayed requests |
| —                                | **Tamper Reporting & Auto-Ban**     | Automatic tamper reporting + server auto-ban |
| —                                | **4 Build Variants (`B`, `F`, `BC`, `FC`)** | Covers both standard and high-compatibility builds |

**Removed:**
- **Since 6.0:** `showCSAL:`, `getDeviceName`, `getiOSVersion`, `getAppVersion`, `getAppName`, `getJailbreakStatus`.
- **Since 6.2:** The legacy Objective-C wrapper (`[PPAPIKey shared]`, `setToken:`, `setEN:`, `setVer:`, `loading:`, `packageData:`, `getDeviceKey`, `getKeyExpire`, `getKeyAmount`, `getDeviceID`, `getAppBundle`, `exitKey`, `copyKey`) has been removed in favor of **100% pure C functions (`PPAPIKey.h`)** to prevent function-call spoofing and hooking.

---

## Features

| Module | Capability |
| ------ | ---------- |
| **Licensing** | Key verification, expiration control, device limits, secure offline license, clipboard copy |
| **Device** | Device binding (UDID/IDFV), bundle ID checks, package data, instant server-side device blocking |
| **Security** | Anti-debug, anti-hook, anti-file-modification (Full), proxy detection, tamper reporting & auto-ban |
| **Integration** | Direct integration via `PPAPIKey.h` · `arm64` & `arm64e` support |
| **Distribution** | `libPPAPIKey_basic.a` · `libPPAPIKey_full.a` · `libPPAPIKey_compat_basic.a` · `libPPAPIKey_compat_full.a` |
| **UX** | 13 themes · bilingual UI · refreshed audio feedback · toast · haptic feedback |

---

## Requirements

| Component        | Version               |
| ---------------- | --------------------- |
| **Platform**     | iOS 14.0+             |
| **Architecture** | `arm64`, `arm64e`     |
| **Build System** | Theos                 |
| **C++ Standard** | `gnu++17` / `c++17`   |
| **Language**     | Objective-C / C / C++ |

---

## Installation

> **Quick path:** Install Theos → download release 6.2 artifacts → register on the [developer portal](https://v5.ppapikey.xyz) → link library in your `Makefile`.

### 1. Install Theos

Follow the official Theos installation guide for your platform:

```bash
# macOS
brew install theos

# Or visit: https://theos.dev/docs/installation
```

### 2. Download APIKey 6.2

Download the latest release from the [Release section](https://github.com/pp7803/APIKey/releases):

```
PPAPIKey.h
libPPAPIKey_full.a          # Standard Full (Anti-Hex enabled, VIP3 required)
libPPAPIKey_basic.a         # Standard Basic (no Anti-Hex step)
libPPAPIKey_compat_full.a   # Compat Full (high compatibility, Anti-Hex enabled, VIP3 required)
libPPAPIKey_compat_basic.a  # Compat Basic (high compatibility, no Anti-Hex step)
```

### 3. Account Registration

Create your developer account and obtain your package token:

🔗 **[Register at APIKey Portal](https://v5.ppapikey.xyz)**

---

## Configuration

### Project Setup

Add APIKey to your Theos project's `Makefile`:

```makefile
ARCHS = arm64
TARGET = iphone:clang:latest:14.0

TWEAK_NAME = YourTweak

$(TWEAK_NAME)_FRAMEWORKS = UIKit AVFoundation Foundation SystemConfiguration SafariServices AudioToolbox Accelerate

# Link APIKey library (choose one)
# $(TWEAK_NAME)_LDFLAGS += libPPAPIKey_full.a          # Standard Full (VIP3 required)
$(TWEAK_NAME)_LDFLAGS += libPPAPIKey_basic.a           # Standard Basic (all users)
# $(TWEAK_NAME)_LDFLAGS += libPPAPIKey_compat_full.a   # Compat Full (high compatibility, VIP3)
# $(TWEAK_NAME)_LDFLAGS += libPPAPIKey_compat_basic.a  # Compat Basic (high compatibility)

$(TWEAK_NAME)_CCFLAGS = -std=gnu++17 -Wno-deprecated-declarations -Wno-unused-variable
$(TWEAK_NAME)_FILES = tweak.mm

include $(THEOS_MAKE_PATH)/tweak.mk
```

---

## API Reference

### `PPAPIKey.h` Interface (C Bridge API — v6.2)

`PPAPIKey.h` exposes a clean C bridge compatible with Objective-C, Objective-C++, and C/C++ (with `-fblocks`):

```c
#import <Foundation/Foundation.h>

#ifdef __cplusplus
extern "C" {
#endif

// Set the package authentication token (from APIKey Portal)
void setTokenC(const char *_Nullable token);

// Enable/disable English language mode (1 = English, 0 = Vietnamese)
void setENC(int enable);

// Set the application version (e.g., "1.0")
void setVerC(const char *_Nullable ver);

// Initialize APIKey, validate device/license, and execute block on success
void loadingC(void (^_Nonnull execute)(void));

// Fetch server package data (version supports 1 or 2 only; 2 recommended for API v3 replay protection)
void packageData(int version, void (^_Nonnull completion)(id _Nullable data));

// Retrieve current device & license metadata
const char *getDeviceKeyC(void);   // Current license key
const char *getKeyExpireC(void);   // Key expiration date
const char *getKeyAmountC(void);   // Device slot / remaining quota
const char *getDeviceIDC(void);    // Device UDID / UUID
const char *getAppBundleC(void);   // Bundle identifier

// Key management
void exitKeyC(void (^_Nonnull completion)(BOOL success)); // Remove / logout current key
void copyKeyC(void (^_Nonnull completion)(BOOL success)); // Copy current key to clipboard

#ifdef __cplusplus
}
#endif
```

---

## Usage Notes

- **Keeping string values:** Functions returning `const char *` (`getDeviceKeyC`, `getKeyExpireC`, `getKeyAmountC`, `getDeviceIDC`, `getAppBundleC`) return temporary strings; copy them into an `NSString` or variable if you need to keep them for later use.
- **Initialization order:** Always call `setTokenC`, `setENC`, and `setVerC` **before** calling `loadingC`.
- **`packageData(version, completion)` parameter:** Only `version = 1` (standard) and `version = 2` (recommended — higher security with replay protection) are supported. Any other value is rejected and returns `nil`.
- **Protected execution inside `loadingC`:** In `6.2`, your completion code only runs after token verification passes, the device is confirmed not banned, and integrity checks succeed.

---

## Usage Examples

### Basic Implementation (C Bridge in `tweak.mm`)

```objective-c
#import "YourTweak.h"
#import "PPAPIKey.h"

%hook YourClass

- (void)viewDidLoad {
    %orig;

    setTokenC("your_package_token_here");
    setENC(1);       // 1 = English, 0 = Vietnamese
    setVerC("1.0");

    loadingC(^{
        NSLog(@"[APIKey] Initialized and authenticated successfully");
        // Your code here — menu loading, feature activation, etc.
    });
}

%end
```

### Fetch Package Data (`packageData`)

```objective-c
// version = 1 (standard) or 2 (recommended — API v3 + replay guard)
packageData(2, ^(id _Nullable data) {
    if (data) {
        NSLog(@"[APIKey] Package data: %@", data);
    }
});
```

### Retrieve Device Information

```objective-c
const char *key    = getDeviceKeyC();
const char *expire = getKeyExpireC();
const char *amount = getKeyAmountC();
const char *udid   = getDeviceIDC();
const char *bundle = getAppBundleC();

NSLog(@"Key: %s, Expires: %s, Quota: %s", key, expire, amount);
NSLog(@"Device: %s, Bundle: %s", udid, bundle);
```

### Key Management (`copyKeyC` & `exitKeyC`)

```objective-c
// Copy key to clipboard
copyKeyC(^(BOOL success) {
    NSLog(@"[APIKey] Copy key: %@", success ? @"OK" : @"FAIL");
});

// Remove key (logout)
exitKeyC(^(BOOL success) {
    NSLog(@"[APIKey] Exit key: %@", success ? @"OK" : @"FAIL");
});
```

### Full Tweak Template (`tweak.mm`)

```objective-c
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#include <CoreFoundation/CoreFoundation.h>

#import "PPAPIKey.h"

// ---- Launch detection via CFNotificationCenter ----
static void launch_callback(CFNotificationCenterRef __unused c,
                            void *__unused o,
                            CFStringRef __unused n,
                            const void *__unused obj,
                            CFDictionaryRef __unused ui)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        setTokenC("your_package_token_here");
        setENC(1);
        setVerC("1.0");
        loadingC(^{
            NSLog(@"[APIKey] Ready");
        });
    });
}

__attribute__((constructor))
static void tweak_init(void)
{
    CFNotificationCenterAddObserver(
        CFNotificationCenterGetLocalCenter(),
        NULL,
        launch_callback,
        (CFStringRef)UIApplicationDidFinishLaunchingNotification,
        NULL,
        CFNotificationSuspensionBehaviorDeliverImmediately
    );
}
```

---

## Library Variants

| Code | Edition | File | Best for |
| ---- | ------- | ---- | -------- |
| **B** | Standard Basic | `libPPAPIKey_basic.a` | Standard everyday use — lightweight, easy to integrate, no Anti-Hex step required. |
| **F** | Standard Full | `libPPAPIKey_full.a` | Commercial releases needing maximum protection with Anti-Hex (VIP3 required). |
| **BC** | Compat Basic | `libPPAPIKey_compat_basic.a` | High-compatibility Basic build for projects with custom network setups or protection tools. |
| **FC** | Compat Full | `libPPAPIKey_compat_full.a` | High-compatibility Full build with Anti-Hex protection (VIP3 required). |

> **Security distinction between Basic & Full in 6.2:**
> - **Both Basic (`B`/`BC`) and Full (`F`/`FC`)** include full active runtime defenses: anti-debugging, anti-hooking, proxy detection, automatic tamper reporting, and server-side device banning.
> - **Full (`F`/`FC`)** adds **Anti-Hex** protection to detect direct binary edits or tampering on the compiled file.
> - **Lite has been discontinued** since 6.1.0; migrate older projects to `basic` or `full`.

---

## Anti-Hex App

We provide a dedicated Anti-Hex application available on 3 platforms (macOS, Windows, iOS) to help you secure your tweak built with **Full (`F` / `FC`)**:

### Download

- [PPAPIKey Hash Generator (zip)](https://ppapikey.xyz/PPAPIkeyHashGenerator.zip) — includes `PPAPIKey Hash Generator.dmg`, `PPAPIKey Hash Generator.ipa`, `PPHashGenerator.Windows-win-x64.zip`

<div align="center">

|            macOS             |              Windows               |            iOS             |
| :--------------------------: | :--------------------------------: | :------------------------: |
| ![macOS](AntiHexApp/MAC.png) | ![Windows](AntiHexApp/Windows.png) | ![iOS](AntiHexApp/iOS.png) |

</div>

### Workflow

#### Tool Login Eligibility

| Account | Tool login |
| ------- | ---------- |
| **Admin** | Allowed, regardless of VIP expiration |
| **Active VIP3** | Allowed until VIP expiration |
| **Expired VIP3, VIP1, VIP2, or regular account** | Not allowed |

Login eligibility is enforced by the server. VIP1/VIP2 accounts must upgrade to **VIP3**; expired VIP3 accounts must renew before using the Tool.

#### Anti-Hex Full

1. Download and open the Tool for your platform.
2. Log in with an **active VIP3** or **Admin** account.
3. Load your `Dylib` into the Tool and run **Anti-Hex Full**.

---

## Themes

APIKey 6.2 maintains three independent theme groups. A package may use one style everywhere or choose a different style for each group.

| Group | Where it appears | Options |
| ----- | ---------------- | ------- |
| **CHECKKEY** | Loading, key verification status, and result messages | 13 themes |
| **ENTERKEY** | License-key entry and submission screen | 13 themes + native UIKit (`UIAL`) |
| **EXTENSION** | Get UDID, update prompts, and skip confirmation | 13 themes |

Shared themes: `ANDROID`, `CST`, `GLASS`, `HACKER`, `JG`, `LINUX`, `MAC`, `MBP`, `MINECRAFT`, `NEWYEAR2026`, `PGAM`, `SCL`, and `XP`.

### CHECKKEY

<div align="center">

| | | |
| :---: | :---: | :---: |
| **ANDROID**<br>![ANDROID Check Key](APITheme/CHECKKEY/ANDROID.png) | **CST**<br>![CST Check Key](APITheme/CHECKKEY/CST.png) | **GLASS**<br>![GLASS Check Key](APITheme/CHECKKEY/GLASS.png) |
| **HACKER**<br>![HACKER Check Key](APITheme/CHECKKEY/HACKER.png) | **JG**<br>![JG Check Key](APITheme/CHECKKEY/JG.png) | **LINUX**<br>![LINUX Check Key](APITheme/CHECKKEY/LINUX.png) |
| **MAC**<br>![MAC Check Key](APITheme/CHECKKEY/MAC.png) | **MBP**<br>![MBP Check Key](APITheme/CHECKKEY/MBP.png) | **MINECRAFT**<br>![MINECRAFT Check Key](APITheme/CHECKKEY/MINECRAFT.png) |
| **NEWYEAR2026**<br>![NEWYEAR2026 Check Key](APITheme/CHECKKEY/NEWYEAR2026.png) | **PGAM**<br>![PGAM Check Key](APITheme/CHECKKEY/PGAM.png) | **SCL**<br>![SCL Check Key](APITheme/CHECKKEY/SCL.png) |
| **XP**<br>![XP Check Key](APITheme/CHECKKEY/XP.png) | | |

</div>

### ENTERKEY

Enter Key also offers `UIAL`, a familiar native iOS key-entry screen. Its preview image is named `UIKIT.PNG`.

<div align="center">

| | | |
| :---: | :---: | :---: |
| **ANDROID**<br>![ANDROID Enter Key](APITheme/ENTERKEY/ANDROID.PNG) | **CST**<br>![CST Enter Key](APITheme/ENTERKEY/CST.PNG) | **GLASS**<br>![GLASS Enter Key](APITheme/ENTERKEY/GLASS.PNG) |
| **HACKER**<br>![HACKER Enter Key](APITheme/ENTERKEY/HACKER.PNG) | **JG**<br>![JG Enter Key](APITheme/ENTERKEY/JG.PNG) | **LINUX**<br>![LINUX Enter Key](APITheme/ENTERKEY/LINUX.PNG) |
| **MAC**<br>![MAC Enter Key](APITheme/ENTERKEY/MAC.PNG) | **MBP**<br>![MBP Enter Key](APITheme/ENTERKEY/MBP.PNG) | **MINECRAFT**<br>![MINECRAFT Enter Key](APITheme/ENTERKEY/MINECRAFT.PNG) |
| **NEWYEAR2026**<br>![NEWYEAR2026 Enter Key](APITheme/ENTERKEY/NEWYEAR2026.PNG) | **PGAM**<br>![PGAM Enter Key](APITheme/ENTERKEY/PGAM.PNG) | **SCL**<br>![SCL Enter Key](APITheme/ENTERKEY/SCL.PNG) |
| **XP**<br>![XP Enter Key](APITheme/ENTERKEY/XP.PNG) | **UIAL / UIKit**<br>![UIKit Enter Key](APITheme/ENTERKEY/UIKIT.PNG) | |

</div>

### EXTENSION

Extension covers Get UDID, update prompts, and skip confirmation. When no separate option is selected, it follows the Check Key theme.

<div align="center">

| | | |
| :---: | :---: | :---: |
| **ANDROID**<br>![ANDROID Extension](APITheme/EXTENSION/ANDROID.PNG) | **CST**<br>![CST Extension](APITheme/EXTENSION/CST.PNG) | **GLASS**<br>![GLASS Extension](APITheme/EXTENSION/GLASS.PNG) |
| **HACKER**<br>![HACKER Extension](APITheme/EXTENSION/HACKER.PNG) | **JG**<br>![JG Extension](APITheme/EXTENSION/JG.PNG) | **LINUX**<br>![LINUX Extension](APITheme/EXTENSION/LINUX.PNG) |
| **MAC**<br>![MAC Extension](APITheme/EXTENSION/MAC.PNG) | **MBP**<br>![MBP Extension](APITheme/EXTENSION/MBP.PNG) | **MINECRAFT**<br>![MINECRAFT Extension](APITheme/EXTENSION/MINECRAFT.PNG) |
| **NEWYEAR2026**<br>![NEWYEAR2026 Extension](APITheme/EXTENSION/NEWYEAR2026.PNG) | **PGAM**<br>![PGAM Extension](APITheme/EXTENSION/PGAM.PNG) | **SCL**<br>![SCL Extension](APITheme/EXTENSION/SCL.PNG) |
| **XP**<br>![XP Extension](APITheme/EXTENSION/XP.PNG) | | |

</div>

---

## Support

| Channel | Contact |
| ------- | ------- |
| **Developer portal** | [v5.ppapikey.xyz](https://v5.ppapikey.xyz) |
| **Telegram** | [@pdp7803](https://t.me/pdp7803) |
| **Email** | duyphatpham783@gmail.com |

For package configuration, Auto-Ban toggles, theme selection, and Anti-Hex setup, use the Web Portal dashboard or Mobile App.

---

## License & Copyright

```
Copyright © 2024–2026 Phat Pham (@pdp7803). All rights reserved.
```

### Best Practices

1. **Disable Auto-Ban** in package settings during internal testing to avoid banning your own test devices, and re-enable it for public releases.
2. **Keep APIKey updated** to receive the latest security patches and compatibility fixes.

---

## <a name="changelog"></a>Changelog

<details open>
<summary><strong>v6.2.0</strong> — Active Defense, Server Auto-Ban & Refreshed Audio</summary>

**Builds:** `PPAPIKey 6.2B` · `PPAPIKey 6.2F` · `PPAPIKey 6.2BC` · `PPAPIKey 6.2FC`

| Area | Changes |
| ---- | ------- |
| **Pure C API (`PPAPIKey.h`)** | Removed the legacy Objective-C wrapper (`[PPAPIKey shared]`, `setToken:`, `loading:`, etc.) to prevent function spoofing; standardized all calls on pure C functions (`setTokenC`, `loadingC`, `packageData`, …). |
| **v3 Security & Execution Protection** | Upgraded `loading`, `key`, `package`, and `packagedata` to encrypted transport with anti-replay protection; blocked attempts to bypass verification and hardened offline license protection. |
| **Automatic Tamper Reporting** | When tampering is detected (hooks, debuggers, verification bypass, packet-sniffing proxies, or file edits on Full builds), the library silently sends an encrypted report to the server before closing the app. |
| **Server Auto-Ban** | The server automatically bans offending devices, revokes related keys, and saves detailed incident history. Added a per-package **Auto-Ban** toggle on the Web Portal and Mobile App. |
| **Real-Time Device Blocking** | Enforces device bans during key checks and pushes instant lock commands to active apps. |
| **Refreshed Audio & Fixes** | Updated loading (2s), success (1s), and failure (1s) sound effects; fixed split-packet server response handling across all variants. |
| **Expanded Compatibility** | Full support for `arm64` and `arm64e` across all 4 variants (`B`, `F`, `BC`, and `FC`). |

</details>

<details>
<summary><strong>v6.1.0</strong> — Complete themes & Custom builds</summary>

**Builds:** `PPAPIKey 6.1.0B` · `PPAPIKey 6.1.0F` · `PPAPIKey 6.1.0BC` · `PPAPIKey 6.1.0FC`

| Area | Changes |
| ---- | ------- |
| **Themes** | Completed Check Key, Enter Key, and Extension groups across 13 styles; Enter Key also includes UIKit (`UIAL`) |
| **Interface** | Refreshed layouts, backgrounds, card corners, Dark Mode colors, and support for different screen sizes |
| **Distribution** | Added Custom Basic (`BC`) and Custom Full (`FC`) alongside standard Basic (`B`) and Full (`F`) |
| **Stability** | Improved transitions between loading, Get UDID, key entry, update prompts, and result messages |

</details>

<details>
<summary><strong>v6.0.5</strong> — UI Bug Fixes</summary>

**Build:** `PPAPIKey 6.0.5B` · `PPAPIKey 6.0.5F`

| Area | Changes |
| ---- | ------- |
| **UI Fixes** | Re-centered Loading HUD under `pp_isHide`; resolved dim background leak blocking touches on modal transition; fixed offline dialog collisions; eliminated device info alert flickering |

</details>

<details>
<summary><strong>v6.0.4</strong> — Glass UI refinement & audio policy</summary>

**Build:** `PPAPIKey 6.0.4B` · `PPAPIKey 6.0.4F`

| Area | Changes |
| ---- | ------- |
| **UI · Glass** | Full-screen blur; direct-on-background layout; purple OK; FA icons; moto countdown; loading/alert spacing |
| **Audio** | Removed `enterkey_showing` and `getudid_showing`; haptic retained |
| **Docs** | Single canonical README |

</details>

<details>
<summary><strong>v6.0.3</strong> — UDID system & PGAM enter-key</summary>

**Build:** `PPAPIKey 6.0.3B` · `PPAPIKey 6.0.3F`

> **Migration:** UDID/UUID system changed. **Clean reinstall** recommended when upgrading from earlier builds.

| Area | Changes |
| ---- | ------- |
| **UI** | Dedicated Get UDID interface · **PGAM** enter-key theme |
| **Audio** | Interface appearance sounds added |
| **Security** | Anti-crack defense layer |
| **Fix** | Overlay covering app screen on `.tipa` install · removed global background blur |

</details>

<details>
<summary><strong>v6.0.2</strong> — Enter-key themes & performance</summary>

**Build:** `PPAPIKey 6.0.2B` · `PPAPIKey 6.0.2F`

- Redesigned enter-key and verification alerts across all themes
- New enter-key engines: **UIAL** (native alert) and **GLASS** (Liquid Glass)
- Fixed encryption-related CPU overheating
- UUID/UDID retrieval bug fixes

</details>

<details>
<summary><strong>v6.0.1</strong> — Per-theme HUD polish</summary>

**Build:** `PPAPIKey 6.0.1B` · `PPAPIKey 6.0.1F`

- **CST** — Accent bar respects card corner radius
- **JG / MBP** — Logo-centered loading ring animation
- **SCL** — Custom overlay HUD; seamless loading → alert transition
- **Minecraft** — Pixel dim only; transparent text panels
- **Glass** — Initial centered HUD card layout

</details>

<details>
<summary><strong>v6.0.0</strong> — Major rewrite</summary>

- Decoupled tweak / core architecture · C Bridge API
- API rename: `shared`, `setToken:`, `getDeviceKey`, `getDeviceID`, …
- Dual library (`basic` / `full`) · independent toast system
- Minimum iOS **14.0** · **gnu++17**

</details>

---

<div align="center">

<br>

**APIKey** · License Authentication & Active Defense Framework for iOS

Developed by [Phat Pham](https://t.me/pdp7803) · [Portal](https://v5.ppapikey.xyz) · [Releases](https://github.com/pp7803/APIKey/releases)

**[↑ Back to top](#apikey-62)**

</div>
