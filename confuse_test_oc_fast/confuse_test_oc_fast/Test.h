//
//  Test.h
//  confuse_test_oc_fast
//
//  Created by yjs on 2023/3/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Test : NSObject

@property (nonatomic, assign) NSString *title;
@property (nonatomic, assign) NSString *name;

- (void)reloadData;

@end

@interface Node : NSObject

@property (nonatomic, assign) NSString *title;
@property (nonatomic, assign) NSString *name;

- (void)reloadData;

@end

@interface foo : NSObject

@property (nonatomic, strong) foo *foo;

+ (foo *)foo:(foo *)fo;
- (foo *)foo:(foo *)fo;
- (foo *)foo:(foo *)fo foo:(foo * (^)(foo *foo))foo;
- (foo *)foo:(foo *)fo foo:(foo * (^)(foo *foo))foo foo:(foo * (^)(foo *foo))fooo;

@end

NS_ASSUME_NONNULL_END
