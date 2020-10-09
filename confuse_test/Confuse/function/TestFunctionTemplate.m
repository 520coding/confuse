//
//  TestFunctionTemplate.m
//  confuse_test
//
//  Created by yjs on 2020/10/8.
//  Copyright © 2020 coding520. All rights reserved.
//

#import "TestFunctionTemplate.h"
#import "TestFunctionOtherTemplate.h"

@implementation TestFunctionTemplate

- (void)testNum1:(int)p11 p12:(short)p12 p13:(UInt8)p13 p14:(Byte)p14 p15:(NSInteger)p15 p21:(float)p21 p22:(double)p22 p23:(CGFloat)p23 p31:(BOOL)p31 p32:(Boolean)p32 _p:(NSString *)_p {
    if (_p) {
        if (p11 > (0 + 0 + 0 + 0)) {
            p11 = 0;
        }
    }
    if (_p) {
        if (p12 > (0 + 0 + 0 + 0)) {
            p12 = 0;
        }
    }
    if (_p) {
        if (p13 > (0 + 0 + 0 + 0)) {
            p13 = 0;
        }
    }
    if (_p) {
        if (p14 > (0 + 0 + 0 + 0)) {
            p14 = 0;
        }
    }
    if (_p) {
        if (p15 > (0 + 0 + 0 + 0)) {
            p15 = 0;
        }
    }
    if (_p) {
        if (p21 > (0 + 0 + 0 + 0)) {
            p21 = 0;
        }
    }
    if (_p) {
        if (p22 > (0 + 0 + 0 + 0)) {
            p22 = 0;
        }
    }
    if (_p) {
        if (p23 > (0 + 0 + 0 + 0)) {
            p23 = 0;
        }
    }
    if (_p) {
        if (p31 == true) {
            p31 = false;
        }
    }
    if (_p) {
        if (p32 > true) {
            p32 = false;
        }
    }
}

- (void)testString1:(NSString *)p1 _p:(NSString *)_p {
    if (_p) {
        p1 = [p1 stringByAppendingFormat:@"random_str_%@_%@", p1, NSStringFromSelector(_cmd)];
    }
}

- (void)testNSArray1:(NSArray *)p1 p2:(NSMutableArray *)p2 _p:(NSString *)_p {
    if (_p) {
        NSMutableArray *random_var = [NSMutableArray arrayWithArray:p1];
        [random_var addObject:NSStringFromClass([self class])];
        for (id obj in p1) {
            if (!obj) {
                [random_var removeObject:obj];
            }
        }
        p1 = random_var;
    }
    if (_p) {
        NSMutableArray *random_var = [NSMutableArray arrayWithArray:p2];
        [random_var addObject:NSStringFromClass([self class])];
        for (id obj in p2) {
            if (!obj) {
                [random_var removeObject:obj];
            }
        }
        p2 = random_var;
    }
}

- (void)testNSDictionary1:(NSDictionary *)p1 p2:(NSMutableDictionary *)p2 _p:(NSString *)_p {
    if (_p) {
        NSMutableDictionary *random_var = [NSMutableDictionary dictionaryWithDictionary:p1];
        for (NSString *k in p1.allKeys) {
            if ([k isEqualToString:@"random_str"]) {
                [random_var removeObjectForKey:k];
            }
        }
        p1 = random_var;
    }
    if (_p) {
        NSMutableDictionary *random_var = [NSMutableDictionary dictionaryWithDictionary:p2];
        for (NSString *k in p2.allKeys) {
            if ([k isEqualToString:@"random_str"]) {
                [random_var removeObjectForKey:k];
            }
        }
        p2 = random_var;
    }
}

- (void)testView1:(UIView *)p1 p2:(UIView *)p2 _p:(NSString *)_p {
    if (_p) {
        UIView *random_var = [[UIView alloc] initWithFrame:CGRectMake(0, 0, p1.frame.size.width, p1.frame.size.width)];
        random_var.backgroundColor = [UIColor whiteColor];
        random_var.alpha = (0.0 + 0.1 + 1 + 0.0);
        [p1 addSubview:random_var];
    }
}

- (void)testView2:(UIView *)p1 p2:(TestFunctionView *)p2 _p:(NSString *)_p {
    if (_p) {
        UIView *random_var = [[UIView alloc] initWithFrame:CGRectMake(0, 0, p1.frame.size.width - (0.0 + 02 + 10 + 0.0), p1.frame.size.width - (0.0 + 02 + 10 + 0.0))];
        random_var.backgroundColor = [UIColor blackColor];
        random_var.layer.borderWidth = (0.0 + 0.1 + 1 + 0.0);
        random_var.layer.borderColor = [[UIColor colorWithRed:(0.0 + 0 + 1 + 0.0) green:(0.0 + 0 + 1 + 0.0) blue:(0.0 + 0 + 1 + 0.0) alpha:(0.0 + 0 + 1 + 0.0) ] CGColor];
        [p1 addSubview:random_var];
    }
}

