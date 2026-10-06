//
//  YQBaseViewController.m
//  confuse_test_oc
//

#import "YQBaseViewController.h"
#import "YQMacros.h"
#import <Masonry/Masonry.h>

@implementation YQBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = YQBackgroundColor;
    // 资源色（Assets 里的 "Color" 色板），取不到时回退主题色
    UIColor *tint = [UIColor colorNamed:@"Color"] ?: YQThemeColor;
    self.navigationController.navigationBar.tintColor = tint;
    [self setupUI];
    [self loadData];
}

- (void)setupUI  { /* 子类实现 */ }
- (void)loadData { /* 子类实现 */ }

- (void)showMessage:(NSString *)message {
    [self showMessage:message duration:1.5];
}

- (void)showMessage:(NSString *)message duration:(NSTimeInterval)duration {
    if (message.length == 0) { return; }

    UILabel *toast = [[UILabel alloc] init];
    toast.text               = message;
    toast.textColor          = [UIColor whiteColor];
    toast.font               = [UIFont systemFontOfSize:14];
    toast.textAlignment      = NSTextAlignmentCenter;
    toast.numberOfLines      = 0;
    toast.backgroundColor    = YQRGBA(0, 0, 0, 0.75);
    toast.layer.cornerRadius = 8;
    toast.clipsToBounds      = YES;
    [self.view addSubview:toast];

    [toast mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.left.greaterThanOrEqualTo(self.view).offset(40);
        make.right.lessThanOrEqualTo(self.view).offset(-40);
        make.height.mas_greaterThanOrEqualTo(40);
    }];

    YQWeakSelf(toast);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
        YQStrongSelf(toast);
        [toast removeFromSuperview];
    });
}

@end
