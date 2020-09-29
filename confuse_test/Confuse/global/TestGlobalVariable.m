//
//  TestGlobalVariable.m
//  confuse_test
//
//  Created by yjs on 2020/9/27.
//  Copyright © 2020 coding520. All rights reserved.
//

#import "TestGlobalVariable.h"

static NSArray *kGlobalVariable1;
NSString *kGlobalVariable2 = nil;
NSInteger kGlobalVariable3 = 300;

@implementation TestGlobalVariable

- (instancetype)init
{
    self = [super init];
    if (self) {
        kGlobalVariable1 = @[];
        kGlobalVariable2 = @"_1";
        kGlobalVariable3 = 3;
        [self test];
    }
    return self;
}

- (void)test {
    NSLog(@"%@", kSuperGlobalVariable1);
    NSLog(@"%ld", (long)kSuperGlobalVariable2);
    NSLog(@"%@", kSuperGlobalVariable3);
}

@end
