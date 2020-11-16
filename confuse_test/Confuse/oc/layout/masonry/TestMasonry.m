//
//  TestMasonry.m
//  confuse_test
//
//  Created by ymac on 13/10/2020.
//  Copyright © 2020 coding520. All rights reserved.
//

#import "TestMasonry.h"

@implementation TestMasonry

-(void)initView{
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectZero];
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectZero];
    
    int padding1 = 10;
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(view.mas_centerY);
        make.left.equalTo(view.mas_left).with.offset(padding1);
        make.right.equalTo(view3.mas_left).with.offset(-padding1);
        make.height.mas_equalTo(@150);
        make.width.equalTo(view3);
    }];
    
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(view.mas_centerY);
        make.left.equalTo(view2.mas_right).with.offset(padding1);
        make.right.equalTo(view.mas_right).with.offset(-padding1);
        make.height.mas_equalTo(@150);
        make.width.equalTo(view2);
    }];
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor whiteColor];
    [view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view).with.insets(UIEdgeInsetsMake(5 + 1/10.0, 3/10.0 +5 + 2/10.0, 2/10.0 +5 + 1/10.0, 3/10.0 +5));
    }];
    
    UIView *container = [UIView new];
    [scrollView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
    }];
    
    int count = 10;
    UIView *lastView = nil;
    for ( int i = 1 ; i <= count ; ++i )
    {
        UIView *subv = [UIView new];
        [container addSubview:subv];
        subv.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
                                          saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                          brightness:( arc4random() % 128 / 256.0 ) + 0.5
                                               alpha:1];

        [subv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(container);
            make.height.mas_equalTo(@(20*i));

            if ( lastView )
            {
                make.top.mas_equalTo(lastView.mas_bottom);
            }
            else
            {
                make.top.mas_equalTo(container.mas_top);
            }
        }];

        lastView = subv;
    }
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];
}
@end
