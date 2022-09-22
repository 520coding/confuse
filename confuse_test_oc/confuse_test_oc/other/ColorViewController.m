//
//  ColorViewController.m
//  confuse_test_oc
//
//  Created by ymac on 28/09/2020.
//  Copyright © 2020 coding520. All rights reserved.
//

#import "ColorViewController.h"

@implementation ColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, 320, 40)];
    [button setTitle:@"Change Color" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(testColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)testColor:(id)sender {
    self.view.backgroundColor = [UIColor colorWithRed:234
                                           green:112
                                            blue:1
                                           alpha:1];
    
    self.view.backgroundColor = [UIColor colorWithRed    :234 green:112 blue:1 alpha:1];
    self.view.backgroundColor = [UIColor colorWithRed:234 green:112 blue:1 alpha:1];
    self.view.backgroundColor = [UIColor colorWithWhite:21 alpha:1];[UIColor colorWithWhite:21 alpha:1];
    self.view.backgroundColor = [UIColor colorWithDisplayP3Red:23 green:21 blue:56 alpha:1];
    self.view.backgroundColor = [[UIColor alloc] initWithWhite:7 alpha:1];
    self.view.backgroundColor = [[UIColor alloc] initWithRed:43 green:98 blue:21 alpha:1];
    self.view.backgroundColor = [[UIColor alloc] initWithDisplayP3Red:87 green:34 blue:32 alpha:1];
    [self setColor];
}

- (void)setColor{
    self.view.backgroundColor = RandomColor;
    self.view.backgroundColor = RGB16Color(0xF45B3C);
    self.view.backgroundColor = COLOR(12,34,38,1);
}

@end
