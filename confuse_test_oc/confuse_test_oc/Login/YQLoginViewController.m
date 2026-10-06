//
//  YQLoginViewController.m
//  confuse_test_oc
//

#import "YQLoginViewController.h"
#import "YQUserSession.h"
#import "YQUser.h"
#import "YQMacros.h"
#import "NSString+YQAdd.h"
#import <Masonry/Masonry.h>

@interface YQLoginViewController ()

@property (nonatomic, strong) UIImageView *logoView;
@property (nonatomic, strong) UITextField *usernameField;
@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic, strong) UIButton    *loginButton;

@end

@implementation YQLoginViewController

- (void)setupUI {
    self.title = YQLocalized(@"login_title");
    self.view.backgroundColor = [UIColor whiteColor];

    self.logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"oc"]];
    self.logoView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.logoView];

    self.usernameField = [self textFieldWithPlaceholder:YQLocalized(@"login_username")];
    self.passwordField = [self textFieldWithPlaceholder:YQLocalized(@"login_password")];
    self.passwordField.secureTextEntry = YES;
    [self.view addSubview:self.usernameField];
    [self.view addSubview:self.passwordField];

    self.loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.loginButton setTitle:YQLocalized(@"login_button") forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.loginButton.titleLabel.font   = [UIFont boldSystemFontOfSize:17];
    self.loginButton.backgroundColor   = YQThemeColor;
    self.loginButton.layer.cornerRadius = 24;
    [self.loginButton addTarget:self action:@selector(didTapLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginButton];

    [self.logoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(120);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(96, 96));
    }];
    [self.usernameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.logoView.mas_bottom).offset(48);
        make.left.equalTo(self.view).offset(32);
        make.right.equalTo(self.view).offset(-32);
        make.height.mas_equalTo(48);
    }];
    [self.passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.usernameField.mas_bottom).offset(16);
        make.left.right.height.equalTo(self.usernameField);
    }];
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordField.mas_bottom).offset(40);
        make.left.right.equalTo(self.usernameField);
        make.height.mas_equalTo(48);
    }];
}

- (UITextField *)textFieldWithPlaceholder:(NSString *)placeholder {
    UITextField *field = [[UITextField alloc] init];
    field.placeholder      = placeholder;
    field.borderStyle      = UITextBorderStyleRoundedRect;
    field.font             = [UIFont systemFontOfSize:16];
    field.clearButtonMode  = UITextFieldViewModeWhileEditing;
    return field;
}

#pragma mark - Action

- (void)didTapLogin {
    NSString *username = [self.usernameField.text yq_trimmed];
    NSString *password = self.passwordField.text;

    if ([username yq_isBlank] || [password yq_isBlank]) {
        [self showMessage:YQLocalized(@"login_empty_tip")];
        return;
    }

    YQUser *user = [[YQUser alloc] initWithID:username token:@"mock-token-2026"];
    user.firstName = username;
    user.vip       = username.length > 6;

    // 登录成功后由 AppDelegate 监听通知切换到主框架（TabBar）
    [[YQUserSession sharedSession] loginWithUser:user];
}

@end
