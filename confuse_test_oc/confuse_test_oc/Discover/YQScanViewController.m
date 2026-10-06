//
//  YQScanViewController.m
//  confuse_test_oc
//

#import "YQScanViewController.h"
#import "YQMacros.h"
#import <Masonry/Masonry.h>

@interface YQScanViewController ()
@property (nonatomic, strong) UIView  *scanFrame;
@property (nonatomic, strong) UIView  *scanLine;
@property (nonatomic, strong) UILabel *hintLabel;
@end

@implementation YQScanViewController

- (void)setupUI {
    self.title = YQLocalized(@"other_scan");
    self.view.backgroundColor = [UIColor blackColor];

    self.scanFrame = [[UIView alloc] init];
    self.scanFrame.layer.borderColor = YQThemeColor.CGColor;
    self.scanFrame.layer.borderWidth = 2;
    self.scanFrame.layer.cornerRadius = 12;
    self.scanFrame.clipsToBounds = YES;
    [self.view addSubview:self.scanFrame];

    self.scanLine = [[UIView alloc] init];
    self.scanLine.backgroundColor = YQThemeColor;
    [self.scanFrame addSubview:self.scanLine];

    self.hintLabel = [[UILabel alloc] init];
    self.hintLabel.text = YQLocalized(@"scan_hint");
    self.hintLabel.textColor = [UIColor whiteColor];
    self.hintLabel.font = [UIFont systemFontOfSize:14];
    self.hintLabel.textAlignment = NSTextAlignmentCenter;
    self.hintLabel.numberOfLines = 0;
    [self.view addSubview:self.hintLabel];

    [self.scanFrame mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(240, 240));
    }];
    [self.hintLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scanFrame.mas_bottom).offset(24);
        make.left.equalTo(self.view).offset(40);
        make.right.equalTo(self.view).offset(-40);
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self startScanAnimation];
}

- (void)startScanAnimation {
    self.scanLine.frame = CGRectMake(0, 0, 240, 2);
    [UIView animateWithDuration:1.8
                          delay:0
                        options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionCurveEaseInOut
                     animations:^{
        self.scanLine.frame = CGRectMake(0, 238, 240, 2);
    } completion:nil];
}

@end
