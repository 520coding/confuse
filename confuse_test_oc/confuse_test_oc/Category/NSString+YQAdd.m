//
//  NSString+YQAdd.m
//  confuse_test_oc
//

#import "NSString+YQAdd.h"

@implementation NSString (YQAdd)

- (BOOL)yq_isBlank {
    return [self yq_trimmed].length == 0;
}

- (NSString *)yq_trimmed {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
