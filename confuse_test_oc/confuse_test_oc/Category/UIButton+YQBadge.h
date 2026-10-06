//
//  UIButton+YQBadge.h
//  confuse_test_oc
//
//  给按钮加角标（分类 + 关联对象）；含自定义 getter 的分类属性
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (YQBadge)

/// 角标文案，nil 或空串隐藏角标
@property (nonatomic, copy, nullable) NSString *yq_badgeValue;

/// 是否使用高亮描边样式（自定义 getter，验证混淆保持 getter/属性一致）
@property (nonatomic, assign, getter=isYq_highlightStyle) BOOL yq_highlightStyle;

@end

NS_ASSUME_NONNULL_END
