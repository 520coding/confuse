//
//  TestColor.m
//  confuse_test
//
//  Created by ymac on 28/09/2020.
//  Copyright © 2020 coding520. All rights reserved.
//

#import "TestColor.h"

@implementation TestColor

- (IBAction)testColor:(id)sender {
    self.backgroundColor = [UIColor colorWithRed:234
                                           green:112
                                            blue:1
                                           alpha:1];
    
    self.backgroundColor = [UIColor colorWithRed    :234 green:112 blue:1 alpha:1];
    self.backgroundColor = [UIColor colorWithRed:234 green:112 blue:1 alpha:1];
    self.backgroundColor = [UIColor colorWithWhite:21 alpha:1];[UIColor colorWithWhite:21 alpha:1];
    self.backgroundColor = [UIColor colorWithDisplayP3Red:23 green:21 blue:56 alpha:1];
    self.backgroundColor = [[UIColor alloc] initWithWhite:7 alpha:1];
    self.backgroundColor = [[UIColor alloc] initWithRed:43 green:98 blue:21 alpha:1];
    self.backgroundColor = [[UIColor alloc] initWithDisplayP3Red:87 green:34 blue:32 alpha:1];
    [self setColor];
}

- (void)setColor{
    self.backgroundColor = RandomColor;
    self.backgroundColor = RGB16Color(0xF45B3C);
    self.backgroundColor = COLOR(12,34,38,1);
}

@end
