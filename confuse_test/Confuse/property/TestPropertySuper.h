//
//  TestPropertySuper.h
//  LMSKSDK
//
//  Created by yjs on 2020/9/7.
//  Copyright © 2020 dvcds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TestPropertySuper <NSObject,Base>

@property (nonatomic, strong) NSString *sp2;//测试 1.继承、多个类型继承是否统一
@property (nonatomic, strong) NSString *sp3;

@end

@interface TestPropertySuper : NSObject<UICollectionViewDelegate>

@property (nonatomic, strong) NSObject *sp1;
@property (nonatomic, strong) NSObject *more;//测试 多子类继承是否统一
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *Age;
@property (nonatomic, strong) NSString *NICK;
@property (nonatomic, strong) NSString *nICK;

@end

@interface NSObject (TestPropertySuper) <TestPropertySuper>

@end

NS_ASSUME_NONNULL_END
