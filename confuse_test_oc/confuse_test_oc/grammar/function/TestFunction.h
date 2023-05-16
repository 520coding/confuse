//
//  TestFunction.h
//  confuse_test_oc
//
//  Created by yjs on 2020/9/10.
//  Copyright © 2020 coding520. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TestFunctionSuper.h"

NS_ASSUME_NONNULL_BEGIN

@interface TestFunction : TestFunctionSuper<TestFunctionSuper>

@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) NSString *layer;
@property (nonatomic, strong) NSString *delegate;

- (void)sizeThatFits;
- (void)sizeThatFits:(NSString *)size;
- (void)layoutIfNeeded:(NSString *)na1me;

@end

@interface TestFunction1 : NSObject

+ (void)init; // 测试同方法不同类
+ (void)addSubview;
- (void)addSubview;

@end

@interface TestFunction2 : UIViewController

- (void)sizeThatFits:(NSString *)view;

@end

@interface TestFunction3 : TestFunctionSuper

@end

@interface TestFunction4 : NSObject<TestFunctionSuper>

@end

NS_ASSUME_NONNULL_END
