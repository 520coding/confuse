//
//  TestGlobalVariable.h
//  confuse_test
//
//  Created by yjs on 2020/9/27.
//  Copyright © 2020 coding520. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestSuperGlobalVariable.h"

UIKIT_EXTERN NSString * const HWDownloadProgressNotification;
UIKIT_EXTERN NSString * const HWDownloadStateChangeNotification;

extern NSString *kGlobalVariable2;
extern NSInteger kGlobalVariable3;

NS_ASSUME_NONNULL_BEGIN

@interface TestGlobalVariable : NSObject

@end

NS_ASSUME_NONNULL_END
