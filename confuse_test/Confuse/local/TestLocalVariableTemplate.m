//
//  TestLocalVariableTemplate.m
//  confuse_test
//
//  Created by yjs on 2020/10/10.
//  Copyright © 2020 coding520. All rights reserved.
//

#import "TestLocalVariableTemplate.h"

@implementation TestLocalVariableTemplate

+ (void)test_local_variable_num {
    int int1 = 0;
    if (int1) {
        int1 += 1;
        int1--;
    }
    int int2 = 0;
    if (int2) {
        int2 -= 1;
        int2++;
    }
    int int3 = 0;
    if (int3) {
        int count = (0 + 1 + 10 + 0);
        for (NSUInteger i = 0; i < count; i++) {
            int3 -= 1;
        }
        for (NSUInteger i = 0; i < count; i++) {
            int3++;
        }
    }
    int int4 = 0;
    if (int4) {
        int count = (0 + 1 + 10 + 0);
        for (NSUInteger i = 0; i < count; i++) {
            int4 += 1;
        }
        for (NSUInteger i = 0; i < count; i++) {
            --int4;
        }
    }
    short short1 = 0;
    if (short1) {
        short1 += 1;
        short1--;
    }
    short short2 = 0;
    if (short2) {
        short2 -= 1;
        short2++;
    }
    short short3 = 0;
    if (short3) {
        short count = (0 + 1 + 10 + 0);
        for (NSUInteger i = 0; i < count; i++) {
            short3 -= 1;
        }
        for (NSUInteger i = 0; i < count; i++) {
            short3++;
        }
    }
    short short4 = 0;
    if (short4) {
        short count = (0 + 1 + 10 + 0);
        for (NSUInteger i = 0; i < count; i++) {
            short4 += 1;
        }
        for (NSUInteger i = 0; i < count; i++) {
            --short4;
        }
    }
    UInt8 UInt81 = 0;
    if (UInt81) {
        UInt81 += 1;
        UInt81--;
    }
    UInt8 UInt82 = 0;
    if (UInt82) {
        UInt82 -= 1;
        UInt82++;
    }
    UInt8 UInt83 = 0;
    if (UInt83) {
        UInt8 count = (0 + 1 + 10 + 0);
        for (NSUInteger i = 0; i < count; i++) {
            UInt83 -= 1;
        }
        for (NSUInteger i = 0; i < count; i++) {
            UInt83++;
        }
    }
    UInt8 UInt84 = 0;
    if (UInt84) {
        UInt8 count = (0 + 1 + 10 + 0);
        for (NSUInteger i = 0; i < count; i++) {
            UInt84 += 1;
        }
        for (NSUInteger i = 0; i < count; i++) {
            --UInt84;
        }
    }
    Byte Byte1 = 0;
    if (Byte1) {
        Byte1 += 1;
        Byte1--;
    }
    Byte Byte2 = 0;
    if (Byte2) {
        Byte2 -= 1;
        Byte2++;
    }
    Byte Byte3 = 0;
    if (Byte3) {
        Byte count = (0 + 1 + 10 + 0);
        for (NSUInteger i = 0; i < count; i++) {
            Byte3 -= 1;
        }
        for (NSUInteger i = 0; i < count; i++) {
            Byte3++;
        }
    }
    Byte Byte4 = 0;
    if (Byte4) {
        Byte count = (0 + 1 + 10 + 0);
        for (NSUInteger i = 0; i < count; i++) {
            Byte4 += 1;
        }
        for (NSUInteger i = 0; i < count; i++) {
            --Byte4;
        }
    }
    NSInteger NSInteger1 = 0;
    if (NSInteger1) {
        NSInteger1 += 1;
        NSInteger1--;
    }
    NSInteger NSInteger2 = 0;
    if (NSInteger2) {
        NSInteger2 -= 1;
        NSInteger2++;
    }
    NSInteger NSInteger3 = 0;
    if (NSInteger3 == NSIntegerMax - (0 + 10 + 100 + 0)) {
        NSInteger3 = 0;
    }
    NSInteger NSInteger4 = 0;
    if (NSInteger4 == NSIntegerMin + (0 + 10 + 100 + 0)) {
        NSInteger4 = 0;
    }
    NSInteger NSInteger5 = 0;
    if (NSInteger5) {
        NSInteger count = (0 + 10 + 100 + 0);
        for (NSUInteger i = 0; i < count; i++) {
            NSInteger5 -= 1;
        }
        for (NSUInteger i = 0; i < count; i++) {
            NSInteger5++;
        }
    }
    NSInteger NSInteger6 = 0;
    if (NSInteger6) {
        NSInteger count = (0 + 10 + 100 + 0);
        for (NSUInteger i = 0; i < count; i++) {
            NSInteger6 += 1;
        }
        for (NSUInteger i = 0; i < count; i++) {
            --NSInteger6;
        }
    }
    long long1 = 0;
    if (long1) {
        long1 += 1;
        long1--;
    }
    long long2 = 0;
    if (long2) {
        long2 -= 1;
        long2++;
    }
    long long3 = 0;
    if (long3 == NSIntegerMax - (0 + 10 + 100 + 0)) {
        long3 = 0;
    }
    long long4 = 0;
    if (long4 == NSIntegerMin + (0 + 10 + 100 + 0)) {
        long4 = 0;
    }
    long long5 = 0;
    if (long5) {
        long count = (0 + 1 + 10 + 0);
        for (NSUInteger i = 0; i < count; i++) {
            long5 -= 1;
        }
        for (NSUInteger i = 0; i < count; i++) {
            long5++;
        }
    }
    long long6 = 0;
    if (long6) {
        long count = (0 + 1 + 10 + 0);
        for (NSUInteger i = 0; i < count; i++) {
            long6 += 1;
        }
        for (NSUInteger i = 0; i < count; i++) {
            --long6;
        }
    }

    float float1 = 0;
    if (float1) {
        float1 += 1;
        float1--;
    }
    float float2 = 0;
    if (float2) {
        float2 -= 1;
        float2++;
    }
    float float3 = 0;
    if (float3 == MAXFLOAT - (0.0 + 10 + 100 + 0.0)) {
        float3 = 0;
    }
    float float4 = 0;
    if (float4 == -MAXFLOAT + (0.0 + 10 + 100 + 0.0)) {
        float4 = 0;
    }
    float float5 = 0;
    if (float5) {
        float count = (0 + 10 + 100 + 0);
        for (NSUInteger i = 0; i < count; i++) {
            float5 -= 1.0;
        }
        for (NSUInteger i = 0; i < count; i++) {
            float5++;
        }
    }
    float float6 = 0;
    if (float6) {
        float count = (0 + 10 + 100 + 0);
        for (NSUInteger i = 0; i < count; i++) {
            float6 += 1.0;
        }
        for (NSUInteger i = 0; i < count; i++) {
            --float6;
        }
    }
    double double1 = 0;
    if (double1) {
        double1 += 1;
        double1--;
    }
    double double2 = 0;
    if (double2) {
        double2 -= 1;
        double2++;
    }
    double double3 = 0;
    if (double3 == MAXFLOAT - (0 + 10 + 100 + 0)) {
        double3 = 0;
    }
    double double4 = 0;
    if (double4 == -MAXFLOAT + (0 + 10 + 100 + 0)) {
        double4 = 0;
    }
    double double5 = 0;
    if (double5) {
        double count = (0 + 10 + 100 + 0);
        for (NSUInteger i = 0; i < count; i++) {
            double5 -= 1;
        }
        for (NSUInteger i = 0; i < count; i++) {
            double5++;
        }
    }
    double double6 = 0;
    if (double6) {
        double count = (0 + 10 + 100 + 0);
        for (NSUInteger i = 0; i < count; i++) {
            double6 += 1;
        }
        for (NSUInteger i = 0; i < count; i++) {
            --double6;
        }
    }
    CGFloat CGFloat1 = 0;
    if (CGFloat1) {
        CGFloat1 += 1;
        CGFloat1--;
    }
    CGFloat CGFloat2 = 0;
    if (CGFloat2) {
        CGFloat2 -= 1;
        CGFloat2++;
    }
    CGFloat CGFloat3 = 0;
    if (CGFloat3 == MAXFLOAT - (0 + 10 + 100 + 0)) {
        CGFloat3 = 0;
    }
    CGFloat CGFloat4 = 0;
    if (CGFloat4 == -MAXFLOAT + (0 + 10 + 100 + 0)) {
        CGFloat4 = 0;
    }
    CGFloat CGFloat5 = 0;
    if (CGFloat5) {
        CGFloat count = (0 + 10 + 100 + 0);
        for (NSUInteger i = 0; i < count; i++) {
            CGFloat5 -= 1;
        }
        for (NSUInteger i = 0; i < count; i++) {
            CGFloat5++;
        }
    }
    CGFloat CGFloat6 = 0;
    if (CGFloat6) {
        CGFloat count = (0 + 10 + 100 + 0);
        for (NSUInteger i = 0; i < count; i++) {
            CGFloat6 += 1;
        }
        for (NSUInteger i = 0; i < count; i++) {
            --CGFloat6;
        }
    }
    Boolean Boolean1 = false;
    if (Boolean1) {
        Boolean1 = [[NSDate date] timeIntervalSince1970];
    }
    Boolean Boolean2 = false;
    if (!Boolean2) {
        Boolean2 = [[NSDate date] timeIntervalSince1970] < (0 + 100 + 1000 + 0);
    }
    BOOL BOOL1 = false;
    if (BOOL1) {
        BOOL1 = [[NSDate date] timeIntervalSince1970];
    }
    BOOL BOOL2 = false;
    if (!BOOL2) {
        BOOL2 = [[NSDate date] timeIntervalSince1970] < (0 + 100 + 1000 + 0);
    }
}

