//
//  YQUserSession.m
//  confuse_test_oc
//

#import "YQUserSession.h"
#import "YQConst.h"
#import "YQMacros.h"
#import <YYModel/YYModel.h>

static NSString * const kYQArchivedUserKey = @"kYQArchivedUserKey";

@interface YQUserSession ()
@property (nonatomic, strong, readwrite, nullable) YQUser *currentUser;
@end

@implementation YQUserSession

+ (instancetype)sharedSession {
    static YQUserSession *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self restoreUser];
    }
    return self;
}

- (BOOL)isLoggedIn {
    return self.currentUser != nil;
}

- (void)loginWithUser:(YQUser *)user {
    self.currentUser = user;
    [self persistUser:user];

    NSString *uid = [user valueForKey:@"userID"];
    YQLog(@"login success, user=%@", user.displayName);

    [[NSNotificationCenter defaultCenter] postNotificationName:YQLoginSuccessNotification
                                                        object:self
                                                      userInfo:@{ @"userID": uid ?: @"" }];
}

- (void)logout {
    self.currentUser = nil;
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kYQArchivedUserKey];
}

#pragma mark - Persistence（YYModel 序列化，冷启动恢复登录态）

- (void)persistUser:(YQUser *)user {
    NSString *json = [user yy_modelToJSONString];
    if (json.length) {
        [[NSUserDefaults standardUserDefaults] setObject:json forKey:kYQArchivedUserKey];
    }
}

- (void)restoreUser {
    NSString *json = [[NSUserDefaults standardUserDefaults] stringForKey:kYQArchivedUserKey];
    if (json.length) {
        self.currentUser = [YQUser yy_modelWithJSON:json];
        YQLog(@"restore user=%@", self.currentUser.displayName);
    }
}

@end
