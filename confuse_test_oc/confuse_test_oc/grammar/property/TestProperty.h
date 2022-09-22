//
//  TestProperty.h
//  LMSKSDK
//
//  Created by yjs on 2020/9/7.
//  Copyright © 2020 dvcds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TestPropertySuper.h"

NS_ASSUME_NONNULL_BEGIN

typedef NSArray<NSString *> *_Nullable (^Block1)(NSString *name, NSString *title);

@interface TestProperty : TestPropertySuper<TestPropertySuper, UITableViewDelegate>
{
    NSString *_p5;
    NSString *_p6;
    NSString *_p7;
}

@property (nonatomic, strong) NSString *p1;
@property (nonatomic, strong) NSString *p2;
@property (nonatomic, assign) int p3;
@property (nonatomic, strong) NSMutableArray *_p4;
@property (nonatomic, strong) NSString *sp3;
@property (nonatomic, strong) void (^ bp1)(void);
@property (nonatomic, strong) NSString * (^ bp2)(NSString *);
@property (nonatomic, strong) NSString * (^ bp3)(NSString *name);
@property (nonatomic, strong) NSString * (^ bp4)(NSString *name, NSString *title);
@property (nonatomic, strong) NSArray<NSString *> * (^ bp5)(NSString *name, NSString *title);
@property (nonatomic, strong) Block1 tbp;
@property (nonatomic, strong) id id_p7;
@property (nonatomic, strong) NSString *p8_1, *p8_2;
@property (nonatomic, strong, getter = hasP9, setter = updateP9:) NSString *p9;
@property (nonatomic, strong, getter = hasP10, setter = updateP10:) NSString *p10;
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) UIView *view;
@property (nonatomic, assign) Boolean isRight;
@property (nonatomic, strong) NSString *help;


- (void)setP5:(NSString *)p5;
- (NSString *)p5;

- (void)testKvcKvo;

@end

@interface TestProperty1 : UILabel<TestPropertySuper>

@property (nonatomic, strong) NSString *p1;
@property (nonatomic, strong) NSString *p11;
@property (nonatomic, strong) NSString *sp1;

@end

@interface TestProperty2 : NSObject

@property (nonatomic, strong) NSString *p21;
@property (nonatomic, strong) NSObject *sp1;
@property (nonatomic, strong) NSString *sp2;

@end

@interface TestProperty3 : TestPropertySuper

@end

@interface UIButton (NMCategory)

@property(nonatomic,assign,getter = isDragEnable)   BOOL dragEnable;
@property(nonatomic,assign,getter = isAdsorbEnable) BOOL adsorbEnable;

@end

NS_ASSUME_NONNULL_END
