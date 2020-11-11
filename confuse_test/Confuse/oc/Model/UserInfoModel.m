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
    UserInfoModel *model = [[UserInfoModel alloc] init];

    model.userid = [info objectForKey:@"userID"];

    model.token = [info objectForKey:@"loginToken"];

    model.accessToken = @"accessToken";

    model.username = [info objectForKey:@"username"];

    model.password = pass;

    model.userType = 1;

    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式

    model.loginTime = [datenow timeIntervalSince1970];

    return model;
}

@end
