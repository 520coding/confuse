//
//  TestPropertySuper.h
//  LMSKSDK
//
//  Created by yjs on 2020/9/7.
//  Copyright © 2020 dvcds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Base.h"

NS_ASSUME_NONNULL_BEGIN

@protocol TestPropertySuper <NSObject, Base>

@property (nonatomic, strong) NSString *sp2;
@property (nonatomic, strong) NSString *sp3;

@end

@interface TestPropertySuper : NSObject<UICollectionViewDelegate>

@property (nonatomic, strong) NSObject *sp1
        ;
@property (nonatomic, strong) NSObject *more;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *Age;
@property (nonatomic, strong) NSString *NICK;
@property (nonatomic, strong) NSString *nICK;
@property (nonatomic, assign) int height;

@end

@interface NSObject (TestPropertySuper) <TestPropertySuper>

@end

NS_ASSUME_NONNULL_END
