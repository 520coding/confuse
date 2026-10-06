//
//  YQUser.m
//  confuse_test_oc
//

#import "YQUser.h"
#import "NSString+YQAdd.h"

@implementation YQUser

@synthesize displayName = _displayName;   // 显式 synthesize（验证混淆同步 ivar）

- (instancetype)initWithID:(NSString *)userID token:(NSString *)token {
    self = [super init];
    if (self) {
        _userID = [userID copy];
        _token  = [token copy];
    }
    return self;
}

- (NSString *)displayName {
    NSString *full = [NSString stringWithFormat:@"%@%@", self.firstName ?: @"", self.lastName ?: @""];
    return [full yq_isBlank] ? (self.userID ?: @"游客") : full;
}

@end
