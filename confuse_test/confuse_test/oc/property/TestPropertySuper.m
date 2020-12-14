//
//  TestPropertySuper.m
//  LMSKSDK
//
//  Created by yjs on 2020/9/7.
//  Copyright © 2020 dvcds. All rights reserved.
//

#import "TestPropertySuper.h"

@implementation TestPropertySuper

- (void)setAge:(NSString *)Age {
}

- (NSString *)Age {
    return @"1";
}

- (void)setName:(NSString *)name {
}

- (void)setNICK:(NSString *)nIqweCK {
}

- (NSString *)NICK {
    [self setNICK:@"1"];
    //    self.nICK = @"4";
    //    self.NICK = @"4";
    return @"2";
}

- (NSString *)nICK {
    return @"3";
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _height = 0;
        _height = 1;
        _height = 2;
        self.height = 3;
        dispatch_async(dispatch_get_main_queue(), ^{
            self->_height = 4;
        });
    }
    return self;
}

- (void)other {
    
}
- (Boolean)test {
    _name = @"1";
    if ([_name isEqual:@""]) {
        NSLog(@"%@", self.name);
    }
    [self other];
    _name = @"2";
    dispatch_async(dispatch_get_main_queue(), ^{
        self->_name = @"3";
    });
    if (self.height == 1) return false;
    if (self.height == 2) {
        _name = @"4";
        NSLog(@"%d", _height);
    }
    if (self.height == 2)
    {
        NSLog(@"%d", _height);
    }
    return self.height == 3;
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
