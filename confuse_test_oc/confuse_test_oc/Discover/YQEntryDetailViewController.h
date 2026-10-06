//
//  YQEntryDetailViewController.h
//  confuse_test_oc
//

#import "YQBaseViewController.h"

@class YQDiscoverItem;

NS_ASSUME_NONNULL_BEGIN

@interface YQEntryDetailViewController : YQBaseViewController
- (instancetype)initWithItem:(YQDiscoverItem *)item;
@end

NS_ASSUME_NONNULL_END
