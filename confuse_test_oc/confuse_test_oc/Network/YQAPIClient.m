//
//  YQAPIClient.m
//  confuse_test_oc
//

#import "YQAPIClient.h"
#import "YQConst.h"
#import "YQMacros.h"
#import <YYModel/YYModel.h>

@interface YQAPIClient ()
@property (nonatomic, strong) NSURLSession *session;
@end

@implementation YQAPIClient

+ (instancetype)sharedClient {
    static YQAPIClient *client = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ client = [[self alloc] init]; });
    return client;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    }
    return self;
}

- (void)GET:(NSString *)path parameters:(NSDictionary *)parameters success:(YQHTTPSuccess)success failure:(YQHTTPFailure)failure {
    NSString *urlString = [NSString stringWithFormat:@"%@/%@", YQAPIBaseURL, path];
    YQLog(@"GET %@ params=%@", urlString, parameters);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (success) { success([self mockResponseForPath:path parameters:parameters]); }
    });
}

- (void)loadFeedPage:(NSInteger)page pageSize:(NSInteger)pageSize completion:(void (^)(NSArray<YQFeedItem *> * _Nullable, NSError * _Nullable))completion {
    YQWeakSelf(self);
    [self GET:@"feed/list" parameters:@{ @"page": @(page), @"size": @(pageSize) } success:^(id _Nullable responseObject) {
        YQStrongSelf(self);
        NSArray *list = responseObject[@"list"];
        NSArray<YQFeedItem *> *items = [NSArray yy_modelArrayWithClass:[YQFeedItem class] json:list];
        YQLog(@"feed loaded: %lu items (page %ld) via %@", (unsigned long)items.count, (long)page, self);
        if (completion) { completion(items, nil); }
    } failure:^(NSError *error) {
        if (completion) { completion(nil, error); }
    }];
}

#pragma mark - Mock

static NSInteger const kYQMockMaxPage = 3;

- (NSDictionary *)mockResponseForPath:(NSString *)path parameters:(NSDictionary *)parameters {
    NSInteger page = MAX(1, [parameters[@"page"] integerValue]);
    if (page > kYQMockMaxPage) {
        return @{ @"code": @0, @"list": @[], @"has_more": @NO };
    }
    NSArray *covers = @[@"oc", @"swift", @"lua", @"cpp", @"dragon", @"hashiqi"];
    NSArray *titles = @[@"Objective-C 运行时揭秘：消息转发的三次机会",
                        @"Swift 并发模型 async/await 实战",
                        @"用 Lua 给 App 做热更新的边界",
                        @"C++ 与 OC 混编时的内存所有权",
                        @"iOS 包体积优化：从 80M 到 45M",
                        @"一次线上崩溃的定位复盘"];
    NSString *content = @"这是正文的第一段，用于验证详情页的长文本排版与混淆后的完整性。\n\n"
                         "第二段：混淆器只会重命名工程自有的类、方法、属性等符号，"
                         "不会触碰系统与第三方库符号，也不应改变任何用户可见的字符串内容。\n\n"
                         "第三段：如果你在混淆后看到这段文字依然完整、可读、换行正常，"
                         "说明字符串与本地化处理是正确的。";
    NSMutableArray *list = [NSMutableArray array];
    for (NSInteger i = 0; i < covers.count; i++) {
        NSInteger idx = (page - 1) * covers.count + i;
        NSString *cover = covers[i];
        NSString *title = (page == 1) ? titles[i] : [NSString stringWithFormat:@"%@（第 %ld 页）", titles[i], (long)page];
        [list addObject:@{
            @"id": [NSString stringWithFormat:@"%ld", (long)(1000 + idx)],
            @"title": title,
            @"summary": @"这是一段用于列表展示的摘要文本，混淆后应保持完整可读。",
            @"content": content,
            @"cover": cover,
            @"like_count": @(120 + idx * 7),
            @"read_count": @(2000 + idx * 133),
            @"comment_count": @(idx * 3),
            @"publish_time": @(1700000000 + idx * 86400),
            @"tags": @[@"iOS", cover, @"实战"],
            @"author": @{ @"author_id": [NSString stringWithFormat:@"u%ld", (long)idx], @"name": @"技术小编", @"avatar": @"hashiqi" }
        }];
    }
    return @{ @"code": @0, @"list": list, @"has_more": @(page < kYQMockMaxPage) };
}

@end
