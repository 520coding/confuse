//
//  TestFunctionSuper.m
//  confuse_test
//
//  Created by yjs on 2020/9/10.
//  Copyright © 2020 coding520. All rights reserved.
//

#import "TestFunctionSuper.h"
#import <MJExtension/MJPropertyKey.h>
#import <WebKit/WebKit.h>
#import "TestFunctionView.h"

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

- (NSDictionary *)func:(NSDictionary *)f1 f2:(NSString * (^)(NSString *name, int count))name {
    return [NSMutableDictionary dictionaryWithDictionary:f1];
}

- (NSString * (^)(NSString *name, int count))func:(NSString *)name {
    return ^NSString *(NSString *name1, int count2) {
               return @"";
    };
}

- (NSInteger *)from:(NSInteger *)from to:(NSInteger *)to {
    *from = *to + 1;
    return from;
}

- (NSInteger *)count {
    return 0;
}

- (NSInteger *)count1 {
    return [self count];
}

- (MJPropertyKey *)pods {
    return [[MJPropertyKey alloc] init];
}

- (WKWebView *)webView {
    return [[WKWebView alloc] init];
}

- (TestFunctionView *)templateView {
    return [[TestFunctionView alloc] init];
}

- (NSString * (^)(NSString *name, TestFunctionView *view))black:(NSString *)name {
    return ^NSString *(NSString *name1, TestFunctionView *view) {
               return @"";
    };
}

- (NSString * (^)(NSString *name, TestFunctionButton *btn))black2:(NSString *)name {
    return ^NSString *(NSString *name1, TestFunctionButton *btn) {
               return @"";
    };
}

@end

@implementation TestFunctionSuper (YJS)

- (void)category_func_1 {
}

@end
