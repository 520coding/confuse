//
//  TestFunctionInject.m
//  confuse_test
//
//  Created by yjs on 2020/10/14.
//  Copyright © 2020 coding520. All rights reserved.
//

#import "TestFunctionInject.h"

@implementation TestFunctionInject

- (NSString *)test_systemVersion {
    return [[UIDevice currentDevice] systemVersion];
}

- (NSString *)test_secondInt {
    double secondTime = [[[NSDate alloc]init]timeIntervalSince1970];
    NSString *secondTimeStr = [NSString stringWithFormat:@"%f", secondTime];
    NSRange pointRange = [secondTimeStr rangeOfString:@"."];
    return [secondTimeStr substringToIndex:pointRange.location];
}

- (NSString *)test_bundleVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

- (NSString *)test_getDiskSpace {
    NSError *error = nil;
    NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    if (error) return nil;
    int64_t space =  [[attrs objectForKey:NSFileSystemSize] longLongValue];
    if (space < 0) space = -1;
    return [NSString stringWithFormat:@"%lld", space];
}

- (NSString *)test_getTotalMemory {
    int64_t totalMemory = [[NSProcessInfo processInfo] physicalMemory];
    return [NSString stringWithFormat:@"%lld", totalMemory];
}

- (NSString *)test_getDocumentPath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

- (NSString *)test_getLibraryPath {
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
}

- (NSString *)test_getCachePath {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}

- (NSString *)test_dealWithString:(id)obj {
    if (obj == nil || [obj isEqual:[NSNull null]]) return @"";
    if ([obj isKindOfClass:[NSString class]]) {
        if ([obj isEqualToString:@""]) return @"";
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimString = [obj stringByTrimmingCharactersInSet:set];
        if ([trimString length] == 0) return @"";
    }
    return @"";
}

- (NSString *)test_fileName {
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    format.dateFormat = @"yyyyMMddhhmmss";
    return [format stringFromDate:[NSDate date]];
}

- (NSString *)test_randomString {
    char random_var[8];
    for (int i = 0; i < 8; i++) {
        int j = random() % 93 + 33;
        char c = j;
        random_var[i] = c;
    }
    return [[NSString alloc]initWithBytes:&random_var length:8 encoding:NSASCIIStringEncoding];
}

- (NSString *)test_createTransId {
    @synchronized(self)
    {
        unsigned long random_var = 0;
        NSNumber *number = [[NSUserDefaults standardUserDefaults] objectForKey:NSStringFromSelector(_cmd)];
        if (number) {
            random_var = [number unsignedLongValue] + 1;
        } else {
            random_var = [[[NSDate alloc] init] timeIntervalSince1970];
        }
        [[NSUserDefaults standardUserDefaults] setValue:@(random_var) forKey:NSStringFromSelector(_cmd)];
        [[NSUserDefaults standardUserDefaults] synchronize];
        return [NSString stringWithFormat:@"%lu", random_var];
    }
}

- (NSString *)test_theScreenScale {
    static CGFloat screenScale = 0.0;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if ([NSThread isMainThread]) {
            screenScale = [[UIScreen mainScreen] scale];
        } else {
            dispatch_sync(dispatch_get_main_queue(), ^{
                screenScale = [[UIScreen mainScreen] scale];
            });
        }
    });
    return [NSString stringWithFormat:@"%f", screenScale];
}

- (NSString *)test_theRequestPath {
    return [NSString stringWithFormat:@"%@", NSStringFromSelector(_cmd)];
}

- (NSString *)test_getRandomData {
    return [NSString stringWithFormat:@"%ld", (long)arc4random_uniform(arc4random())];
}

- (NSString *)test_jsonStringEncoded {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error;
        NSString *random_var = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:self options:0 error:&error] encoding:NSUTF8StringEncoding];
        return random_var;
    }
    return nil;
}

- (NSString *)test_appBundleName {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
}

- (NSString *)test_appBundleID {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];
}

- (NSString *)test_appVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

- (NSString *)test_appBuildVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

- (NSString *)test_systemVersionOnce {
    static double version;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        version = [UIDevice currentDevice].systemVersion.doubleValue;
    });
    return [NSString stringWithFormat:@"%f", version];
}

- (NSString *)test_isPadOrNot {
    static dispatch_once_t one;
    static BOOL pad;
    dispatch_once(&one, ^{
        pad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
    });
    return [NSString stringWithFormat:@"%d", pad];
}

- (NSString *)test_randomName {
    return NSStringFromClass([self class]);
}

@end

