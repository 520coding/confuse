//
//  TestLocalizableViewController.m
//  confuse_test
//
//  Created by ymac on 29/12/2020.
//  Copyright © 2020 coding520. All rights reserved.
//

#import "TestLocalizableViewController.h"

@interface TestLocalizableViewController ()

@end

@implementation TestLocalizableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 200, 200, 100)];
    label1.text = NSLocalizedString(@"key", nil);
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 300, 200, 100)];
    label2.text = Localizable(@"master");
    label2.text = LocalizableTable(@"master", @"File");
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(20, 400, 200, 100)];
    label3.text = @"是时候表演真正的技术了！";
    label3.text = NSLocalizedStringFromTable(@"me", @"File", nil);
    [self.view addSubview:label1];
    [self.view addSubview:label2];
    [self.view addSubview:label3];

    NSArray *array = @[
        @"特斯拉",
        @"比亚迪",
        @"保时捷",
        @"凯迪拉克",
        @"劳斯莱斯"
    ];
    NSLog(@"string array : %@", array);
    // Do any additional setup after loading the view.
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
