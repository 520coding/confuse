//
//  YQSettingItem.h
//  confuse_test_oc
//
//  「我的」页设置项模型
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, YQSettingType) {
    YQSettingTypeFavorites = 0,   // 我的收藏
    YQSettingTypeHistory,         // 浏览历史
    YQSettingTypeGeneral,         // 通用设置
    YQSettingTypeAbout,           // 关于我们
    YQSettingTypeClearCache,      // 清除缓存
    YQSettingTypeLogout,          // 退出登录
};

@interface YQSettingItem : NSObject

@property (nonatomic, copy)   NSString *title;
@property (nonatomic, copy)   NSString *iconName;   // SF Symbol 名
@property (nonatomic, assign) YQSettingType type;

+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)iconName type:(YQSettingType)type;

/// 分组数据源
+ (NSArray<NSArray<YQSettingItem *> *> *)sections;

@end

NS_ASSUME_NONNULL_END
