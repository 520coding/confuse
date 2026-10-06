//
//  NSString+YQAdd.h
//  confuse_test_oc
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (YQAdd)

/// 是否为空白（nil / @"" / 纯空格）
- (BOOL)yq_isBlank;

/// 去掉首尾空白
- (NSString *)yq_trimmed;

@end

NS_ASSUME_NONNULL_END
