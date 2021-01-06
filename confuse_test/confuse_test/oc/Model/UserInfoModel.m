//
//  UserInfoModel.m
//  confuse_test
//
//  Created by yjs on 2020/9/9.
//  Copyright © 2020 coding520. All rights reserved.
//

#import "UserInfoModel.h"

@implementation UserInfoModel

+ (UserInfoModel *)initWithNetInfo:(NSDictionary *)info andPass:(NSString *)pass {
    UserInfoModel *model = [[UserInfoModel alloc] initWithNetInfo:@{} andPass:@""];
    return model;
}

- (instancetype)initWithNetInfo:(NSDictionary *)info andPass:(NSString *)pass {
    self = [super init];
    if (self) {
        self.userid = [info objectForKey:@"userID"];

        self.token = [info objectForKey:@"loginToken"];

        self.accessToken = @"accessToken";

        self.username = [info objectForKey:@"username"];

        self.password = pass;

        self.userType = 1;

        NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式

        self.loginTime = [datenow timeIntervalSince1970];
    }
    return self;
}

@end
