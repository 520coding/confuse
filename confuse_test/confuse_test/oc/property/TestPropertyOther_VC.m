//
//  TestPropertyOther_VC.m
//  confuse_test
//
//  Created by yjs on 2020/10/26.
//  Copyright © 2020 coding520. All rights reserved.
//

#import "TestPropertyOther_VC.h"

@interface  TestPropertyOther_VC () <UITableViewDelegate, UITableViewDataSource>
{
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<NSString *> *dataSource;

@end

@interface TestPropertyOther_VC_Cell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;

@end

@implementation TestPropertyOther_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataSource = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        [_dataSource addObject:[NSString stringWithFormat:@"test_%d", i]];
    }
    [_tableView reloadData];
}

#pragma mark - dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TestPropertyOther_VC_Cell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TestPropertyOther_VC_Cell class]) forIndexPath:indexPath];
    cell.title.text = self.dataSource[indexPath.row];
    return cell;
}

#pragma mark - tableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return <#expression#>
//}

- (void)dealloc {
    NSLog(@"%@_dealoc:%@", [self class], self);
}

@end

@implementation TestPropertyOther_VC_Cell

@end
