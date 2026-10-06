//
//  YQFeedDetailViewController.m
//  confuse_test_oc
//

#import "YQFeedDetailViewController.h"
#import "YQFeedItem.h"
#import "YQConst.h"
#import "YQMacros.h"
#import "UIButton+YQBadge.h"
#import <Masonry/Masonry.h>

static void *kYQLikeCountContext = &kYQLikeCountContext;

@interface YQFeedDetailViewController ()
@property (nonatomic, strong) YQFeedItem  *item;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView       *contentContainer;
@property (nonatomic, strong) UIImageView  *coverView;
@property (nonatomic, strong) UILabel      *titleLabel;
@property (nonatomic, strong) UIImageView  *avatarView;
@property (nonatomic, strong) UILabel      *authorLabel;
@property (nonatomic, strong) UILabel      *statsLabel;
@property (nonatomic, strong) UIView       *tagsContainer;
@property (nonatomic, strong) UILabel      *contentLabel;
@property (nonatomic, strong) UIButton     *favoriteButton;
@end

@implementation YQFeedDetailViewController

- (instancetype)initWithItem:(YQFeedItem *)item {
    self = [super initWithNibName:nil bundle:nil];
    if (self) { _item = item; }
    return self;
}

- (void)setupUI {
    self.title = YQLocalized(@"detail_title");
    self.view.backgroundColor = [UIColor whiteColor];
    [self buildFavoriteBar];
    [self buildScrollContent];
    [self layout];
    [self refreshFavoriteButton];
    [self.item addObserver:self forKeyPath:NSStringFromSelector(@selector(likeCount)) options:NSKeyValueObservingOptionNew context:kYQLikeCountContext];
}

- (void)buildFavoriteBar {
    self.favoriteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.favoriteButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    self.favoriteButton.layer.cornerRadius = 22;
    [self.favoriteButton addTarget:self action:@selector(toggleFavorite) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.favoriteButton];
}

- (void)buildScrollContent {
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.alwaysBounceVertical = YES;
    [self.view addSubview:self.scrollView];

    self.contentContainer = [[UIView alloc] init];
    [self.scrollView addSubview:self.contentContainer];

    self.coverView = [[UIImageView alloc] init];
    self.coverView.contentMode  = UIViewContentModeScaleAspectFill;
    self.coverView.clipsToBounds = YES;
    self.coverView.image = [UIImage imageNamed:self.item.coverImageName];
    [self.contentContainer addSubview:self.coverView];

    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:22];
    self.titleLabel.textColor = YQTextColor;
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.text = self.item.title;
    [self.contentContainer addSubview:self.titleLabel];

    self.avatarView = [[UIImageView alloc] init];
    self.avatarView.layer.cornerRadius = 16;
    self.avatarView.clipsToBounds = YES;
    self.avatarView.image = [UIImage imageNamed:self.item.author.avatarName ?: @"hashiqi"];
    [self.contentContainer addSubview:self.avatarView];

    self.authorLabel = [[UILabel alloc] init];
    self.authorLabel.font = [UIFont systemFontOfSize:14];
    self.authorLabel.textColor = YQTextColor;
    self.authorLabel.text = [NSString stringWithFormat:@"%@ · %@", self.item.author.name ?: @"匿名", self.item.publishTimeText];
    [self.contentContainer addSubview:self.authorLabel];

    self.statsLabel = [[UILabel alloc] init];
    self.statsLabel.font = [UIFont systemFontOfSize:13];
    self.statsLabel.textColor = YQSubTextColor;
    self.statsLabel.text = [NSString stringWithFormat:YQLocalized(@"detail_stats_fmt"), (long)self.item.readCount, (long)self.item.likeCount, (long)self.item.commentCount];
    [self.contentContainer addSubview:self.statsLabel];

    self.tagsContainer = [[UIView alloc] init];
    [self.contentContainer addSubview:self.tagsContainer];
    [self buildTagChips];

    self.contentLabel = [[UILabel alloc] init];
    self.contentLabel.font = [UIFont systemFontOfSize:16];
    self.contentLabel.textColor = YQTextColor;
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.text = self.item.content.length ? self.item.content : self.item.summary;
    [self.contentContainer addSubview:self.contentLabel];
}

