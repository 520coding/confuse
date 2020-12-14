//
//  TestPropertyViewController.m
//  confuse_test
//
//  Created by yjs on 2020/9/9.
//  Copyright © 2020 coding520. All rights reserved.
//

#import "TestPropertyViewController.h"
#import "TestProperty.h"
#import "TestPropertyXibViewController.h"

@interface TestPropertyViewController ()

@property (strong, nonatomic) IBOutletCollection(UISwitch) NSArray *collections;

@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@end

@implementation TestPropertyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[[TestProperty alloc] init] begin];
    // Do any additional setup after loading the view.
}

- (IBAction)testKvcKvo:(id)sender {
    [[[TestProperty alloc] init] testKvcKvo];
}

- (IBAction)click:(id)sender {
    NSLog(@"%@", sender);
}

- (IBAction)button2:(id)sender {
    NSLog(@"%@", sender);
}

- (IBAction)push:(id)sender {
    TestPropertyXibViewController *xibvc = [[TestPropertyXibViewController alloc]initWithNibName:@"TestPropertyXibViewController" bundle:nil];
    [self.navigationController pushViewController:xibvc animated:YES];
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
