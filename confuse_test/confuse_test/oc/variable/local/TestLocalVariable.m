//
//  TestLocalVariable.m
//  confuse_test
//
//  Created by yjs on 2020/10/10.
//  Copyright © 2020 coding520. All rights reserved.
//

#import "TestLocalVariable.h"
#import <YYCategories.h>

UInt8 _float = 0;
typedef NSString *(^Block)(int *num);

@implementation TestLocalVariable

+ (void)test {
    for (NSString *k in @[@"test"]) {
        NSLog(@"%@", k);
    }
    for (int i = 0; i < 2; i++) {
        NSLog(@"%d", i);
    }

    NSInteger NSInteger1 = 0;
    NSLog(@"%ld", NSInteger1);
    NSInteger *NSInteger2 = &NSInteger1;
    NSLog(@"%ld", *NSInteger2);

    CGFloat lengths[] = { 2, 1 };
    NSLog(@"%f", lengths[0]);

    NSArray<NSString *> *array1 = @[];
    NSMutableArray<NSString *> *array2 = [NSMutableArray arrayWithArray:array1];
    NSLog(@"%@", array2);

    NSString * (^ block)(int *num) = nil;
    Block block2 = block;
    NSLog(@"%@", block2);

    UIView *view1 = [[UIView alloc] initWithFrame:CGRectZero];
    NSLog(@"%@", view1);
    UIView *view2 = [self view:^{
        UIView *view3 = [[UIView alloc] initWithFrame:CGRectZero];
        NSLog(@"%@", view3);
    }];
    NSLog(@"%@", view2);

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        NSLog(@"%@", label);
    });

    UISwitch *switch1 = [[UISwitch alloc] initWithFrame:CGRectZero];
    switch1.left = 0;
    NSLog(@"%@", switch1);
    
    NSData *data = @"{\"k\":\"v\"}".dataValue;
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"%@", result);
    
    id test = @"";
    NSLog(@"%@", test);
    
    NSDictionary *dic = @{};
    NSLog(@"%@", dic);
}

+ (UIView *)view:(void (^)(void))block {
    return nil;
}

@end
