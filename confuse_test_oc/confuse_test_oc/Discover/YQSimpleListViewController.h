//
//  YQSimpleListViewController.h
//  confuse_test_oc
//
//  通用列表页（消息/排行榜/专题/历史/更多 共用）
//

#import "YQBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface YQSimpleListViewController : YQBaseViewController

- (instancetype)initWithTitle:(NSString *)title rows:(NSArray<NSDictionary *> *)rows;

@end

NS_ASSUME_NONNULL_END
