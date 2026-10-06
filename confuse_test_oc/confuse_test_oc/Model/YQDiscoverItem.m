//
//  YQDiscoverItem.m
//  confuse_test_oc
//

#import "YQDiscoverItem.h"
#import "YQMacros.h"

@implementation YQDiscoverItem

+ (instancetype)title:(NSString *)title icon:(NSString *)icon route:(YQEntryRoute)route {
    YQDiscoverItem *item = [[self alloc] init];
    item.title = title; item.iconName = icon; item.route = route;
    return item;
}

+ (NSArray<YQDiscoverItem *> *)allItems {
    NSMutableArray<YQDiscoverItem *> *arr = [NSMutableArray array];

    // 扫一扫
    [arr addObject:[self title:YQLocalized(@"other_scan") icon:@"qrcode.viewfinder" route:YQEntryRouteScan]];

    // 消息（列表）
    YQDiscoverItem *notice = [self title:YQLocalized(@"other_notice") icon:@"bell" route:YQEntryRouteList];
    notice.rows = @[
        @{ @"icon": @"checkmark.seal", @"title": @"系统通知", @"subtitle": @"你的账号已完成实名认证" },
        @{ @"icon": @"heart",          @"title": @"新的赞",   @"subtitle": @"技术小编 赞了你的评论" },
        @{ @"icon": @"bubble.left",    @"title": @"新的评论", @"subtitle": @"有人回复了你：说得好！" },
    ];
    [arr addObject:notice];

    // 排行榜（列表）
    YQDiscoverItem *rank = [self title:YQLocalized(@"other_rank") icon:@"star.circle" route:YQEntryRouteList];
    rank.rows = @[
        @{ @"icon": @"1.circle.fill", @"title": @"iOS 包体积优化：从 80M 到 45M", @"subtitle": @"热度 9821" },
        @{ @"icon": @"2.circle.fill", @"title": @"Swift 并发模型 async/await 实战", @"subtitle": @"热度 8730" },
        @{ @"icon": @"3.circle.fill", @"title": @"Objective-C 运行时揭秘",          @"subtitle": @"热度 7645" },
        @{ @"icon": @"4.circle",      @"title": @"C++ 与 OC 混编时的内存所有权",   @"subtitle": @"热度 6012" },
    ];
    [arr addObject:rank];

    // 专题（列表）
    YQDiscoverItem *topic = [self title:YQLocalized(@"other_topic") icon:@"tag" route:YQEntryRouteList];
    topic.rows = @[
        @{ @"icon": @"square.stack", @"title": @"iOS 性能优化专题", @"subtitle": @"12 篇" },
        @{ @"icon": @"square.stack", @"title": @"跨平台混编实践",   @"subtitle": @"8 篇" },
        @{ @"icon": @"square.stack", @"title": @"线上问题复盘合集", @"subtitle": @"15 篇" },
    ];
    [arr addObject:topic];

    // 客服（详情：复制微信号）
    YQDiscoverItem *service = [self title:YQLocalized(@"other_service") icon:@"headphones" route:YQEntryRouteDetail];
    service.detailText = YQLocalized(@"other_service_desc");
    service.code       = @"yiqi_service";
    service.actionTitle  = YQLocalized(@"other_copy_wechat");
    [arr addObject:service];

    // 邀请有礼（详情：复制邀请码）
    YQDiscoverItem *invite = [self title:YQLocalized(@"other_invite") icon:@"gift" route:YQEntryRouteDetail];
    invite.detailText = YQLocalized(@"other_invite_desc");
    invite.code       = @"YQ-2026-888";
    invite.actionTitle  = YQLocalized(@"other_copy_code");
    [arr addObject:invite];

    // 历史（列表）
    YQDiscoverItem *history = [self title:YQLocalized(@"other_history") icon:@"clock.arrow.circlepath" route:YQEntryRouteList];
    history.rows = @[
        @{ @"icon": @"clock", @"title": @"一次线上崩溃的定位复盘", @"subtitle": @"昨天 21:30" },
        @{ @"icon": @"clock", @"title": @"用 Lua 给 App 做热更新的边界", @"subtitle": @"前天 10:12" },
    ];
    [arr addObject:history];

    // 更多（列表）
    YQDiscoverItem *more = [self title:YQLocalized(@"other_more") icon:@"ellipsis.circle" route:YQEntryRouteList];
    more.rows = @[
        @{ @"icon": @"gearshape",           @"title": @"设置",       @"subtitle": @"" },
        @{ @"icon": @"moon",                @"title": @"深色模式",   @"subtitle": @"跟随系统" },
        @{ @"icon": @"questionmark.circle", @"title": @"帮助与反馈", @"subtitle": @"" },
        @{ @"icon": @"info.circle",         @"title": @"关于一起读", @"subtitle": @"v1.0.0" },
    ];
    [arr addObject:more];

    return arr;
}

@end
