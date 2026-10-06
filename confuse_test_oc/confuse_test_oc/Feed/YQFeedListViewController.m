//
//  YQFeedListViewController.m
//  confuse_test_oc
//

#import "YQFeedListViewController.h"
#import "YQFeedDetailViewController.h"
#import "YQFeedCell.h"
#import "YQFeedItem.h"
#import "YQAPIClient.h"
#import "YQConst.h"
#import "YQMacros.h"

@interface YQFeedListViewController () <UITableViewDataSource, UITableViewDelegate, YQFeedCellDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<YQFeedItem *> *items;
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, assign) BOOL      hasMore;
@property (nonatomic, assign) BOOL      loadingMore;
@property (nonatomic, strong) UIView                  *footerView;
@property (nonatomic, strong) UIActivityIndicatorView *footerSpinner;
@property (nonatomic, strong) UILabel                 *footerLabel;
@end

@implementation YQFeedListViewController

- (void)setupUI {
    self.title    = YQLocalized(@"feed_title");
    self.items    = [NSMutableArray array];
    self.hasMore  = YES;

    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView.dataSource   = self;
    self.tableView.delegate     = self;
    self.tableView.rowHeight    = 88;
    [self.view addSubview:self.tableView];

    NSString *cellID = NSStringFromClass([YQFeedCell class]);
    [self.tableView registerNib:[UINib nibWithNibName:cellID bundle:nil] forCellReuseIdentifier:cellID];

    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    [refresh addTarget:self action:@selector(handleRefresh:) forControlEvents:UIControlEventValueChanged];
    self.tableView.refreshControl = refresh;

    [self setupFooter];
}

- (void)setupFooter {
    self.footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kYQScreenWidth, 48)];
    self.footerSpinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
    self.footerSpinner.center = CGPointMake(kYQScreenWidth / 2.0, 24);
    self.footerSpinner.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    [self.footerView addSubview:self.footerSpinner];
    self.footerLabel = [[UILabel alloc] initWithFrame:self.footerView.bounds];
    self.footerLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.footerLabel.font = [UIFont systemFontOfSize:13];
    self.footerLabel.textColor = YQSubTextColor;
    self.footerLabel.textAlignment = NSTextAlignmentCenter;
    self.footerLabel.hidden = YES;
    [self.footerView addSubview:self.footerLabel];
    self.tableView.tableFooterView = self.footerView;
}

- (void)loadData { [self refreshFeed:nil]; }

- (void)handleRefresh:(UIRefreshControl *)sender { [self refreshFeed:sender]; }

- (void)refreshFeed:(UIRefreshControl *)refresh {
    YQWeakSelf(self);
    [[YQAPIClient sharedClient] loadFeedPage:1 pageSize:YQFeedPageSize completion:^(NSArray<YQFeedItem *> *items, NSError *error) {
        YQStrongSelf(self);
        [refresh endRefreshing];
        if (error) { [self showMessage:YQLocalized(@"feed_load_failed")]; return; }
        self.currentPage = 1;
        self.hasMore     = items.count > 0;
        [self.items removeAllObjects];
        [self.items addObjectsFromArray:items];
        [self.tableView reloadData];
        [self updateFooter];
    }];
}

- (void)loadMore {
    if (self.loadingMore || !self.hasMore) { return; }
    self.loadingMore = YES;
    [self updateFooter];
    NSInteger nextPage = self.currentPage + 1;
    YQWeakSelf(self);
    [[YQAPIClient sharedClient] loadFeedPage:nextPage pageSize:YQFeedPageSize completion:^(NSArray<YQFeedItem *> *items, NSError *error) {
        YQStrongSelf(self);
        self.loadingMore = NO;
        if (error) { [self updateFooter]; return; }
        if (items.count > 0) {
            self.currentPage = nextPage;
            [self.items addObjectsFromArray:items];
            [self.tableView reloadData];
        } else {
            self.hasMore = NO;
        }
        [self updateFooter];
    }];
}

- (void)updateFooter {
    if (self.loadingMore) {
        self.footerLabel.hidden = YES;
        [self.footerSpinner startAnimating];
    } else {
        [self.footerSpinner stopAnimating];
        BOOL end = !self.hasMore && self.items.count > 0;
        self.footerLabel.hidden = !end;
        self.footerLabel.text = YQLocalized(@"feed_no_more");
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section { return self.items.count; }

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YQFeedCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([YQFeedCell class]) forIndexPath:indexPath];
    cell.delegate = self;
    [cell configureWithItem:self.items[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.items.count - 1) { [self loadMore]; }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    YQFeedDetailViewController *detail = [[YQFeedDetailViewController alloc] initWithItem:self.items[indexPath.row]];
    [self.navigationController pushViewController:detail animated:YES];
}

- (void)feedCell:(YQFeedCell *)cell didTapFavorite:(YQFeedItem *)item {
    NSString *tip = item.isFavorited ? YQLocalized(@"feed_faved") : YQLocalized(@"feed_unfaved");
    [self showMessage:tip];
}

@end
