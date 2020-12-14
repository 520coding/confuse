//
//  TestFunctionXibViewController.m
//  confuse_test
//
//  Created by yjs on 2020/9/10.
//  Copyright © 2020 coding520. All rights reserved.
//

#import "TestFunctionXibViewController.h"

@interface TestFunctionXibViewController ()

@end

@implementation TestFunctionXibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)func:(id)sender {
    NSLog(@"%@", sender);
}

- (IBAction)action:(id)sender {
    NSLog(@"%@", sender);
}

- (IBAction)tap:(id)sender {
    NSLog(@"%@", sender);
}

- (IBAction)pinch:(id)sender {
    NSLog(@"%@", sender);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
