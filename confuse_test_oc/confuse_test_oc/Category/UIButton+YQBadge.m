//
//  UIButton+YQBadge.m
//  confuse_test_oc
//

#import "UIButton+YQBadge.h"
#import <objc/runtime.h>

static const void *kYQBadgeValueKey     = &kYQBadgeValueKey;
static const void *kYQBadgeLabelKey      = &kYQBadgeLabelKey;
static const void *kYQHighlightStyleKey = &kYQHighlightStyleKey;

@implementation UIButton (YQBadge)

- (void)setYq_badgeValue:(NSString *)yq_badgeValue {
    objc_setAssociatedObject(self, kYQBadgeValueKey, yq_badgeValue, OBJC_ASSOCIATION_COPY_NONATOMIC);

    UILabel *badge = objc_getAssociatedObject(self, kYQBadgeLabelKey);
    if (yq_badgeValue.length == 0) {
        badge.hidden = YES;
        return;
    }
    if (!badge) {
        badge = [[UILabel alloc] init];
        badge.translatesAutoresizingMaskIntoConstraints = NO;
        badge.backgroundColor = [UIColor redColor];
        badge.textColor       = [UIColor whiteColor];
        badge.font            = [UIFont systemFontOfSize:10];
        badge.textAlignment   = NSTextAlignmentCenter;
        badge.layer.cornerRadius = 8;
        badge.clipsToBounds   = YES;
        [self addSubview:badge];
        // 用约束把角标钉在按钮右上角，避免依赖创建时机的 bounds
        [NSLayoutConstraint activateConstraints:@[
            [badge.centerXAnchor constraintEqualToAnchor:self.trailingAnchor constant:-8],
            [badge.centerYAnchor constraintEqualToAnchor:self.topAnchor constant:8],
            [badge.heightAnchor  constraintEqualToConstant:16],
            [badge.widthAnchor   constraintGreaterThanOrEqualToAnchor:badge.heightAnchor],
        ]];
        objc_setAssociatedObject(self, kYQBadgeLabelKey, badge, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    badge.hidden = NO;
    badge.text   = [NSString stringWithFormat:@" %@ ", yq_badgeValue];
}

- (NSString *)yq_badgeValue {
    return objc_getAssociatedObject(self, kYQBadgeValueKey);
}

- (void)setYq_highlightStyle:(BOOL)yq_highlightStyle {
    objc_setAssociatedObject(self, kYQHighlightStyleKey, @(yq_highlightStyle), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.layer.borderWidth = yq_highlightStyle ? 1.0 : 0.0;
    self.layer.borderColor = [UIColor yq_colorWithHex:0xFF6034].CGColor;
}

- (BOOL)isYq_highlightStyle {
    return [objc_getAssociatedObject(self, kYQHighlightStyleKey) boolValue];
}

@end
