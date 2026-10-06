//
//  YQBaseViewController.h
//  confuse_test_oc
//
//  控制器基类
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YQBaseViewController : UIViewController

/// 子类重写以搭建界面（父类空实现）
- (void)setupUI;

/// 子类重写以加载数据（父类空实现）
- (void)loadData;

/// 顶部轻提示（默认时长）
- (void)showMessage:(NSString *)message;

/// 顶部轻提示（指定时长）—— 与上面构成重载
- (void)showMessage:(NSString *)message duration:(NSTimeInterval)duration;

@end

NS_ASSUME_NONNULL_END
