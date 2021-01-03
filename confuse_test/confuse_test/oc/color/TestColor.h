//
//  TestColor.h
//  confuse_test
//
//  Created by ymac on 28/09/2020.
//  Copyright © 2020 coding520. All rights reserved.
//

#import <UIKit/UIKit.h>

//带有RGBA的颜色设置
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
 
//设置随机颜色(调试时候很有用)
#define RandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
 
//16进制颜色
#define RGB16Color(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

NS_ASSUME_NONNULL_BEGIN

@interface TestColor : UIView

@end

NS_ASSUME_NONNULL_END
