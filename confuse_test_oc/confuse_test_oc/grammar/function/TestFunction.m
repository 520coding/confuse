//
//  TestFunction.m
//  confuse_test_oc
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
    NSStringFromSelector(@selector(setTag:));
    NSSelectorFromString(@"setTag:");
    NSSelectorFromString([NSString stringWithFormat:@"%@", @"setTag:"]);
    NSStringFromSelector(@selector(layoutIfNeeded:));
    NSSelectorFromString(@"layoutIfNeeded:");
    NSSelectorFromString([NSString stringWithFormat:@"%@", @"layoutIfNeeded:"]);
    NSStringFromSelector(@selector(sizeThatFits:));// 测试所有相关的方法名（类方法、实例方法）统一改
    NSSelectorFromString(@"sizeThatFits:");
    NSSelectorFromString([NSString stringWithFormat:@"%@", @"setFrame2:"]);
    NSStringFromSelector(@selector(layoutIfNeeded));

    [self setTag:@"_tag"];
    [TestFunction init];
    [TestFunction sizeToFit];
    [self reloadData];
    [[[TestFunction alloc] init] layoutIfNeeded:[[[TestFunction alloc] init] layer]];
}

- (void)setDelegate:(NSString *)delegate {
}

- (void)setTag:(NSString *)tag {
}

- (NSString *)layer {
    return @"layer";
}

+ (void)init {
    [super init];
}

+ (void)sizeToFit {
    [super sizeToFit];
}

- (void)sizeToFit {
    [super sizeToFit];
}

+ (void)layoutIfNeeded {
    [super layoutIfNeeded];
}

- (void)layoutIfNeeded {
    [super layoutIfNeeded];
}

- (void)sizeThatFits {
}

- (void)sizeThatFits:(NSString *)size {
}

- (void)layoutIfNeeded:(NSString *)name {
}

- (void)reloadData {
}

+ (void)reloadData {
}

@end

@implementation TestFunction1
- (instancetype)init
{
    self = [super init];
    if (self) {
        [TestFunction init];
        [self addSubview];
    }
    return self;
}

+ (void)init {
}

+ (void)addSubview {
}

- (void)addSubview {
}

@end

@implementation TestFunction2

- (void)viewDidLoad {
}

- (void)sizeThatFits:(NSString *)view {
}

- (NSString *)sizeThatFits:(NSString *)size size:(int)count {
    return @"_2";
}

- (NSArray<NSString *> *)addSubview:(NSString *)view {
    return @[];
}

- (NSArray<NSString *> *)didMoveToWindow {
    if (YES) {
        return nil;
    } else {
        return [[NSArray alloc] init];
    }
    return @[];
}

- (NSString * (^)(NSString *))center:(NSString *)view {
    return nil;
}

- (NSString * (^)(NSString *name1))left:(NSString * (^)(NSString *name2))view right:(int)f2 {
    return NULL;
}

- (NSString * (^)(NSString *))left:(NSString *)view {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        return;
    });
    return nil;
}

- (NSString * (^)(NSString *name1))left:(NSString * (^)(NSString *name2))view bottom:(int)f2 {
    id _block = ^int (NSString *name, int count) {
        return 54;
    };
    NSLog(@"%@", _block);
    return NULL;
}

- (NSString * (^)(NSString *name, int count))top:(NSString *)view {
    return ^NSString *(NSString *name1, int count2) {
               return @"";
    };
}

- (UIView *)background:(NSString *)view {
    return [[UILabel alloc] init];
}

- (UIView *)placeholder:(NSArray *)view {
    return (UIView *)[[NSArray alloc] init];
}

- (UIView *)borderRectForBounds:(NSMutableArray *)view {
    return (UIView *)[[NSArray alloc] init];
}

- (UIView *)textRectForBounds:(NSDictionary *)view {
    return (UIView *)[[NSArray alloc] init];
}

- (UIView *)insertSubview:(NSMutableDictionary *)view belowSubview:(NSMutableArray<NSDictionary *> *)f2 {
    return (UIView *)[[NSArray alloc] init];
}

- (UIView *)insertSubview:(int)view atIndex:(float)f3 f4:(double)f4 f5:(long)f5 f6:(NSInteger)f6 f7:(CGFloat)f7 f8:(short)f8 f9:(BOOL)f9 f10:(Boolean)f10 {
    return (UIView *)[[NSArray alloc] init];
}

- (UIView *)insertSubview:(int *)view aboveSubview:(float **)f3 {
    return (UIView *)[[NSArray alloc] init];
}

- (NSDictionary *)scale:(NSDictionary *)view view:(NSDictionary *)f2 {
    return [NSMutableDictionary dictionaryWithDictionary:view];
}

- (NSArray *)mainScreen:(NSMutableArray *)view view:(NSArray *)f2 {
    return [NSMutableArray arrayWithArray:f2];
}

- (void)currentMode:(UISwitch *)view {
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

@interface TestFunction3 ()

@property (nonatomic, strong) NSString *delegate;

@end

@implementation TestFunction3

+ (void)init {
    [super init];
}

+ (void)sizeToFit {
    [super sizeToFit];
}

- (void)sizeToFit {
    [super sizeToFit];
}

@end

@implementation TestFunction4

- (void)setDelegate:(NSString *)sp1 {
    
}

- (void)reloadData {
    
}

+ (void)reloadData {
    
}

- (void)begin {
    
}

@synthesize delegate;

@end

