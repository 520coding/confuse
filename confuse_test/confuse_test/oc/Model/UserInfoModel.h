//
//  UserInfoModel.h
//  confuse_test
//
//  Created by yjs on 2020/9/9.
//  Copyright © 2020 coding520. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserInfoModel : NSObject

@property (nonatomic,copy)NSString* userid;

@property (nonatomic,copy)NSString* token;

@property (nonatomic,copy)NSString* accessToken;

@property (nonatomic,copy)NSString* username;

@property (nonatomic,copy)NSString* password;

@property (nonatomic,assign)int userType;

@property (nonatomic,assign)uint loginTime;

+ (UserInfoModel*)initWithNetInfo:(NSDictionary*)info andPass:(NSString*)pass;

- (instancetype)initWithNetInfo:(NSDictionary *)info andPass:(NSString *)pass;

@end

NS_ASSUME_NONNULL_END
