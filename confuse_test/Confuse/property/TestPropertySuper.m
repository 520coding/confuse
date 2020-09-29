//
//  TestPropertySuper.m
//  LMSKSDK
//
//  Created by yjs on 2020/9/7.
//  Copyright © 2020 dvcds. All rights reserved.
//

#import "TestPropertySuper.h"

@implementation TestPropertySuper

@end

@implementation NSObject (TestPropertySuper)

- (void)setSp2:(NSString *)sp2 {
}

- (NSString *)sp2 {
    return @"_1";
}

- (void)setSp3:(NSString *)sp3 {
}

- (NSString *)sp3 {
    return @"_sp3";
}

- (void)begin {
    
}

@end
