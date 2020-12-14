//
//  TestFunctionSuper.h
//  confuse_test
//
//  Created by yjs on 2020/9/10.
//  Copyright © 2020 coding520. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Base.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TestFunctionSuper <NSObject, Base>

@property (nonatomic, strong) NSString *sp1;

+ (void)sfunc;
- (void)sfunc;

@end

@interface TestFunctionSuper : NSObject

@property (nonatomic, assign) NSInteger section;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger *count;

+ (void)init;
+ (void)func;
- (void)func;
+ (void)func1;
- (void)func1;

@end

@interface TestFunctionSuper(YJS)

- (void)category_func_1;

@end

NS_ASSUME_NONNULL_END