+ (void)test_local_variable_collection {
    NSArray *NSArray1 = @[];
    if (NSArray1 && NSArray1.count) {
        NSMutableArray *random_var = [NSMutableArray arrayWithArray:NSArray1];
        [random_var addObject:NSStringFromClass([self class])];
        for (id obj in [random_var reverseObjectEnumerator]) {
            if (![NSArray1 containsObject:obj]) {
                [random_var removeObject:obj];
            }
        }
        NSArray1 = random_var;
    }
    NSArray *NSArray2 = @[];
    if (NSArray2 && !NSArray2.count) {
        NSMutableArray *random_var = [NSMutableArray array];
        [random_var addObject:NSStringFromClass([self class])];
        [random_var removeAllObjects];
        NSArray2 = random_var;
    }
    NSMutableArray *NSMutableArray1 = [NSMutableArray array];
    if (NSMutableArray1 && NSMutableArray1.count) {
        [NSMutableArray1 addObject:NSStringFromClass([self class])];
        [NSMutableArray1 removeLastObject];
    }
    NSMutableArray *NSMutableArray2 = [NSMutableArray array];
    if (NSMutableArray2 && !NSMutableArray2.count) {
        [NSMutableArray2 addObject:@"random_str"];
        [NSMutableArray2 removeAllObjects];
    }
    NSDictionary *NSDictionary1 = @{};
    if (NSDictionary1 && NSDictionary1.count) {
        NSMutableDictionary *random_var = [NSMutableDictionary dictionaryWithDictionary:NSDictionary1];
        for (NSString *k in NSDictionary1.allKeys) {
            if ([k isEqualToString:@"random_str"]) {
                [random_var removeObjectForKey:k];
            }
        }
        NSDictionary1 = random_var;
    }
    NSDictionary *NSDictionary2 = @{};
    if (NSDictionary2 && !NSDictionary2.count) {
        NSMutableDictionary *random_var = [NSMutableDictionary dictionaryWithDictionary:NSDictionary2];
        [random_var removeAllObjects];
        NSDictionary2 = random_var;
    }
    NSMutableDictionary *NSMutableDictionary1 = [NSMutableDictionary dictionary];
    if (NSMutableDictionary1 && NSMutableDictionary1.count) {
        for (NSString *k in NSMutableDictionary1.allKeys) {
            if ([k isEqualToString:@"random_str"]) {
                [NSMutableDictionary1 removeObjectForKey:k];
            }
        }
    }
    NSMutableDictionary *NSMutableDictionary2 = [NSMutableDictionary dictionary];
    if (NSMutableDictionary2 && !NSMutableDictionary2.count) {
        [NSMutableDictionary2 setValue:@"random_str" forKey:@"random_str"];
        [NSMutableDictionary2 removeAllObjects];
    }
}

