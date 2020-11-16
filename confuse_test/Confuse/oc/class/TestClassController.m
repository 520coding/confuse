//
//  TestClassController.m
//  confuse_test
//
//  Created by ymac on 12/11/2020.
//  Copyright © 2020 coding520. All rights reserved.
//

#import "TestClassController.h"
#import "TestClassCell.h"

typedef animal Animal;

@interface TestClassController () <UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;


@end

@implementation TestClassController

- (void)viewDidLoad
{
    [super viewDidLoad];
    animal* a = [[Animal alloc] init];
    NSLog(@"animal: %@", a);
    NSLog(@"%@", NSStringFromClass([Animal class]));
    NSLog(@"%@", NSStringFromClass([animal class]));
    NSLog(@"%@", NSClassFromString(@"animal"));
    [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    [[NSBundle mainBundle] loadNibNamed:@"TestClassController" owner:self options:nil];
    [UINib nibWithNibName:@"TestClassCell" bundle:nil];
    NSLog(@"%@",@"TestClassController");
    NSLog(@"%@",@"ContainTestClassController");
    NSLog(@"%@",@"ContainTestClassControllerContainTestClassController_ContainTestClassController");
    [_tableView registerNib:[UINib nibWithNibName:@"TestClassCell" bundle:nil] forCellReuseIdentifier:@"TestClassCell"];
    [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TestClassCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([TestClassCell class])];

    // Do any additional setup after loading the view from its nib.
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    if (indexPath.row) {
        TestClassCell* cell = [tableView dequeueReusableCellWithIdentifier:@"TestClassCell"];
        if (!cell) {
            cell = [[NSBundle mainBundle] loadNibNamed:@"TestClassCell" owner:self options:nil].firstObject;
        }
        return cell;
    } else {
        TestClassCell* cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TestClassCell class])];
        if (!cell) {
            cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([TestClassCell class]) owner:self options:nil].firstObject;
        }
        return cell;
    }
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

@interface animal ()
@end

@implementation animal //animal类的实现
- (void)showAnimalaName
{
    NSLog(@"测试一个文件包含多个类");
}

@end

@implementation animal (YJS)
@end

@implementation person //person类的实现

@end
