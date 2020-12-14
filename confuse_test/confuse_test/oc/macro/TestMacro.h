//
//  TestMacro.h
//  confuse_test
//
//  Created by yjs on 2020/9/25.
//  Copyright © 2020 coding520. All rights reserved.
//

#import <Foundation/Foundation.h>
// 测试导入开始
#import <YYModel/YYModel.h>
// #import <YYCategories.h>
# import <YYCategories/NSData+YYAdd.h>
     #import <YYCategories/NSArray+YYAdd.h>
 #import <YYCategories/NSNumber+YYAdd.h> //test
/*test*/#include <net/if_dl.h> // test

#ifdef YJS
#import <Network/Network.h>
#endif
#ifndef YJS
#import <AdSupport/AdSupport.h>
#endif
// 测试导入结束

#define TEST_macro unfold_test_macro
#define TEST_macro_(var) unfold_test_macro_##var

NS_ASSUME_NONNULL_BEGIN

@interface TestMacro : NSObject

- (void)TEST_macro;
- (void)TEST_macro_(YJS);

@end

NS_ASSUME_NONNULL_END

NS_ASSUME_NONNULL_BEGIN

@interface TestMacro2 : NSObject

- (void)TEST_macro;
- (void)TEST_macro_(YJS);

@end

NS_ASSUME_NONNULL_END
