//
//  YQFeedCell.h
//  confuse_test_oc
//
//  资讯流 Cell（xib 加载）
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class YQFeedItem, YQFeedCell;

@protocol YQFeedCellDelegate <NSObject>
- (void)feedCell:(YQFeedCell *)cell didTapFavorite:(nullable YQFeedItem *)item;
@end

@interface YQFeedCell : UITableViewCell

@property (nonatomic, weak, nullable) id<YQFeedCellDelegate> delegate;

/// 收藏点击回调（block 属性）
@property (nonatomic, copy, nullable) void (^onFavoriteTapped)(void);

- (void)configureWithItem:(YQFeedItem *)item;

@end

NS_ASSUME_NONNULL_END
