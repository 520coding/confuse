//
//  TestPropertySuper.m
//  LMSKSDK
//
//  Created by yjs on 2020/9/7.
//  Copyright © 2020 dvcds. All rights reserved.
//

#import "TestPropertySuper.h"

@implementation TestPropertySuper

-(void)setAge:(NSString *)Age {
    
}

-(NSString *)Age{
    return @"1";
}

- (void)setName:(NSString *)name {
    
}

- (void)setNICK:(NSString *)nIqweCK {
    
}

-(NSString *)NICK {
    [self setNICK:@"1"];
//    self.nICK = @"4";
//    self.NICK = @"4";
    return @"2";
}

- (NSString *)nICK {
    return @"3";
}

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
