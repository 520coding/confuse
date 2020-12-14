//
//  TestDiscardSuper.h
//  confuse_test
//
//  Created by yjs on 2020/10/15.
//  Copyright © 2020 coding520. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TestDiscardSuperProtocol <NSObject>

- (void)f1;
- (void)f2:(NSString *)p1;
- (void)f3:(NSString *)p1 f2:(int)p2;

@end

@interface TestDiscardSuper : NSObject

@end

NS_ASSUME_NONNULL_END
