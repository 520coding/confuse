#import <UIKit/UIKit.h>

#import "TemplateFileModel.h"

NS_ASSUME_NONNULL_BEGIN

#define cell_class  UILabel

@interface TemplateFileView : cell_class

@property (nonatomic, strong) UIImageView *public_image;
@property (nonatomic, strong) UIButton *public_button;
@property (nonatomic, strong) UILabel *public_label;

- (void)setFileModel:(TemplateFileModel *)model;
- (void)setPublicParent:(UIView *)view;
- (void)setPublicSender;

@end

NS_ASSUME_NONNULL_END
