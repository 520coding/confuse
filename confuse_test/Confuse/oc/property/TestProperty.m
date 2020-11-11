//
//  TestProperty.m
//  LMSKSDK
//
//  Created by yjs on 2020/9/7.
//  Copyright © 2020 dvcds. All rights reserved.
//

#import "TestProperty.h"

@interface TestProperty ()
{
    int _p3;
}
- (NSString *)p6;

@end

@implementation TestProperty

- (void)begin {
    _p1 = @"_1";
    _p2 = @"_2";
    _p3 = 3;
    __p4 = [NSMutableArray array];
    self.sp1 = @"_s1";
    self.sp2 = @"_s2";
}

- (void)testKvcKvo {
    NSLog(@"以下代码混淆后记得手动修复，或者注释，否则运行会报错。");
    NSLog(@"原因：属性混淆只保证编译层面准确性，运行时错误（kvc、kvo属性混淆暂不考虑），需要用户依据工具《预检查结果》自行调整");
    [self valueForKey:@"p1"];
    NSDictionary *dic = @{
        @"p1": @{
            @"key2": @{
                @"key3": @"lisi002"
            }
        }
    };
    [dic valueForKeyPath:@"p1.key2.key3"];
    [self valueForKey:@"p1"];
    [self setValue:@"_setValue1" forKey:@"p1"];
    [self setValue:@"_setValue2" forKeyPath:@"_p4"];
}

- (void)setP1:(NSString *)p1 {
    _p1 = @"_5";
}

- (NSString *)p2 {
    return @"_p2";
}

- (void)setP3:(int)p3 {
    _p3 = p3;
}

- (int)p3 {
    return 3;
}

- (void)set_p4:(NSMutableArray *)_p4 {
    __p4 = _p4;
    _p2 = self.p1;
    _p2 = [self p1];
    self.p1 = @"_6";
    [self setP1:@"_7"];
    _p5 = self.p5;
    [self setP5:_p5];
//    self.p5 = _p5; // self.p5 编译通过，但是xcode跳转还是get方法，这种情况混淆bug暂时不处理
    [self setP5:self.p5];
    [self setP5:[self p5]];
    [self setP6:self.p6];
    [self setP6:[self p6]];
    _p6 = self.p7;
    _p6 = [self p7];
    self.p9 = _p9;
    [self updateP9:[self hasP9]];
    self.p10 = _p10;
    [self updateP10:[self hasP10]];
}

- (void)setP5:(NSString *)p5 {
    _p5 = @"_8";
}

- (NSString *)p5 {
    return @"_p5";
}

- (void)setP6:(NSString *)p6 {
    _p6 = @"_9";
}

- (NSString *)p6 {
    return @"_p6";
}

- (NSString *)p7 {
    return @"_p6";
}

- (void)setSp2:(NSString *)sp2 {
    self.sp1 = sp2;
}

- (void)setSp3:(NSString *)sp3 {
    self.sp2 = sp3;
}

- (NSString *)sp3 {
    return @"_10";
}

- (void)setBp1:(void (^)(void))bp1 {
}

- (void)setBp2:(NSString *_Nonnull (^)(NSString *_Nonnull))bp2 {
}

- (void)setBp3:(NSString *_Nonnull (^)(NSString *_Nonnull))bp3 {
}

- (void)setBp4:(NSString *_Nonnull (^)(NSString *_Nonnull, NSString *_Nonnull))bp4 {
}

- (void)setBp5:(NSArray<NSString *> *_Nonnull (^)(NSString *_Nonnull, NSString *_Nonnull))bp5 {
}

- (void)setTbp:(Block1)tbp {
}

- (void)setP8_1:(NSString *)p8_1 {
}

- (void)setP8_2:(NSString *)p8_2 {
}

- (void)setId_p7:(id)id_p7 {
}

- (NSString *)hasP10 {
    return @"_11";
}

- (void)setMore:(NSObject *)more {
}

- (void)setDataSource:(NSArray *)dataSource {
}

- (void)setView:(UIView *)view {
}

- (void)setIsRight:(Boolean)isRight {
}

- (NSString *)help {
    return self.hasP10;
}

@synthesize sp2;

@end

@interface TestProperty1 ()
{
}
@property (nonatomic, strong) NSString *p12;

@end

@implementation TestProperty1

- (void)begin {
    _p1 = @"_11";
    self.text = @"_12";
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey, id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"p1"]) {
    }
}

- (void)setText:(NSString *)text {
    super.text = text;
}

- (NSString *)text {
    return @"_1test";
}

- (void)setP1:(NSString *)p1 {
    _p1 = @"_25";
}

- (void)setSp1:(NSString *)sp1 {
}

- (void)setSp2:(NSString *)sp2 {
}

- (NSString *)sp2 {
    return @"_26";
}

- (void)setSp3:(NSString *)sp3 {
}

- (NSString *)sp3 {
    return @"_27";
}

@end

@implementation TestProperty2

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSStringFromSelector(@selector(setP21:));
        NSSelectorFromString(@"setP21:");
        NSSelectorFromString([NSString stringWithFormat:@"%@", @"setP21:"]);
        NSStringFromSelector(@selector(setSp1:));
        NSSelectorFromString(@"setSp1:");
        NSSelectorFromString([NSString stringWithFormat:@"%@", @"setSp1:"]);
    }
    return self;
}

- (void)setP21:(NSString *)p21 {
}

+ (void)setP21:(NSString *)p21 {
}

- (void)setP22:(NSString *)p22 {
}

- (void)setSp1:(NSObject *)sp1 {
}

- (void)setSp2:(NSString *)sp2 {
}

@end

@implementation TestProperty3

- (void)setSp1:(NSObject *)sp1 {
    [super setSp1:sp1];
}

- (void)setSp2:(NSString *)sp2 {
    [super setSp2:sp2];
}

- (void)setSp3:(NSString *)sp3 {
    [super setSp3:sp3];
}

- (void)setMore:(NSObject *)more {
    [super setMore:more];
}

@end

#import <objc/runtime.h>

static void *DragEnableKey = &DragEnableKey;
static void *AdsorbEnableKey = &AdsorbEnableKey;

@implementation UIButton (NMCategory)

- (void)setDragEnable:(BOOL)dragEnable
{
    objc_setAssociatedObject(self, DragEnableKey, @(dragEnable), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isDragEnable
{
    return [objc_getAssociatedObject(self, DragEnableKey) boolValue];
}

- (void)setAdsorbEnable:(BOOL)adsorbEnable
{
    objc_setAssociatedObject(self, AdsorbEnableKey, @(adsorbEnable), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isAdsorbEnable
{
    return [objc_getAssociatedObject(self, AdsorbEnableKey) boolValue];
}

@end
