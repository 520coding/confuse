//
//  User_M.m
//  confuse_test
//
//  Created by yjs on 2020/9/9.
//  Copyright © 2020 coding520. All rights reserved.
//

#import "User_M.h"

@implementation User_M

- (instancetype)init
{
    self = [super init];
    if (self) {
        //Model name - JSON key mapping【模型中的属性名和字典中的key不相同(或者需要多级映射)】
        [User_M mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            return @{
                @"name": @"name",
                @"nickname": @"nickname",
                @"oldName": @"name.oldName",
                @"nowName": @"name.newName",
                @"nameChangedTime": @"name.info[1].nameChangedTime",
                @"bag": @"other.bag"
            };
        }];
        
        //Model contains model-array【模型中有个数组属性，数组里面又要装着其他模型】
        [User_M mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                @"statuses": @"Status",
                // @"statuses" : [Status class],
                @"ads": @"Ad",
                // @"ads" : [Ad class]
                @"dogs": @"dogs"
            };
        }];
    }
    return self;
}

//Model name - JSON key mapping【模型中的属性名和字典中的key不相同(或者需要多级映射)】
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
        @"name": @"name",
        @"nickname": @"nickname",
        @"oldName": @"name.oldName",
        @"nowName": @"name.newName",
        @"nameChangedTime": @"name.info[1].nameChangedTime",
        @"bag": @"other.bag"
    };
}

//Model contains model-array【模型中有个数组属性，数组里面又要装着其他模型】
+ (NSDictionary *)mj_objectClassInArray {
    return @{
        @"statuses": @"Status",
        // @"statuses" : [Status class],
        @"ads": @"Ad",
        // @"ads" : [Ad class]
        @"dogs": @"dogs"
    };
}

@end
