//
//  TestClassCell.h
//  confuse_test_oc
//
//  Created by yjs on 2020/11/14.
//  Copyright © 2020 coding520. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestClassCell : UITableViewCell

@end

/* Points. */
struct MyPoint {
    CGFloat x;
    CGFloat y;
};
typedef struct MyPoint JSPoint;

/* Sizes. */
struct MySize {
    CGFloat width;
    CGFloat height;
};
typedef struct MySize JSSize;

@protocol OcFileDataProtocol <NSObject>

@end

@interface LBHomeMatchUserTotalModel : NSObject<OcFileDataProtocol>

@end

NS_ASSUME_NONNULL_END
