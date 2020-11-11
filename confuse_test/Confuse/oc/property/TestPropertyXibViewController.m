//
//  TestPropertyXibViewController.m
//  confuse_test
//
//  Created by yjs on 2020/9/9.
//  Copyright © 2020 coding520. All rights reserved.
//

#import "TestPropertyXibViewController.h"

@interface TestPropertyXibViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *propertyLabels;
@property (weak, nonatomic) IBOutlet UIButton *propertyButton;
@property (weak, nonatomic) IBOutlet UIImageView *propertImage;

@end

@implementation TestPropertyXibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

@interface TestPropertyXibView ()

@property (nonatomic, strong) UIView *view;

@end

@implementation TestPropertyXibView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self jsInit];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self jsInit];
    }
    return self;
}

- (void)jsInit {
    [self addSubview:_view];
    _view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil][0];
    [self addSubview:_view];
    [_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

@end
