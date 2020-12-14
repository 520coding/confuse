//
//  TestClassController.h
//  confuse_test
//
//  Created by ymac on 12/11/2020.
//  Copyright © 2020 coding520. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestClassController : UIViewController

@end

@interface animal : NSObject
@property(nonatomic,strong)NSString* ministration;
-(void)showAnimalaName;
@end

@interface animal(YJS)
@end


@interface person : NSObject
@property(nonatomic,strong)NSString* name;
@property (nonatomic, strong) animal *animal;

@end

NS_ASSUME_NONNULL_END
