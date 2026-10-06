//
//  YQDiscoverItem.h
//  confuse_test_oc
//
//  「其他」页功能入口模型（按 route 路由到不同真实二级页）
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, YQEntryRoute) {
    YQEntryRouteList = 0,   // 列表页（消息/排行榜/专题/历史/更多）
    YQEntryRouteScan,       // 扫一扫
    YQEntryRouteDetail,     // 参数化详情（邀请/客服，带可复制的码）
};

@interface YQDiscoverItem : NSObject

@property (nonatomic, copy)           NSString    *title;
@property (nonatomic, copy)           NSString    *iconName;
@property (nonatomic, assign)         YQEntryRoute route;

// Detail 用
@property (nonatomic, copy, nullable) NSString *detailText;
@property (nonatomic, copy, nullable) NSString *code;         // 可复制的码
@property (nonatomic, copy, nullable) NSString *actionTitle;    // 复制按钮文案

// List 用：每行 @{ @"icon":, @"title":, @"subtitle": }
@property (nonatomic, copy, nullable) NSArray<NSDictionary *> *rows;

+ (NSArray<YQDiscoverItem *> *)allItems;

@end

NS_ASSUME_NONNULL_END
