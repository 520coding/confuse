//
//  TestFunction.m
//  confuse_test
//
//  Created by yjs on 2020/9/10.
//  Copyright © 2020 coding520. All rights reserved.
//

#import "TestFunction.h"

@interface TestFunction ()
{
}
@end

@implementation TestFunction

- (void)begin {
    NSStringFromSelector(@selector(setP1:));
    NSSelectorFromString(@"setP1:");
    NSSelectorFromString([NSString stringWithFormat:@"%@", @"setP1:"]);
    NSStringFromSelector(@selector(func1:));
    NSSelectorFromString(@"func1:");
    NSSelectorFromString([NSString stringWithFormat:@"%@", @"func1:"]);
    NSStringFromSelector(@selector(f1:));// 测试所有相关的方法名（类方法、实例方法）统一改
    NSSelectorFromString(@"f1:");
    NSSelectorFromString([NSString stringWithFormat:@"%@", @"setSp2:"]);
    NSStringFromSelector(@selector(func1));

    [self setP1:@"_sp1"];
    [TestFunction init];
    [TestFunction func];
    [self sfunc];
    [[[TestFunction alloc] init] func1:[[[TestFunction alloc] init] p2]];
}

- (void)setSp1:(NSString *)sp1 {
}

- (void)setP1:(NSString *)p1 {
}

- (NSString *)p2 {
    return @"_1";
}

+ (void)init {
    [super init];
}

+ (void)func {
    [super func];
}

- (void)func {
    [super func];
}

+ (void)func1 {
    [super func1];
}

- (void)func1 {
    [super func1];
}

- (void)f1 {
}

- (void)f1:(NSString *)f1 {
}

- (void)func1:(NSString *)name {
}

- (void)sfunc {
}

+ (void)sfunc {
}

@end

@implementation TestFunction1
- (instancetype)init
{
    self = [super init];
    if (self) {
        [TestFunction init];
        [self func];
    }
    return self;
}

+ (void)init {
}

+ (void)func {
}

- (void)func {
}

@end

@implementation TestFunction2

- (void)viewDidLoad {
}

- (void)f1:(NSString *)f1 {
}

- (NSString *)f1:(NSString *)f1 f2:(int)f2 {
    return @"_2";
}

- (NSArray<NSString *> *)f3:(NSString *)f1 {
    return @[];
}

- (NSArray<NSString *> *)f4 {
    if (YES) {
        return nil;
    } else {
        return [[NSArray alloc] init];
    }
    return @[];
}

- (NSString * (^)(NSString *))f5_1:(NSString *)f1 {
    return nil;
}

- (NSString * (^)(NSString *name1))f5_2:(NSString * (^)(NSString *name2))f1 f2:(int)f2 {
    return NULL;
}

- (NSString * (^)(NSString *))f5_3:(NSString *)f1 {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        return;
    });
    return nil;
}

- (NSString * (^)(NSString *name1))f5_4:(NSString * (^)(NSString *name2))f1 f2:(int)f2 {
    id _block = ^int (NSString *name, int count) {
        return 54;
    };
    NSLog(@"%@", _block);
    return NULL;
}

- (NSString * (^)(NSString *name, int count))f6:(NSString *)f1 {
    return ^NSString *(NSString *name1, int count2) {
               return @"";
    };
}

- (UIView *)f7_1:(NSString *)f1 {
    return [[UILabel alloc] init];
}

- (UIView *)f7_2:(NSArray *)f1 {
    return (UIView *)[[NSArray alloc] init];
}

- (UIView *)f8_1:(NSMutableArray *)f1 {
    return (UIView *)[[NSArray alloc] init];
}

- (UIView *)f8_2:(NSDictionary *)f1 {
    return (UIView *)[[NSArray alloc] init];
}

- (UIView *)f8_3:(NSMutableDictionary *)f1 f2:(NSMutableArray<NSDictionary *> *)f2 {
    return (UIView *)[[NSArray alloc] init];
}

- (UIView *)f9:(int)f1 f3:(float)f3 f4:(double)f4 f5:(long)f5 f6:(NSInteger)f6 f7:(CGFloat)f7 f8:(short)f8 f9:(BOOL)f9 f10:(Boolean)f10 {
    return (UIView *)[[NSArray alloc] init];
}

- (UIView *)f9:(int *)f1 f3:(float **)f3 {
    return (UIView *)[[NSArray alloc] init];
}

- (NSDictionary *)f10:(NSDictionary *)f1 f2:(NSDictionary *)f2 {
    return [NSMutableDictionary dictionaryWithDictionary:f1];
}

- (NSArray *)f11:(NSMutableArray *)f1 f2:(NSArray *)f2 {
    return [NSMutableArray arrayWithArray:f2];
}

- (void)f12:(UISwitch *)f1 {
}

+ (void)loadImageFinished:(UIImage *)image
{
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);
}

+ (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSLog(@"image = %@, error = %@, contextInfo = %@", image, error, contextInfo);
}

@end

@implementation TestFunction3

+ (void)init {
    [super init];
}

+ (void)func {
    [super func];
}

- (void)func {
    [super func];
}

@end

@implementation TestFunction4

- (void)setSp1:(NSString *)sp1 {
    
}

- (void)sfunc {
    
}

+ (void)sfunc {
    
}

- (void)begin {
    
}

@synthesize sp1;

@end

