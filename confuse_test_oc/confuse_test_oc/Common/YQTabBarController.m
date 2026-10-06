//
//  YQTabBarController.m
//  confuse_test_oc
//

#import "YQTabBarController.h"
#import "YQFeedListViewController.h"
#import "YQDiscoverViewController.h"
#import "YQProfileViewController.h"
#import "YQMacros.h"

@implementation YQTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.tintColor = YQThemeColor;

    NSArray *specs = @[
        @{ @"vc": [YQFeedListViewController class], @"title": YQLocalized(@"tab_feed"),     @"icon": @"sparkles" },
        @{ @"vc": [YQDiscoverViewController class], @"title": YQLocalized(@"tab_other"), @"icon": @"square.grid.2x2" },
        @{ @"vc": [YQProfileViewController class],  @"title": YQLocalized(@"tab_mine"),     @"icon": @"person.crop.circle" },
    ];

    NSMutableArray<UINavigationController *> *navs = [NSMutableArray array];
    for (NSDictionary *spec in specs) {
        Class cls = spec[@"vc"];
        UIViewController *vc = [[cls alloc] init];
        vc.title = spec[@"title"];
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:spec[@"title"]
                                                       image:[UIImage systemImageNamed:spec[@"icon"]]
                                                        tag:navs.count];
        [navs addObject:[[UINavigationController alloc] initWithRootViewController:vc]];
    }
    self.viewControllers = navs;
}

@end
