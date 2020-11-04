//
//  TestFunction.h
//  confuse_test
//
//  Created by yjs on 2020/9/10.
//  Copyright © 2020 coding520. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TestFunctionSuper.h"

NS_ASSUME_NONNULL_BEGIN

@interface TestFunction : TestFunctionSuper<TestFunctionSuper>

@property (nonatomic, strong) NSString *p1;
@property (nonatomic, strong) NSString *p2;
@property (nonatomic, strong) NSString *sp1;

- (void)f1;
- (void)f1:(NSString *)f1;
- (void)func1:(NSString *)name;

@end

@interface TestFunction1 : NSObject

+ (void)init; // 测试同方法不同类
+ (void)func;
- (void)func;

@end

@interface TestFunction2 : UIViewController

- (void)f1:(NSString *)f1;

@end

@interface TestFunction3 : TestFunctionSuper

@end

@interface TestFunction4 : NSObject<TestFunctionSuper>

@end

NS_ASSUME_NONNULL_END
