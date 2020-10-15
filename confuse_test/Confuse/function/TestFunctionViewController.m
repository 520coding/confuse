//
//  TestFunctionViewController.m
//  confuse_test
//
//  Created by yjs on 2020/9/10.
//  Copyright © 2020 coding520. All rights reserved.
//

#import "TestFunctionViewController.h"
#import "TestFunctionXibViewController.h"
#import "TestFunction.h"

@interface TestFunctionViewController ()

@end

@implementation TestFunctionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[[TestFunction alloc] init] begin];
    // Do any additional setup after loading the view.
}

- (IBAction)testFunc:(id)sender {
    NSLog(@"%@", sender);
}

- (IBAction)func:(id)sender {
    NSLog(@"%@", sender);
}

- (IBAction)pushXib:(id)sender {
    TestFunctionXibViewController *xibvc = [[TestFunctionXibViewController alloc]initWithNibName:@"TestFunctionXibViewController" bundle:nil];
    [self.navigationController pushViewController:xibvc animated:YES];
}

- (void)f1 {
}

- (void)f2:(NSString *)p1 {
}

- (void)f3:(NSString *)p1 f2:(int)p2 {
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
