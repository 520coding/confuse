//
//  TestLocalVariable.m
//  confuse_test_oc
//
//  Created by yjs on 2020/10/10.
//  Copyright © 2020 coding520. All rights reserved.
//

#import "TestLocalVariable.h"
#import <YYCategories.h>

UInt8 _float = 0;
typedef NSString *(^Block)(int *num);

@implementation TestLocalVariable

+ (void)test {
    for (NSString *k in @[@"test"]) {
        NSLog(@"%@", k);
    }
    for (int i = 0; i < 2; i++) {
        NSLog(@"%d", i);
    }

    NSInteger NSInteger1 = 0;
    NSLog(@"%ld", NSInteger1);
    NSInteger *NSInteger2 = &NSInteger1;
    NSLog(@"%ld", *NSInteger2);

    CGFloat lengths[] = { 2, 1 };
    NSLog(@"%f", lengths[0]);

    NSArray<NSString *> *array1 = @[];
    NSMutableArray<NSString *> *array2 = [NSMutableArray arrayWithArray:array1];
    NSLog(@"%@", array2);

    NSString * (^ block)(int *num) = nil;
    Block block2 = block;
    NSLog(@"%@", block2);

    UIView *view1 = [[UIView alloc] initWithFrame:CGRectZero];
    NSLog(@"%@", view1);
    UIView *view2 = [self view:^{
        UIView *view3 = [[UIView alloc] initWithFrame:CGRectZero];
        NSLog(@"%@", view3);
    }];
    NSLog(@"%@", view2);

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        NSLog(@"%@", label);
    });

    UISwitch *switch1 = [[UISwitch alloc] initWithFrame:CGRectZero];
    switch1.left = 0;
    NSLog(@"%@", switch1);
    
    NSData *data = @"{\"k\":\"v\"}".dataValue;
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"%@", result);
    
    id test = @"";
    NSLog(@"%@", test);
    
    NSDictionary *dic = @{};
    NSLog(@"%@", dic);

    [self otherNSFoundationTest];
    [self otherUIKitTest];
}

+ (UIView *)view:(void (^)(void))block {
    return nil;
}

+ (void)otherNSFoundationTest {
    NSString *string = @"";
    NSLog(@"string: %@", string);

    NSMutableString *mutableString = [NSMutableString stringWithString:string];
    NSLog(@"mutableString: %@", mutableString);

    NSArray *array = @[];
    NSLog(@"array: %@", array);

    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:array];
    NSLog(@"array: %@", mutableArray);

    NSDictionary *dictionary = @{};
    NSLog(@"dictionary: %@", dictionary);

    NSMutableDictionary *mutableDictionary = [NSMutableDictionary dictionaryWithDictionary:dictionary];
    NSLog(@"mutableDictionary: %@", mutableDictionary);

    NSSet *set = [NSSet set];
    NSLog(@"set: %@", set);

    NSMutableSet *mutableSet = [NSMutableSet setWithSet:set];
    NSLog(@"mutableSet: %@", mutableSet);

    NSData *data = [NSData data];
    NSLog(@"data: %@", data);

    NSMutableData *mutableData = [NSMutableData dataWithLength:0];
    NSLog(@"mutableData: %@", mutableData);

    NSNumber *number = @0;
    NSLog(@"number: %@", number);

    NSValue *value = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    NSLog(@"value: %@", value);

    NSURL *url = [NSURL URLWithString:@""];
    NSLog(@"url: %@", url);

    NSObject *object = [[NSObject alloc] init];
    NSLog(@"object: %@", object);
}

+ (void)otherUIKitTest {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    NSLog(@"label: %@", label);

    UIImage *image = [UIImage imageNamed:@""];
    NSLog(@"image: %@", image);

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    NSLog(@"imageView: %@", imageView);

    UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
    NSLog(@"button: %@", button);

    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectZero];
    NSLog(@"textField: %@", textField);

    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    NSLog(@"tableView: %@", tableView);

    UIFont *font = [UIFont systemFontOfSize:10];
    NSLog(@"font: %@", font);

    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    NSLog(@"scrollView: %@", scrollView);

    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    NSLog(@"view: %@", view);
}

@end
