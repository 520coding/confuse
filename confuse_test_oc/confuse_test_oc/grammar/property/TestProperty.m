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
    int _count;
}
- (NSString *)rightView;

@end

@implementation TestProperty

- (void)begin {
    _editing = @"_editing";
    _title = @"_2";
    _count = 3;
    __text = [NSMutableArray array];
    self.delegate = @"_s1";
    self.bounces = @"_s2";
}

- (void)testKvcKvo {
    NSLog(@"以下代码混淆后记得手动修复，或者注释，否则运行会报错。");
    NSLog(@"原因：属性混淆只保证编译层面准确性，运行时错误（kvc、kvo属性混淆暂不考虑），需要用户依据工具《预检查结果》自行调整");
    [self valueForKey:@"editing"];
    NSDictionary *dic = @{
        @"editing": @{
            @"key2": @{
                @"key3": @"lisi002"
            }
        }
    };
    [dic valueForKeyPath:@"editing.key2.key3"];
    [self valueForKey:@"editing"];
    [self setValue:@"_setValue1" forKey:@"editing"];
    [self setValue:@"_setValue2" forKeyPath:@"_text"];
}

- (void)setEditing:(NSString *)editing {
    _editing = @"_count";
}

- (NSString *)title {
    return @"_title";
}

- (void)setCount:(int)count {
    _count = count;
}

- (int)count {
    return 3;
}

- (void)set_text:(NSMutableArray *)_text {
    __text = _text;
    _title = self.name;
    _title = [self name];
    self.name = @"_leftView";
    [self setName:@"_7"];
    _leftView = self.leftView;
    [self setLeftView:_leftView];
//    self.leftView = _p5; // self.leftView 编译通过，但是xcode跳转还是get方法，这种情况混淆bug暂时不处理
    [self setLeftView:self.leftView];
    [self setLeftView:[self leftView]];
    [self setRightView:self.rightView];
    [self setRightView:[self rightView]];
    _rightView = self.zoomBouncing;
    _rightView = [self zoomBouncing];
    self.background = _background;
    [self updateBackground:[self hasBackground]];
    self.disabledBackground = _disabledBackground;
    [self updateDisabledBackground:[self hasDisabledBackground]];
}

- (void)setLeftView:(NSString *)leftView {
    _leftView = @"_8";
}

- (NSString *)leftView {
    return @"_leftView";
}

- (void)setRightView:(NSString *)rightView {
    _rightView = @"_9";
}

- (NSString *)rightView {
    return @"_rightView";
}

- (NSString *)zoomBouncing {
    return @"_rightView";
}

- (void)setBounces:(NSString *)bounces {
    self.delegate = bounces;
}

- (void)setDragging:(NSString *)dragging {
    self.bounces = dragging;
}

- (NSString *)dragging {
    return @"_10";
}

- (void)setAttributedText:(void (^)(void))attributedText {
}

- (void)setFont:(NSString *_Nonnull (^)(NSString *_Nonnull))font {
}

- (void)setTextAlignment:(NSString *_Nonnull (^)(NSString *_Nonnull))textAlignment {
}

- (void)setBorderStyle:(NSString *_Nonnull (^)(NSString *_Nonnull, NSString *_Nonnull))borderStyle {
}

- (void)setPlaceholder:(NSArray<NSString *> *_Nonnull (^)(NSString *_Nonnull, NSString *_Nonnull))placeholder {
}

- (void)setTextColor:(Block1)textColor {
}

- (void)setAttributedPlaceholder:(NSString *)attributedPlaceholder {
}

- (void)setClearsOnBeginEditing:(NSString *)clearsOnBeginEditing {
}

- (void)setZooming:(id)zooming {
}

- (NSString *)hasDisabledBackground {
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
    return self.hasDisabledBackground;
}

@synthesize bounces;

@end

@interface TestProperty1 ()
{
}
@property (nonatomic, strong) NSString *p12;

@end

@implementation TestProperty1

- (void)begin {
    _editing = @"_11";
    self.text = @"_12";
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey, id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"editing"]) {
    }
}

- (void)setText:(NSString *)text {
    super.text = text;
}

- (NSString *)text {
    return @"_test";
}

- (void)setEditing:(NSString *)p1 {
    _editing = @"_25";
}

- (void)setDelegate:(NSString *)sp1 {
}

- (void)setBounces:(NSString *)sp2 {
}

- (NSString *)bounces {
    return @"_26";
}

- (void)setDragging:(NSString *)sp3 {
}

- (NSString *)dragging {
    return @"_27";
}

@end

@implementation TestProperty2

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSStringFromSelector(@selector(setDecelerating:));
        NSSelectorFromString(@"setDecelerating:");
        NSSelectorFromString([NSString stringWithFormat:@"%@", @"setDecelerating:"]);
        NSStringFromSelector(@selector(setFrame:));
        NSSelectorFromString(@"setFrame:");
        NSSelectorFromString([NSString stringWithFormat:@"%@", @"setFrame:"]);
    }
    return self;
}

- (void)setDecelerating:(NSString *)setDecelerating {
}

+ (void)setDecelerating:(NSString *)setDecelerating {
}

- (void)setDragging:(NSString *)dragging {
}

- (void)setDelegate:(NSObject *)delegate {
}

- (void)setBounces:(NSString *)sp2 {
}

@end

@implementation TestProperty3

- (void)setDelegate:(NSObject *)delegate {
    [super setDelegate:delegate];
}

- (void)setBounces:(NSString *)bounces {
    [super setBounces:bounces];
}

- (void)setDragging:(NSString *)dragging {
    [super setDragging:dragging];
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
