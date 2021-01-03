//
//  TestSuperGlobalVariable.h
//  confuse_test
//
//  Created by yjs on 2020/9/27.
//  Copyright © 2020 coding520. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString * const HWDownloadMaxConcurrentCountKey;
UIKIT_EXTERN NSString * const HWDownloadMaxConcurrentCountChangeNotification;

extern NSString* const kSuperGlobalVariable1;
extern NSString* const kSuperGlobalVariable1_1;
extern NSString* const kSuperGlobalVariable1_2;
extern NSInteger const kSuperGlobalVariable2;
extern NSString* kSuperGlobalVariable3;
NSString* kSuperGlobalVariable4(NSString* str);

NS_ASSUME_NONNULL_BEGIN

@interface TestSuperGlobalVariable : NSObject

@end

NS_ASSUME_NONNULL_END