- (void)buildTagChips {
    UIView *prev = nil;
    for (NSString *tag in self.item.tags) {
        UILabel *chip = [[UILabel alloc] init];
        chip.text = [NSString stringWithFormat:@"  %@  ", tag];
        chip.font = [UIFont systemFontOfSize:12];
        chip.textColor = YQThemeColor;
        chip.backgroundColor = YQHexColor(0xFFEDE6);
        chip.layer.cornerRadius = 11;
        chip.clipsToBounds = YES;
        [self.tagsContainer addSubview:chip];
        [chip mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self.tagsContainer);
            make.height.mas_equalTo(22);
            if (prev) { make.left.equalTo(prev.mas_right).offset(8); }
            else { make.left.equalTo(self.tagsContainer); }
        }];
        prev = chip;
    }
    if (prev) {
        [prev mas_makeConstraints:^(MASConstraintMaker *make) { make.right.lessThanOrEqualTo(self.tagsContainer); }];
    }
}

- (void)layout {
    [self.favoriteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(16);
        make.right.equalTo(self.view).offset(-16);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-16);
        make.height.mas_equalTo(44);
    }];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.favoriteButton.mas_top).offset(-12);
    }];
    [self.contentContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
    CGFloat pad = 16;
    [self.coverView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.contentContainer);
        make.height.mas_equalTo(200);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.coverView.mas_bottom).offset(pad);
        make.left.equalTo(self.contentContainer).offset(pad);
        make.right.equalTo(self.contentContainer).offset(-pad);
    }];
    [self.avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(pad);
        make.left.equalTo(self.titleLabel);
        make.size.mas_equalTo(CGSizeMake(32, 32));
    }];
    [self.authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.avatarView);
        make.left.equalTo(self.avatarView.mas_right).offset(8);
        make.right.lessThanOrEqualTo(self.titleLabel);
    }];
    [self.statsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.avatarView.mas_bottom).offset(12);
        make.left.right.equalTo(self.titleLabel);
    }];
    [self.tagsContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.statsLabel.mas_bottom).offset(12);
        make.left.right.equalTo(self.titleLabel);
        make.height.mas_equalTo(22);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tagsContainer.mas_bottom).offset(16);
        make.left.right.equalTo(self.titleLabel);
        make.bottom.equalTo(self.contentContainer).offset(-24);
    }];
}

- (void)toggleFavorite {
    self.item.favorited  = !self.item.isFavorited;
    self.item.likeCount += self.item.isFavorited ? 1 : -1;
    [self refreshFavoriteButton];
    [[NSNotificationCenter defaultCenter] postNotificationName:YQFeedFavoriteChangedNotification object:self.item
                                                      userInfo:@{ @"itemID": self.item.itemID ?: @"", @"favorited": @(self.item.isFavorited) }];
}

- (void)refreshFavoriteButton {
    BOOL faved = self.item.isFavorited;
    self.favoriteButton.backgroundColor = faved ? YQThemeColor : YQBackgroundColor;
    [self.favoriteButton setTitleColor:(faved ? [UIColor whiteColor] : YQTextColor) forState:UIControlStateNormal];
    [self.favoriteButton setTitle:(faved ? YQLocalized(@"detail_favorited") : YQLocalized(@"detail_favorite")) forState:UIControlStateNormal];
    self.favoriteButton.yq_badgeValue     = self.item.likeCount > 0 ? [NSString stringWithFormat:@"%ld", (long)self.item.likeCount] : nil;
    self.favoriteButton.yq_highlightStyle = faved;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if (context == kYQLikeCountContext) {
        YQLog(@"likeCount changed -> %@", change[NSKeyValueChangeNewKey]);
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)dealloc {
    [self.item removeObserver:self forKeyPath:NSStringFromSelector(@selector(likeCount)) context:kYQLikeCountContext];
}

@end
