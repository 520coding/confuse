//
//  YQProfileHeaderView.m
//  confuse_test_oc
//

#import "YQProfileHeaderView.h"
#import "YQUser.h"
#import "YQMacros.h"
#import <Masonry/Masonry.h>

@interface YQProfileHeaderView ()
@property (nonatomic, strong) UIImageView *avatarView;
@property (nonatomic, strong) UILabel     *nameLabel;
@property (nonatomic, strong) UILabel     *vipLabel;
@end

@implementation YQProfileHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = YQThemeColor;
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    self.avatarView = [[UIImageView alloc] init];
    self.avatarView.layer.cornerRadius = 32;
    self.avatarView.clipsToBounds = YES;
    self.avatarView.layer.borderWidth = 2;
    self.avatarView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.avatarView.image = [UIImage imageNamed:@"hashiqi"];
    [self addSubview:self.avatarView];

    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.font = [UIFont boldSystemFontOfSize:20];
    self.nameLabel.textColor = [UIColor whiteColor];
    [self addSubview:self.nameLabel];

    self.vipLabel = [[UILabel alloc] init];
    self.vipLabel.font = [UIFont systemFontOfSize:12];
    self.vipLabel.textColor = YQThemeColor;
    self.vipLabel.backgroundColor = [UIColor whiteColor];
    self.vipLabel.textAlignment = NSTextAlignmentCenter;
    self.vipLabel.layer.cornerRadius = 8;
    self.vipLabel.clipsToBounds = YES;
    [self addSubview:self.vipLabel];

    [self.avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.bottom.equalTo(self).offset(-20);
        make.size.mas_equalTo(CGSizeMake(64, 64));
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarView.mas_right).offset(16);
        make.top.equalTo(self.avatarView).offset(8);
    }];
    [self.vipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(8);
        make.size.mas_equalTo(CGSizeMake(52, 20));
    }];
}

- (void)configureWithUser:(YQUser *)user {
    self.nameLabel.text = user.displayName ?: YQLocalized(@"mine_guest");
    self.vipLabel.hidden = !user.isVip;
    self.vipLabel.text = @"VIP";
}

@end
