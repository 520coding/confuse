//
//  FontViewController.m
//  confuse_test_oc
//
//  Created by ymac on 27/09/2020.
//  Copyright © 2020 coding520. All rights reserved.
//

#import "FontViewController.h"

@interface FontViewController ()

@property (nonatomic,strong) UILabel *label;

@end

@implementation FontViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 320, 40)];
    [self.view addSubview:self.label];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, 100, 40)];
    [button setTitle:@"show font" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(testFont:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)testFont:(id)sender {
    [UIFont systemFontOfSize:11 weight:2];
    [UIFont systemFontOfSize:14];
    [UIFont systemFontOfSize:-1 + 14];
    [UIFont italicSystemFontOfSize:14];
    [UIFont boldSystemFontOfSize:13];
    [UIFont fontWithName:@"Helvetica-Oblique" size:11];
    if (@available(iOS 13.0, *)) {
        [UIFont monospacedSystemFontOfSize:13 weight:2];
    } else {
        // Fallback on earlier versions
    }
    [UIFont monospacedDigitSystemFontOfSize:14 weight:2];
    [self setWord];
}

- (void)setWord {
    self.label.text = @"https://github.com/520coding/confuse";
    self.label.font = [UIFont systemFontOfSize  :14];self.label.font = [UIFont systemFontOfSize  :18];
    self.label.font = [UIFont systemFontOfSize
                           :13];
    self.label.font = [UIFont systemFontOfSize :15];
    
    self.label.font = [UIFont systemFontOfSize : CELL_FONTSIZE];
    self.label.font = DEFAULT_FONT(13);
    self.label.font = DEFAULT_BOLDFONT(13);
    self.label.font = CELL_FONT(13);
    self.label.font = CELL_BOLDFONT(13);
}

@end
