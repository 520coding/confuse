//
//  YQUserSession.h
//  confuse_test_oc
//
//  当前登录态（单例）
//

#import <Foundation/Foundation.h>
#import "YQUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface YQUserSession : NSObject

@property (nonatomic, strong, readonly, nullable) YQUser *currentUser;
@property (nonatomic, assign, readonly, getter=isLoggedIn) BOOL loggedIn;

+ (instancetype)sharedSession;

- (void)loginWithUser:(YQUser *)user;
- (void)logout;

@end

NS_ASSUME_NONNULL_END
