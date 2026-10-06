//
//  YQDiscoverCell.m
//  confuse_test_oc
//

#import "YQDiscoverCell.h"
#import "YQMacros.h"
#import <Masonry/Masonry.h>

@interface YQDiscoverCell ()
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel     *titleLabel;
@end

@implementation YQDiscoverCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.contentView.layer.cornerRadius = 10;

        self.iconView = [[UIImageView alloc] init];
        self.iconView.contentMode = UIViewContentModeScaleAspectFit;
        self.iconView.tintColor = YQThemeColor;
        [self.contentView addSubview:self.iconView];

        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        self.titleLabel.textColor = YQTextColor;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.titleLabel];

        [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(self.contentView).offset(18);
            make.size.mas_equalTo(CGSizeMake(32, 32));
        }];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconView.mas_bottom).offset(10);
            make.left.right.equalTo(self.contentView);
        }];
    }
    return self;
}

- (void)configureWithIcon:(NSString *)iconName title:(NSString *)title {
    self.iconView.image = [UIImage systemImageNamed:iconName];
    self.titleLabel.text = title;
}

@end
