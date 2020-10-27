//
//  TestFunctionSuper.m
//  confuse_test
//
//  Created by yjs on 2020/9/10.
//  Copyright © 2020 coding520. All rights reserved.
//

#import "TestFunctionSuper.h"

@implementation TestFunctionSuper

+ (void)init {
}

+ (void)func {
}

- (void)func {
}

+ (void)func1 {
}

- (void)func1 {
    [self category_func_1];
}

- (NSString *)test1 {
    return self.title;
}

- (NSInteger)test2 {
    return self.section;
}

@end

@implementation TestFunctionSuper (YJS)

- (void)category_func_1 {
}

@end
