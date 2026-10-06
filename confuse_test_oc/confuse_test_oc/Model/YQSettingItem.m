//
//  YQSettingItem.m
//  confuse_test_oc
//

#import "YQSettingItem.h"
#import "YQMacros.h"

@implementation YQSettingItem

+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)iconName type:(YQSettingType)type {
    YQSettingItem *item = [[self alloc] init];
    item.title    = title;
    item.iconName = iconName;
    item.type     = type;
    return item;
}

+ (NSArray<NSArray<YQSettingItem *> *> *)sections {
    return @[
        @[
            [self itemWithTitle:YQLocalized(@"mine_favorites") icon:@"star"  type:YQSettingTypeFavorites],
            [self itemWithTitle:YQLocalized(@"mine_history")   icon:@"clock" type:YQSettingTypeHistory],
        ],
        @[
            [self itemWithTitle:YQLocalized(@"mine_general")     icon:@"gearshape"    type:YQSettingTypeGeneral],
            [self itemWithTitle:YQLocalized(@"mine_about")       icon:@"info.circle"  type:YQSettingTypeAbout],
            [self itemWithTitle:YQLocalized(@"mine_clear_cache") icon:@"trash"        type:YQSettingTypeClearCache],
        ],
        @[
            [self itemWithTitle:YQLocalized(@"mine_logout") icon:@"arrow.backward.square" type:YQSettingTypeLogout],
        ],
    ];
}

@end
