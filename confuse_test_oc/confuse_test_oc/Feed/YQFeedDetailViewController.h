//
//  YQFeedDetailViewController.h
//  confuse_test_oc
//

#import "YQBaseViewController.h"

@class YQFeedItem;

NS_ASSUME_NONNULL_BEGIN

@interface YQFeedDetailViewController : YQBaseViewController

- (instancetype)initWithItem:(YQFeedItem *)item;

@end

NS_ASSUME_NONNULL_END
