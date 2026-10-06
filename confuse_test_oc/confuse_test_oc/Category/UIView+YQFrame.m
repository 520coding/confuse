//
//  UIView+YQFrame.m
//  confuse_test_oc
//

#import "UIView+YQFrame.h"

@implementation UIView (YQFrame)

- (CGFloat)yq_x { return self.frame.origin.x; }
- (void)setYq_x:(CGFloat)yq_x {
    CGRect frame = self.frame;
    frame.origin.x = yq_x;
    self.frame = frame;
}

- (CGFloat)yq_y { return self.frame.origin.y; }
- (void)setYq_y:(CGFloat)yq_y {
    CGRect frame = self.frame;
    frame.origin.y = yq_y;
    self.frame = frame;
}

- (CGFloat)yq_width { return self.frame.size.width; }
- (void)setYq_width:(CGFloat)yq_width {
    CGRect frame = self.frame;
    frame.size.width = yq_width;
    self.frame = frame;
}

- (CGFloat)yq_height { return self.frame.size.height; }
- (void)setYq_height:(CGFloat)yq_height {
    CGRect frame = self.frame;
    frame.size.height = yq_height;
    self.frame = frame;
}

- (CGFloat)yq_centerX { return self.center.x; }
- (void)setYq_centerX:(CGFloat)yq_centerX {
    self.center = CGPointMake(yq_centerX, self.center.y);
}

- (CGFloat)yq_centerY { return self.center.y; }
- (void)setYq_centerY:(CGFloat)yq_centerY {
    self.center = CGPointMake(self.center.x, yq_centerY);
}

@end
