//
//  YQConst.h
//  confuse_test_oc
//
//  全局常量：接口地址、通知名、分页大小
//

#import <Foundation/Foundation.h>

/// 接口根地址
UIKIT_EXTERN NSString * const YQAPIBaseURL;

/// 登录成功通知
UIKIT_EXTERN NSString * const YQLoginSuccessNotification;

/// 退出登录通知
UIKIT_EXTERN NSString * const YQLogoutNotification;

/// 收藏状态变化通知（userInfo 携带 itemID / favorited）
UIKIT_EXTERN NSString * const YQFeedFavoriteChangedNotification;

/// 每页条数
UIKIT_EXTERN NSInteger const YQFeedPageSize;
