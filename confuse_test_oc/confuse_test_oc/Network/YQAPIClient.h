//
//  YQAPIClient.h
//  confuse_test_oc
//
//  轻量网络层（单例 + block 回调）
//

#import <Foundation/Foundation.h>
#import "YQFeedItem.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^YQHTTPSuccess)(id _Nullable responseObject);
typedef void (^YQHTTPFailure)(NSError *error);

@interface YQAPIClient : NSObject

+ (instancetype)sharedClient;

/// 通用 GET
- (void)GET:(NSString *)path
 parameters:(nullable NSDictionary *)parameters
    success:(nullable YQHTTPSuccess)success
    failure:(nullable YQHTTPFailure)failure;

/// 资讯流分页拉取（多段选择器 + 泛型 block 参数）
- (void)loadFeedPage:(NSInteger)page
            pageSize:(NSInteger)pageSize
          completion:(void (^)(NSArray<YQFeedItem *> * _Nullable items, NSError * _Nullable error))completion;

@end

NS_ASSUME_NONNULL_END
