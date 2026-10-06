//
//  UIColor+YQHex.m
//  confuse_test_oc
//

#import "UIColor+YQHex.h"

@implementation UIColor (YQHex)

+ (UIColor *)yq_colorWithHex:(uint32_t)hex {
    return [self yq_colorWithHex:hex alpha:1.0];
}

+ (UIColor *)yq_colorWithHex:(uint32_t)hex alpha:(CGFloat)alpha {
    CGFloat red   = ((hex & 0xFF0000) >> 16) / 255.0;
    CGFloat green = ((hex & 0x00FF00) >> 8)  / 255.0;
    CGFloat blue  =  (hex & 0x0000FF)        / 255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end
