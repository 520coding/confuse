//
//  YQMacros.h
//  confuse_test_oc
//
//  一起读 App —— 全局宏定义（颜色 / 本地化 / 日志 / weak-self）
//

#ifndef YQMacros_h
#define YQMacros_h

#import <UIKit/UIKit.h>

#pragma mark - 屏幕

#define kYQScreenWidth   ([UIScreen mainScreen].bounds.size.width)
#define kYQScreenHeight  ([UIScreen mainScreen].bounds.size.height)

#pragma mark - 颜色

#define YQRGBA(r, g, b, a)  [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define YQRGB(r, g, b)      YQRGBA(r, g, b, 1.0)
#define YQHexColor(hex)     [UIColor yq_colorWithHex:(hex)]

#define YQThemeColor        YQHexColor(0xFF6034)
#define YQBackgroundColor   YQHexColor(0xF5F6F8)
#define YQTextColor         YQHexColor(0x1A1A1A)
#define YQSubTextColor      YQHexColor(0x9B9B9B)

#pragma mark - 本地化

#define YQLocalized(key)    NSLocalizedString((key), nil)

#pragma mark - 日志

#ifdef DEBUG
#define YQLog(fmt, ...)     NSLog((@"[YQ] " fmt), ##__VA_ARGS__)
#else
#define YQLog(fmt, ...)
#endif

#pragma mark - weak / strong self

#define YQWeakSelf(obj)     __weak   typeof(obj) weak_##obj = obj;
#define YQStrongSelf(obj)   __strong typeof(weak_##obj) obj = weak_##obj;

#endif /* YQMacros_h */
