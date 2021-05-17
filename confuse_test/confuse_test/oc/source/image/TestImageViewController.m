//
//  TestImageViewController.m
//  confuse_test
//
//  Created by yjs on 2020/11/2.
//  Copyright © 2020 coding520. All rights reserved.
//

#import "TestImageViewController.h"
#import "TestImageModel.h"

@interface TestImageViewController ()<UITableViewDataSource>
{
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<TestImageModel *> *dataSource;
@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *imageMiddle;
@property (weak, nonatomic) IBOutlet UIImageView *imageBottom;

@end

@implementation TestImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIImage imageNamed:@"error"];
    [UIImage imageNamed:@"my_fox"];
    [UIImage imageNamed:@"timg-21"];
    UILabel *label = [[UILabel alloc] init];
    label.text = @"swift";
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:@"swift" forState:UIControlStateNormal];
    [UIImage imageNamed:[NSString stringWithFormat:@"timg-%d", 3]];
    [UIImage imageNamed:@"oc"];
    [UIImage imageNamed:@"lua"];
    [UIImage imageNamed:@"swift"];

    for (int i = 1; i<=3; i++) {
        [UIImage imageNamed:[NSString stringWithFormat:@"number%lu", (unsigned long)i]];
    }
    [[NSBundle mainBundle] pathForResource:@"锤石" ofType:@"png"];
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"锤石.png" ofType:nil];
    _imageMiddle.image = [UIImage imageWithContentsOfFile:imagePath];
    _imageBottom.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Lee Sin" ofType:@"jpg"]];
//    _imageBottom.image = [UIImage imageNamed:@"Lee Sin.jpg"];
    _dataSource = [NSMutableArray array];
    NSDictionary *data = @{
        @"timg": @"我疯了?呵,很有可能",
        @"zhongguo": @"中国",
        @"dangjianhuodong": @"党",
        @"bayijianjunjie": @"八一",
        @"yjs.png": @"discard file png",
        @"discard_lajitong": @"discard.xcassets",
        @"Lee Sin.jpg": @"image file",
    };
    for (NSString *k in data.allKeys) {
        TestImageModel *model = [[TestImageModel alloc] init];
        model.image = k;
        model.title = data[k];
        [_dataSource addObject:model];
    }
    [self.tableView reloadData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TestImageCell" forIndexPath:indexPath];
    TestImageModel *model = _dataSource[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:model.image];
    cell.textLabel.text = model.title;
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
