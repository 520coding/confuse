//
//  User_M.h
//  confuse_test
//
//  Created by yjs on 2020/9/9.
//  Copyright © 2020 coding520. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension.h>
#import "Dog_M.h"

NS_ASSUME_NONNULL_BEGIN

@interface User_M : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSArray<Dog_M *> *dogs;

@end

NS_ASSUME_NONNULL_END
