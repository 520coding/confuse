//
//  TestPropertyXibViewController.h
//  confuse_test
//
//  Created by yjs on 2020/9/9.
//  Copyright © 2020 coding520. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestPropertyXibViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *customViewLabel1;
@property (weak, nonatomic) IBOutlet UILabel *customViewLabel2;

@end

@interface TestPropertyXibView : UIView
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;

@end

NS_ASSUME_NONNULL_END
