//
//  YQUser.h
//  confuse_test_oc
//
//  用户模型
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YQUser : NSObject

@property (nonatomic, copy)   NSString *userID;
@property (nonatomic, copy)   NSString *token;
@property (nonatomic, copy)   NSString *firstName, *lastName;   // 多属性同行声明
@property (nonatomic, assign, getter=isVip) BOOL vip;           // 自定义 getter 名
@property (nonatomic, copy, readonly) NSString *displayName;    // 只读计算属性

- (instancetype)initWithID:(NSString *)userID token:(NSString *)token;

@end

NS_ASSUME_NONNULL_END
