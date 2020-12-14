//
//  TestXibViewController.m
//  confuse_test
//
//  Created by ymac on 15/09/2020.
//  Copyright © 2020 coding520. All rights reserved.
//

#import "TestXibViewController.h"
#import "TestXibView.h"

@interface TestXibViewController ()
@property (weak, nonatomic) IBOutlet UILabel *xibLabel;
@property (weak, nonatomic) IBOutlet UIButton *xibButton;
@property (weak, nonatomic) IBOutlet UIImageView *xibImage;
@property (weak, nonatomic) IBOutlet TestXibView *xibView;

@end

@implementation TestXibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"TestXibViewController" owner:self options:nil];
    }
    return self;
}

- (IBAction)clickXibAction:(id)sender {
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
