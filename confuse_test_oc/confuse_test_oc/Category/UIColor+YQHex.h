//
//  UIColor+YQHex.h
//  confuse_test_oc
//
//  十六进制转 UIColor
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (YQHex)

+ (UIColor *)yq_colorWithHex:(uint32_t)hex;
+ (UIColor *)yq_colorWithHex:(uint32_t)hex alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
