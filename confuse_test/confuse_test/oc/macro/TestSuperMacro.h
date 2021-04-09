//
//  TestSuperMacro.h
//  confuse_test
//
//  Created by yjs on 2020/9/26.
//  Copyright © 2020 coding520. All rights reserved.
//

#import <Foundation/Foundation.h>

#define YJS_TARGET @"YJS_TARGET"

#if TARGET_OS_MAC
#undef YJS_TARGET
#define YJS_TARGET @"TARGET_OS_MAC"
//TARGET_OS_MAC
#endif

#if TARGET_OS_IOS
#undef YJS_TARGET
#define YJS_TARGET @"TARGET_OS_IOS"
//TARGET_OS_IOS
#endif

#if TARGET_IPHONE_SIMULATOR
#undef YJS_TARGET
#define YJS_TARGET @"TARGET_IPHONE_SIMULATOR"
//TARGET_IPHONE_SIMULATOR
#endif

#if TARGET_OS_NANO
#undef YJS_TARGET
#define YJS_TARGET @"TARGET_OS_NANO"
//TARGET_OS_NANO
#endif

#define TEST_super_macro unfold_test_super_macro
#define TEST_super_macro_(var) unfold_test_super_macro_##var

#define TEST_super_macro1 unfold_test_super_macro1
#define TEST_super_macro1_(var) unfold_test_super_macro1_##var

NS_ASSUME_NONNULL_BEGIN

@interface TestSuperMacro : NSObject

- (void)TEST_super_macro;
- (void)TEST_super_macro_(YJS);

@end

NS_ASSUME_NONNULL_END

