//
//  YQSimpleListViewController.m
//  confuse_test_oc
//

#import "YQSimpleListViewController.h"
#import "YQMacros.h"

static NSString * const kYQSimpleCellID = @"kYQSimpleCellID";

@interface YQSimpleListViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, copy)   NSString *navTitle;
@property (nonatomic, copy)   NSArray<NSDictionary *> *rows;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation YQSimpleListViewController

- (instancetype)initWithTitle:(NSString *)title rows:(NSArray<NSDictionary *> *)rows {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _navTitle = [title copy];
        _rows     = [rows copy];
    }
    return self;
}

- (void)setupUI {
    self.title = self.navTitle;

    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView.dataSource   = self;
    self.tableView.delegate     = self;
    self.tableView.rowHeight    = 64;
    self.tableView.tableFooterView = [UIView new];
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kYQSimpleCellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kYQSimpleCellID];
    }
    NSDictionary *row = self.rows[indexPath.row];
    cell.textLabel.text        = row[@"title"];
    cell.textLabel.font        = [UIFont systemFontOfSize:16];
    cell.detailTextLabel.text  = row[@"subtitle"];
    cell.detailTextLabel.textColor = YQSubTextColor;
    cell.imageView.image       = [UIImage systemImageNamed:row[@"icon"]];
    cell.imageView.tintColor   = YQThemeColor;
    cell.accessoryType         = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self showMessage:YQLocalized(@"common_coming_soon")];
}

@end
