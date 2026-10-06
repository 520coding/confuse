//
//  YQFeedCell.m
//  confuse_test_oc
//

#import "YQFeedCell.h"
#import "YQFeedItem.h"
#import "YQMacros.h"

// Cell 布局度量（struct + typedef）
typedef struct YQFeedCellMetrics {
    CGFloat coverSize;
    CGFloat padding;
} YQFeedCellMetrics;

static YQFeedCellMetrics const kYQFeedCellMetrics = { 56.0, 12.0 };

@interface YQFeedCell ()

@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UILabel     *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel     *summaryLabel;
@property (weak, nonatomic) IBOutlet UIButton    *likeButton;

@property (nonatomic, strong) YQFeedItem *item;

@end

@implementation YQFeedCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.coverImageView.layer.cornerRadius = 6;
    self.coverImageView.clipsToBounds      = YES;
    self.coverImageView.backgroundColor    = YQBackgroundColor;
    self.titleLabel.font       = [UIFont boldSystemFontOfSize:16];
    self.titleLabel.textColor  = YQTextColor;
    self.titleLabel.numberOfLines = 2;
    self.summaryLabel.font      = [UIFont systemFontOfSize:13];
    self.summaryLabel.textColor = YQSubTextColor;
    self.summaryLabel.numberOfLines = 2;
    self.likeButton.titleLabel.font = [UIFont systemFontOfSize:13];
    YQLog(@"feed cell awake, coverSize=%.0f padding=%.0f", kYQFeedCellMetrics.coverSize, kYQFeedCellMetrics.padding);
}

- (void)configureWithItem:(YQFeedItem *)item {
    self.item = item;
    self.titleLabel.text      = item.title;
    self.summaryLabel.text    = item.summary;
    self.coverImageView.image = [UIImage imageNamed:item.coverImageName];
    [self refreshLikeButton];
}

- (void)refreshLikeButton {
    NSString *heart = self.item.isFavorited ? @"♥" : @"♡";
    NSString *title = [NSString stringWithFormat:@"%@ %ld", heart, (long)self.item.likeCount];
    [self.likeButton setTitle:title forState:UIControlStateNormal];
    [self.likeButton setTitleColor:(self.item.isFavorited ? YQThemeColor : YQSubTextColor)
                          forState:UIControlStateNormal];
}

- (IBAction)onTapFavorite:(UIButton *)sender {
    self.item.favorited  = !self.item.isFavorited;
    self.item.likeCount += self.item.isFavorited ? 1 : -1;
    [self refreshLikeButton];

    if (self.onFavoriteTapped) {
        self.onFavoriteTapped();
    }
    if ([self.delegate respondsToSelector:@selector(feedCell:didTapFavorite:)]) {
        [self.delegate feedCell:self didTapFavorite:self.item];
    }
}

- (void)prepareForReuse {
    [super prepareForReuse];   // 系统方法重写，混淆时不可改名
    self.coverImageView.image = nil;
    self.titleLabel.text      = nil;
    self.summaryLabel.text    = nil;
}

@end
