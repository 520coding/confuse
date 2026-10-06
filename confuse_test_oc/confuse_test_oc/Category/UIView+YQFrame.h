//
//  UIView+YQFrame.h
//  confuse_test_oc
//
//  frame 便捷读写（分类属性，自定义 getter/setter 实现）
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YQFrame)

@property (nonatomic, assign) CGFloat yq_x;
@property (nonatomic, assign) CGFloat yq_y;
@property (nonatomic, assign) CGFloat yq_width;
@property (nonatomic, assign) CGFloat yq_height;
@property (nonatomic, assign) CGFloat yq_centerX;
@property (nonatomic, assign) CGFloat yq_centerY;

@end

NS_ASSUME_NONNULL_END