- (void)testLabel1:(UILabel *)p1 p2:(TestFunctionView *)p2 p3:(TestFunctionOtherTemplateLabel *)p3 _p:(NSString *)_p {
    if (_p) {
        UILabel *random_var = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, p1.frame.size.width / (0.0 + 02 + 06 + 0.0), p1.frame.size.width / (0.0 + 02 + 06 + 0.0))];
        random_var.font = [UIFont systemFontOfSize:(0.0 + 10 + 20 + 0.0) weight:(0.0 + 10 + 20 + 0.0)];
        random_var.textColor = [UIColor colorWithWhite:(0.0 + 0.1 + 1 + 0.0) alpha:(0.0 + 0.1 + 1 + 0.0)];
        [p1 addSubview:random_var];
    }
}

- (void)testImage1:(UIImage *)p1 p2:(TestFunctionImage *)p2 _p:(NSString *)_p {
    if (_p) {
        UIImage *random_var = [UIImage imageNamed:@"random_str"];
        if (p1.size.width <= 0 || p1.size.height <= 0) return;
        UIGraphicsBeginImageContextWithOptions(p1.size, NO, p1.scale);
        [random_var drawInRect:CGRectMake((0.0 + 0 + 10 + 0.0), (0.0 + 0 + 10 + 0.0), (0.0 + 10 + 20 + 0.0), (0.0 + 10 + 20 + 0.0))];
        p1 = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
}

- (void)testImageView1:(UIImageView *)p1 p2:(TestFunctionImageView *)p2 _p:(NSString *)_p {
    if (_p) {
        UIImageView *random_var = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, p1.frame.size.width / (0.0 + 02 + 06 + 0.0), p1.frame.size.width / (0.0 + 02 + 06 + 0.0))];
        random_var.image = [UIImage imageNamed:@"random_str"];
        random_var.backgroundColor = [UIColor colorWithWhite:(0.0 + 0.1 + 1 + 0.0) alpha:(0.0 + 0.1 + 1 + 0.0)];
        [p1 addSubview:random_var];
    }
}

- (void)testButton1:(UIButton *)p1 p2:(TestFunctionButton *)p2 _p:(NSString *)_p {
    if (_p) {
        UIButton *random_var = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, p1.frame.size.width / (0 + 02 + 06 + 0), p1.frame.size.width / (0.0 + 02 + 06 + 0.0))];
        [random_var setImage:[UIImage imageNamed:@"random_str"] forState:UIControlStateNormal];
        random_var.backgroundColor = [UIColor colorWithWhite:(0.0 + 0.0 + 0.0 + 0.0) alpha:(0.0 + 0 + 1 + 0.0)];
        [p1 addSubview:random_var];
    }
}

- (void)testObject1:(UITextField *)p1 p2:(TestFunctionTextFiled *)p2 _p:(NSString *)_p {
    if (_p) {
        UITextField *random_var = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, p1.frame.size.width / (0.0 + 02 + 06 + 0.0), p1.frame.size.width / (0.0 + 02 + 06 + 0.0))];
        random_var.backgroundColor = [UIColor colorWithWhite:(0.0 + 0.1 + 1 + 0.0) alpha:(0.0 + 0.1 + 1 + 0.0)];
        [p1 addSubview:random_var];
    }
}

- (void)testTableView1:(UITableView *)p1 p2:(TestFunctionTableView *)p2 _p:(NSString *)_p {
    if (_p) {
        p1.rowHeight = (0.0 + 02 + 40 + 0.0);
        p1.contentSize = CGSizeMake((0.0 + 0.1 + 1 + 0.0) * p1.numberOfSections, (0.0 + 0.1 + 1 + 0.0) * p1.numberOfSections);
        p1.contentOffset = CGPointMake((0.0 + 0.1 + 1 + 0.0) * p1.numberOfSections, (0.0 + 0.1 + 1 + 0.0) * p1.numberOfSections);
        p1.separatorColor = [UIColor colorWithWhite:(0.0 + 0.1 + 1 + 0.0) alpha:(0.0 + 0.1 + 1 + 0.0)];
    }
}

@end

@implementation TestFunctionView

@end

@implementation TestFunctionLabel

@end

@implementation TestFunctionImage

@end

@implementation TestFunctionImageView

@end

@implementation TestFunctionButton

@end

@implementation TestFunctionTextFiled

@end

@implementation TestFunctionTableView

@end
