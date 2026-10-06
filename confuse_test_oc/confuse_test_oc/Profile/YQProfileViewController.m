//
//  YQProfileViewController.m
//  confuse_test_oc
//

#import "YQProfileViewController.h"
#import "YQProfileHeaderView.h"
#import "YQSettingItem.h"
#import "YQUserSession.h"
#import "YQConst.h"
#import "YQMacros.h"
#import <confuse_sdk/confuse_sdk.h>

static NSString * const kYQSettingCellID = @"kYQSettingCellID";
static NSString * const kYQAboutURL      = @"https://github.com/520coding/confuse";

@interface YQProfileViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) YQProfileHeaderView *headerView;
@property (nonatomic, copy)   NSArray<NSArray<YQSettingItem *> *> *sections;
@end

@implementation YQProfileViewController

- (void)setupUI {
    self.sections = [YQSettingItem sections];

    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView.dataSource = self;
    self.tableView.delegate   = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kYQSettingCellID];
    [self.view addSubview:self.tableView];

    self.headerView = [[YQProfileHeaderView alloc] initWithFrame:CGRectMake(0, 0, kYQScreenWidth, 160)];
    self.tableView.tableHeaderView = self.headerView;

    // 监听收藏变化，刷新“我的收藏”角标
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onFavoriteChanged:)
                                                 name:YQFeedFavoriteChangedNotification
                                               object:nil];
}

- (void)loadData {
    [self.headerView configureWithUser:[YQUserSession sharedSession].currentUser];
}

- (void)onFavoriteChanged:(NSNotification *)note {
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sections[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kYQSettingCellID];
    YQSettingItem *item = self.sections[indexPath.section][indexPath.row];

    cell.textLabel.text  = item.title;
    cell.imageView.image = [UIImage systemImageNamed:item.iconName];
    cell.imageView.tintColor = YQThemeColor;

    if (item.type == YQSettingTypeLogout) {
        cell.textLabel.textColor   = [UIColor systemRedColor];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.accessoryType         = UITableViewCellAccessoryNone;
    } else {
        cell.textLabel.textColor   = YQTextColor;
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        cell.accessoryType         = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    YQSettingItem *item = self.sections[indexPath.section][indexPath.row];
    [self handleSettingType:item.type];
}

- (void)handleSettingType:(YQSettingType)type {
    switch (type) {
        case YQSettingTypeLogout:
            [[YQUserSession sharedSession] logout];
            [[NSNotificationCenter defaultCenter] postNotificationName:YQLogoutNotification object:nil];
            break;
        case YQSettingTypeClearCache:
            [self showMessage:YQLocalized(@"mine_cache_cleared")];
            break;
        case YQSettingTypeAbout:
            [self showAboutAlert];
            break;
        default:
            [self showMessage:YQLocalized(@"common_coming_soon")];
            break;
    }
}

// 关于：弹窗展示 confuse 品牌地址 + 链接进来的 confuse_sdk 版本
- (void)showAboutAlert {
    NSString *message = [NSString stringWithFormat:@"%@\n\n%@\n\nconfuse_sdk v%.1f",
                         YQLocalized(@"about_slogan"), kYQAboutURL, confuse_sdkVersionNumber];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:YQLocalized(@"mine_about")
                                                                  message:message
                                                           preferredStyle:UIAlertControllerStyleAlert];
    YQWeakSelf(self);
    [alert addAction:[UIAlertAction actionWithTitle:YQLocalized(@"about_copy_link")
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction *action) {
        YQStrongSelf(self);
        [UIPasteboard generalPasteboard].string = kYQAboutURL;
        [self showMessage:YQLocalized(@"other_copied")];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:YQLocalized(@"common_ok") style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
