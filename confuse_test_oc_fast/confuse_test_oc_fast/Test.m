//
//  Test.m
//  confuse_test_oc_fast
//
//  Created by yjs on 2023/3/29.
//

#import "Test.h"

@implementation Test

- (void)reloadData {
    self.title = self.name;
}

@end

@implementation Node

- (void)reloadData {
    self.title = self.name;
}

@end

@implementation foo

+ (foo *)foo:(foo *)fo {
    foo *f = [[foo alloc] init];
    return f.foo;
}

- (foo *)foo:(foo *)fo {
    return [fo.foo foo:fo.foo foo:^foo * (foo *f) {
        return [f.foo foo:f.foo foo:^foo *(foo *foo) {
            return [foo foo:foo];
        } foo:^foo *(foo *foo) {
            return [foo.foo foo:[foo foo:foo]];
        }];
    }];
}

- (foo *)foo:(foo *)fo foo:(foo * (^)(foo *))foo {
    return foo(fo);
}

- (foo *)foo:(foo *)fo foo:(foo * (^)(foo *foo))foo foo:(foo * (^)(foo *foo))fooo {
    return fooo(foo(fo));
}

@end
