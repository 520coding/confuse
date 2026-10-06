//
//  YQProfileHeaderView.h
//  confuse_test_oc
//
//  「我的」页顶部用户信息卡
//

#import <UIKit/UIKit.h>

@class YQUser;

NS_ASSUME_NONNULL_BEGIN

@interface YQProfileHeaderView : UIView

- (void)configureWithUser:(nullable YQUser *)user;

@end

NS_ASSUME_NONNULL_END
