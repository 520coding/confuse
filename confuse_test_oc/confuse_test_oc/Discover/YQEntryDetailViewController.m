//
//  YQEntryDetailViewController.m
//  confuse_test_oc
//

#import "YQEntryDetailViewController.h"
#import "YQDiscoverItem.h"
#import "YQMacros.h"
#import <Masonry/Masonry.h>

@interface YQEntryDetailViewController ()
@property (nonatomic, strong) YQDiscoverItem *item;
@property (nonatomic, strong) UIImageView    *iconView;
@property (nonatomic, strong) UILabel        *titleLabel;
@property (nonatomic, strong) UILabel        *detailLabel;
@property (nonatomic, strong) UILabel        *codeLabel;
@property (nonatomic, strong) UIButton       *actionButton;
@end

@implementation YQEntryDetailViewController

- (instancetype)initWithItem:(YQDiscoverItem *)item {
    self = [super initWithNibName:nil bundle:nil];
    if (self) { _item = item; }
    return self;
}

- (void)setupUI {
    self.title = self.item.title;
    self.view.backgroundColor = [UIColor whiteColor];

    self.iconView = [[UIImageView alloc] init];
    self.iconView.contentMode = UIViewContentModeScaleAspectFit;
    self.iconView.tintColor = YQThemeColor;
    self.iconView.image = [UIImage systemImageNamed:self.item.iconName];
    [self.view addSubview:self.iconView];

    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:22];
    self.titleLabel.textColor = YQTextColor;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.text = self.item.title;
    [self.view addSubview:self.titleLabel];

    self.detailLabel = [[UILabel alloc] init];
    self.detailLabel.font = [UIFont systemFontOfSize:15];
    self.detailLabel.textColor = YQSubTextColor;
    self.detailLabel.numberOfLines = 0;
    self.detailLabel.textAlignment = NSTextAlignmentCenter;
    self.detailLabel.text = self.item.detailText;
    [self.view addSubview:self.detailLabel];

    BOOL hasCode = self.item.code.length > 0;
    if (hasCode) {
        self.codeLabel = [[UILabel alloc] init];
        self.codeLabel.font = [UIFont boldSystemFontOfSize:18];
        self.codeLabel.textColor = YQThemeColor;
        self.codeLabel.textAlignment = NSTextAlignmentCenter;
        self.codeLabel.backgroundColor = YQHexColor(0xFFEDE6);
        self.codeLabel.layer.cornerRadius = 8;
        self.codeLabel.clipsToBounds = YES;
        self.codeLabel.text = self.item.code;
        [self.view addSubview:self.codeLabel];
    }

    self.actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.actionButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    self.actionButton.backgroundColor = YQThemeColor;
    [self.actionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.actionButton.layer.cornerRadius = 24;
    NSString *btnTitle = hasCode ? (self.item.actionTitle ?: YQLocalized(@"other_copy")) : YQLocalized(@"other_try_now");
    [self.actionButton setTitle:btnTitle forState:UIControlStateNormal];
    [self.actionButton addTarget:self action:@selector(onTapAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.actionButton];

    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(48);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(72, 72));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconView.mas_bottom).offset(20);
        make.left.equalTo(self.view).offset(24);
        make.right.equalTo(self.view).offset(-24);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(12);
        make.left.right.equalTo(self.titleLabel);
    }];
    if (hasCode) {
        [self.codeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.detailLabel.mas_bottom).offset(24);
            make.centerX.equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(200, 44));
        }];
    }
    [self.actionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(40);
        make.right.equalTo(self.view).offset(-40);
        make.height.mas_equalTo(48);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-40);
    }];
}

- (void)onTapAction {
    if (self.item.code.length > 0) {
        [UIPasteboard generalPasteboard].string = self.item.code;
        [self showMessage:YQLocalized(@"other_copied")];
    } else {
        [self showMessage:YQLocalized(@"common_coming_soon")];
    }
}

@end
