//
//  YQDiscoverViewController.m
//  confuse_test_oc
//

#import "YQDiscoverViewController.h"
#import "YQDiscoverCell.h"
#import "YQDiscoverItem.h"
#import "YQEntryDetailViewController.h"
#import "YQSimpleListViewController.h"
#import "YQScanViewController.h"
#import "YQMacros.h"

@interface YQDiscoverViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, copy)   NSArray<YQDiscoverItem *> *entries;
@end

@implementation YQDiscoverViewController

- (void)setupUI {
    self.entries = [YQDiscoverItem allItems];

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 12;
    layout.minimumLineSpacing      = 12;
    layout.sectionInset            = UIEdgeInsetsMake(16, 16, 16, 16);

    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.collectionView.backgroundColor = YQBackgroundColor;
    self.collectionView.dataSource = self;
    self.collectionView.delegate   = self;
    [self.collectionView registerClass:[YQDiscoverCell class] forCellWithReuseIdentifier:NSStringFromClass([YQDiscoverCell class])];
    [self.view addSubview:self.collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.entries.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YQDiscoverCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([YQDiscoverCell class]) forIndexPath:indexPath];
    YQDiscoverItem *item = self.entries[indexPath.item];
    [cell configureWithIcon:item.iconName title:item.title];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)layout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat totalSpacing = 16 * 2 + 12 * 3;
    CGFloat width = (kYQScreenWidth - totalSpacing) / 4.0;
    return CGSizeMake(width, width + 8);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    YQDiscoverItem *item = self.entries[indexPath.item];
    UIViewController *vc = nil;
    switch (item.route) {
        case YQEntryRouteScan:
            vc = [[YQScanViewController alloc] init];
            break;
        case YQEntryRouteList:
            vc = [[YQSimpleListViewController alloc] initWithTitle:item.title rows:(item.rows ?: @[])];
            break;
        case YQEntryRouteDetail:
        default:
            vc = [[YQEntryDetailViewController alloc] initWithItem:item];
            break;
    }
    [self.navigationController pushViewController:vc animated:YES];
}

@end
