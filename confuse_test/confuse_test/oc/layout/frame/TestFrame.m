//
//  TestFrame.m
//  confuse_test
//
//  Created by ymac on 10/10/2020.
//  Copyright © 2020 coding520. All rights reserved.
//

#import "TestFrame.h"

@implementation TestFrame

- (void)initFrame {
    self.width += 20.f;

    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    view.layer.borderWidth = 1.0;
    view.layer.shadowRadius =
        2.0;
    view.layer.cornerRadius = 3.0; view.layer.cornerRadius  = view.layer.borderWidth;

    [view.layer setBorderWidth:view.layer.borderWidth];
    [view.layer setShadowRadius:2.0];
    [view.layer setCornerRadius:3.0];

    [view setCenter:CGPointZero];
    view.center = CGPointMake(10, 10);

    CGRect smallRect = CGRectInset(view.frame, -10, 10);
    UIView *view1 = [[UIView alloc]initWithFrame:smallRect];
    view1.backgroundColor = [UIColor redColor];

    UIView *view2 = [[UIView alloc] initWithFrame:CGRectZero];
    view2.backgroundColor = [UIColor redColor];

    UIButton *button = [[UIButton alloc] init];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 5)];

    CGFloat x = view.frame.origin.x;
    CGFloat y = view.frame.origin.y;
    CGFloat w = view.frame.size.width;
    CGFloat h = view.frame.size.height;
    UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(x, y, w, h)];
    view3.backgroundColor = [UIColor redColor];

    CGSize size = CGSizeMake(1, 1);
    size.width += 0.1;
    size.height += 20.f;

    CGPoint origin = CGPointMake(0, 0);
    origin.x = 0.1;
    origin.x += 1;
    origin.x -= 1;
    origin.x *= 1;
    origin.x /= 1;
    origin.x++;
    origin.x--;
    ++origin.x;
    --origin.x;
}

@end
