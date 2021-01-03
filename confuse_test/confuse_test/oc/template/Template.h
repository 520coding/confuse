//
//  Template.h
//  confuse_test
//
//  Created by yjs on 2020/10/22.
//  Copyright © 2020 coding520. All rights reserved.
//

#import <UIKit/UIKit.h>

#define random_false false
#define random_bool YES
#define random_integer 0
#define random_decimal 1.0

#define random_NSRange NSMakeRange(1, 1)
#define random_UIEdgeInsets UIEdgeInsetsMake(0, 0, 0, 0)
#define random_CGPoint CGPointMake(0, 0)
#define random_CGSize CGSizeMake(0, 0)
#define random_CGRect CGRectMake(0, 0, 0, 0)
#define random_CGAffineTransform CGAffineTransformMake(0, 0, 0, 0, 0, 0)

#define random_Class nil
#define random_NSString @"yjs"
#define random_NSNumber @(1)
#define random_UIFont [UIFont systemFontOfSize:(0.0 + 10 + 20 + 0.0)]
#define random_UIColor [UIColor blackColor]
#define random_NSData [NSData data]
#define random_UIImage [UIImage imageNamed:random_NSString]

#define random_add_or_subtract -
#define random_multiply_or_divide *
#define random_negative !

NS_ASSUME_NONNULL_BEGIN

@interface Template : NSObject

+ (void)test;

@end


@interface TemplateView : UIView

@end

@interface TemplateLabel : UILabel

@end

@interface TemplateImage : UIImage

@end

@interface TemplateImageView : UIImageView

@end

@interface TemplateButton : UIButton

@end

@interface TemplateTextFiled : UITextField

@end

@interface TemplateTableView : UITableView

@end

NS_ASSUME_NONNULL_END