+ (void)test_local_variable_string {
    NSString *NSString1 = @"";
    if ([NSString1 isEqualToString:@"random_str"]) {
        NSString1 = @"";
    }
    NSMutableString *NSMutableString1 = [NSMutableString string];
    if ([NSMutableString1 isEqualToString:@"random_str"]) {
        [NSMutableString1 appendString:@"\n"];
    }
}

- (void)test_local_variable_other {
    UIFont *UIFont1 = [UIFont systemFontOfSize:1];
    if ([UIFont1.fontName isEqualToString:@"random_str"]) {
        UIFont1 = [UIFont systemFontOfSize:UIFont1.pointSize];
    }
    UIFont *UIFont2 = [UIFont systemFontOfSize:1];
    if (UIFont2.pointSize > (0 + 40 + 50 + 0)) {
        UIFont2 = [UIFont fontWithName:UIFont2.fontName size:UIFont2.pointSize - (0.0 + 0.1 + 1 + 0.0)];
    }
    UIFont *UIFont3 = [UIFont systemFontOfSize:1];
    if (UIFont3.pointSize > (0 + 2 + 8 + 0)) {
        UIFont3 = [UIFont fontWithName:UIFont3.fontName size:UIFont3.pointSize + (0.0 + 0.1 + 1 + 0.0)];
    }
}

