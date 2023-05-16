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
    NSString *_leftView;
    NSString *_rightView;
    NSString *_inputView;
}

@property (nonatomic, strong) NSString *editing;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) int count;
@property (nonatomic, strong) NSMutableArray *_text;
@property (nonatomic, strong) NSString *rowHeight;
@property (nonatomic, strong) void (^ attributedText)(void);
@property (nonatomic, strong) NSString * (^ font)(NSString *);
@property (nonatomic, strong) NSString * (^ textAlignment)(NSString *name);
@property (nonatomic, strong) NSString * (^ borderStyle)(NSString *name, NSString *title);
@property (nonatomic, strong) NSArray<NSString *> * (^ placeholder)(NSString *name, NSString *title);
@property (nonatomic, strong) Block1 textColor;
@property (nonatomic, strong) id zooming;
@property (nonatomic, strong) NSString *attributedPlaceholder, *clearsOnBeginEditing;
@property (nonatomic, strong, getter = hasBackground, setter = updateBackground:) NSString *background;
@property (nonatomic, strong, getter = hasDisabledBackground, setter = updateDisabledBackground:) NSString *disabledBackground;
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) UIView *view;
@property (nonatomic, assign) Boolean isRight;
@property (nonatomic, strong) NSString *help;


- (void)setLeftView:(NSString *)leftView;
- (NSString *)leftView;

- (void)testKvcKvo;

@end

@interface TestProperty1 : UILabel<TestPropertySuper>

@property (nonatomic, strong) NSString *editing;
@property (nonatomic, strong) NSString *contentSize;
@property (nonatomic, strong) NSString *delegate;

@end

@interface TestProperty2 : NSObject

@property (nonatomic, strong) NSString *decelerating;
@property (nonatomic, strong) NSObject *delegate;
@property (nonatomic, strong) NSString *bounces;

@end

@interface TestProperty3 : TestPropertySuper

@end

@interface UIButton (NMCategory)

@property(nonatomic,assign,getter = isDragEnable)   BOOL dragEnable;
@property(nonatomic,assign,getter = isAdsorbEnable) BOOL adsorbEnable;

@end

NS_ASSUME_NONNULL_END
