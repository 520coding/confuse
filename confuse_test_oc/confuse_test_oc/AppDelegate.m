//
//  AppDelegate.m
//  confuse_test_oc
//

#import "AppDelegate.h"
#import "YQLoginViewController.h"
#import "YQTabBarController.h"
#import "YQUserSession.h"
#import "YQConst.h"
#import "YQMacros.h"

#if DEBUG
#import "YQFeedDetailViewController.h"
#import "YQFeedItem.h"
#endif

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [self makeInitialRoot];
    [self.window makeKeyAndVisible];

    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(onLoginSuccess) name:YQLoginSuccessNotification object:nil];
    [center addObserver:self selector:@selector(onLogout)       name:YQLogoutNotification       object:nil];

    YQLog(@"app launched");
    return YES;
}

#pragma mark - Root

- (UIViewController *)makeInitialRoot {
#if DEBUG
    UIViewController *debugRoot = [self debugRootForEntry:[[NSUserDefaults standardUserDefaults] stringForKey:@"YQEntry"]];
    if (debugRoot) {
        return debugRoot;
    }
#endif
    return [YQUserSession sharedSession].isLoggedIn ? [self makeMainRoot] : [self makeLoginRoot];
}

- (UIViewController *)makeLoginRoot {
    return [[UINavigationController alloc] initWithRootViewController:[[YQLoginViewController alloc] init]];
}

- (UIViewController *)makeMainRoot {
    return [[YQTabBarController alloc] init];
}

- (void)onLoginSuccess {
    [self setRootViewController:[self makeMainRoot]];
}

- (void)onLogout {
    [self setRootViewController:[self makeLoginRoot]];
}

- (void)setRootViewController:(UIViewController *)root {
    [UIView transitionWithView:self.window
                      duration:0.3
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
        BOOL enabled = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        self.window.rootViewController = root;
        [UIView setAnimationsEnabled:enabled];
    } completion:nil];
}

#if DEBUG

// 快速验证入口：混淆后可直达某页，无需登录/点按
// 用法：xcrun simctl launch booted <bundle> -YQEntry main|discover|profile|detail
- (UIViewController *)debugRootForEntry:(NSString *)dest {
    if (dest.length == 0) {
        return nil;
    }
    // 按类名字符串路由，验证「字符串→类」随类名一起改名
    YQTabBarController *tab = (YQTabBarController *)[[NSClassFromString(@"YQTabBarController") alloc] init];
    (void)tab.view;   // 触发 viewDidLoad，装配好子控制器

    if ([dest isEqualToString:@"discover"]) {
        tab.selectedIndex = 1;
    } else if ([dest isEqualToString:@"profile"]) {
        tab.selectedIndex = 2;
    } else if ([dest isEqualToString:@"detail"]) {
        UINavigationController *nav = tab.viewControllers.firstObject;
        [nav pushViewController:[[YQFeedDetailViewController alloc] initWithItem:[self sampleItem]] animated:NO];
    }
    return tab;   // main / feed / 其它值都进主框架
}

- (YQFeedItem *)sampleItem {
    YQAuthor *author = [YQAuthor new];
    author.name       = @"技术小编";
    author.avatarName = @"hashiqi";

    YQFeedItem *item     = [YQFeedItem new];
    item.itemID         = @"1001";
    item.title          = @"Swift 并发模型 async/await 实战";
    item.summary        = @"这是一段用于详情页展示的正文摘要，混淆后应保持完整可读。";
    item.coverImageName = @"swift";
    item.author         = author;
    item.likeCount      = 231;
    item.publishTime    = 1700000000;
    item.readCount      = 5230;
    item.commentCount   = 42;
    item.tags           = @[@"iOS", @"Swift", @"并发"];
    item.content        = @"这是正文的第一段，用于验证详情页的长文本排版与混淆后的完整性。\n\n第二段：混淆器只重命名工程自有符号，不动系统与三方库符号，也不改变任何用户可见字符串。\n\n第三段：若混淆后这段文字仍完整可读、换行正常，说明字符串与本地化处理正确。";
    return item;
}

#endif

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
