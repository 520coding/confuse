//
//  TestFunctionSuper.h
//  confuse_test_oc
//
//  Created by yjs on 2020/9/10.
//  Copyright © 2020 coding520. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Base.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TestFunctionSuper <NSObject, Base>

@property (nonatomic, strong) NSString *delegate;

+ (void)reloadData;
- (void)reloadData;

@end

@interface TestFunctionSuper : NSObject

@property (nonatomic, assign) NSInteger section;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger *count;

+ (void)init;
+ (void)sizeToFit;
- (void)sizeToFit;
+ (void)layoutIfNeeded;
- (void)layoutIfNeeded;

@end

@interface TestFunctionSuper(YJS)

- (void)reloadSectionIndexTitles;

@end

NS_ASSUME_NONNULL_END
