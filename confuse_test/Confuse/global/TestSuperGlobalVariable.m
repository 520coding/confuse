//
//  TestSuperGlobalVariable.m
//  confuse_test
//
//  Created by yjs on 2020/9/27.
//  Copyright © 2020 coding520. All rights reserved.
//

#import "TestSuperGlobalVariable.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

NSString * const HWDownloadMaxConcurrentCountKey = @"HWDownloadMaxConcurrentCountKey";
NSString * const HWDownloadMaxConcurrentCountChangeNotification = @"HWDownloadMaxConcurrentCountKey";

NSString* const kSuperGlobalVariable1 = @"kSuperGlobalVariable1";
NSString* const kSuperGlobalVariable1_1 = kSuperGlobalVariable1;
NSString* const kSuperGlobalVariable1_2 = nil;
extern NSInteger const kSuperGlobalVariable2;
NSInteger const kSuperGlobalVariable2 = 300;
NSString* kSuperGlobalVariable3 = @"kSuperGlobalVariable3"; //test
NSString* kSuperGlobalVariable4(NSString* str) {
    if (str) {
        return str;
    }
    return @"kSuperGlobalVariable4";
}

static void *kSuperGlobalVariable5 = &kSuperGlobalVariable5      ;
static void *kSuperGlobalVariable6 = &kSuperGlobalVariable5  ;

UILabel* const kSuperGlobalVariable7 = nil;
NSArray*  kSuperGlobalVariable8 = 0;

static const char kBundleKey = 0;

@implementation TestSuperGlobalVariable

- (instancetype)init
{
    self = [super init];
    if (self) {
        objc_getAssociatedObject(self, &kBundleKey);
        kSuperGlobalVariable3 = @"_3";
        [self test];
    }
    return self;
}

- (void)test {
    if (kSuperGlobalVariable1) {
        [kSuperGlobalVariable3 stringByAppendingString:@"_1"];
    }
    NSLog(@"%@",kSuperGlobalVariable1);
    NSLog(@"%ld",(long)kSuperGlobalVariable2);
    NSLog(@"%@",kSuperGlobalVariable3);
    NSLog(@"%@",kSuperGlobalVariable4(nil));
    NSLog(@"%s",kSuperGlobalVariable6);
}

@end
