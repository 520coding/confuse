//
//  TestClassCell.m
//  confuse_test_oc
//
//  Created by yjs on 2020/11/14.
//  Copyright © 2020 coding520. All rights reserved.
//

#import "TestClassCell.h"

@implementation TestClassCell

- (void)awakeFromNib {
    [super awakeFromNib];
    struct MySize s1;
    s1.width = 0.1;
    struct MyPoint p1;
    p1.x = 0.1;
    JSSize s2;
    s2.height = 1;
    JSPoint p2;
    p2.y = 2;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

@implementation LBHomeMatchUserTotalModel

@end