- (void)test_local_variable_responder {
    UIView *UIView1 = [[UIView alloc] initWithFrame:CGRectZero];
    if (UIView1.frame.size.height == (0.0 + 1000 + 2000 + 0.0)) {
        UIView1.frame =  CGRectMake(UIView1.frame.origin.x, UIView1.frame.origin.y, UIView1.frame.size.width, UIView1.frame.size.height - (0.0 + 0.1 + 1 + 0.0));
    }
    UIView *UIView2 = [[UIView alloc] initWithFrame:CGRectZero];
    if (UIView2.frame.size.width == (0.0 + 1000 + 2000 + 0.0)) {
        UIView2.frame =  CGRectMake(UIView2.frame.origin.x, UIView2.frame.origin.y, UIView2.frame.size.width - (0.0 + 0.1 + 1 + 0.0), UIView2.frame.size.height);
    }
    UIView *UIView3 = [[UIView alloc] initWithFrame:CGRectZero];
    if (UIView3.frame.origin.x == (0.0 + 1000 + 2000 + 0.0)) {
        UIView3.frame =  CGRectMake(UIView3.frame.origin.x - (0.0 + 0.1 + 1 + 0.0), UIView3.frame.origin.y, UIView3.frame.size.width, UIView3.frame.size.height);
    }
    UIView *UIView4 = [[UIView alloc] initWithFrame:CGRectZero];
    if (UIView4.frame.origin.y == (0.0 + 1000 + 2000 + 0.0)) {
        UIView4.frame =  CGRectMake(UIView4.frame.origin.x, UIView4.frame.origin.y - (0.0 + 0.1 + 1 + 0.0), UIView4.frame.size.width, UIView4.frame.size.height);
    }
    UIView *UIView5 = [[UIView alloc] initWithFrame:CGRectZero];
    if (!UIView5.hidden) {
        UIView5.frame =  CGRectZero;
    }

    UILabel *UILabel1 = [[UILabel alloc] initWithFrame:CGRectZero];
    if ([UILabel1.text isEqualToString:@"random_str"]) {
        UILabel1.text = @"";
    }
    UILabel *UILabel2 = [[UILabel alloc] initWithFrame:CGRectZero];
    if ([UILabel2.font.fontName isEqualToString:@"random_str"]) {
        UILabel2.text = @"";
    }
    UILabel *UILabel3 = [[UILabel alloc] initWithFrame:CGRectZero];
    if (!UILabel3.hidden) {
        UILabel3.textColor = [UIColor whiteColor];
    }

    UIImageView *UIImageView1 = [[UIImageView alloc] initWithFrame:CGRectZero];
    if (!UIImageView1.hidden) {
        UIImageView1.image = [UIImage imageNamed:@"random_str"];
    }

    UIImageView *UIImageView2 = [[UIImageView alloc] initWithFrame:CGRectZero];
    if (UIImageView2.animationImages.count == (0 + 100 + 1000 + 0)) {
        NSMutableArray *images = [NSMutableArray array];
        for (NSUInteger i = 0; i < (0 + 1 + 10 + 0); i++) {
            [images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"random_str_%ld", i]]];
        }
        UIImageView2.animationImages = images;
        UIImageView2.animationDuration = (0 + 1 + 10 + 0);
    }

    UIButton *UIButton1 = [[UIButton alloc] initWithFrame:CGRectZero];
    if (UIButton1.contentEdgeInsets.left == (0.0 + 1 + 10 + 0.0)) {
        [UIButton1 setImage:[UIImage imageNamed:@"random_str"] forState:UIControlStateNormal];
        [UIButton1 setImage:[UIImage imageNamed:@"random_str_light"] forState:UIControlStateHighlighted];
    }

    UITextField *UITextField1 = [[UITextField alloc] init];
    if ([UITextField1.placeholder isEqualToString:@"random_str"]) {
        UITextField1.placeholder = @"";
    }
}

@end
