//
//  YQFeedItem.m
//  confuse_test_oc
//

#import "YQFeedItem.h"
#import <YYModel/YYModel.h>

@implementation YQFeedItem

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"itemID"         : @"id",
        @"coverImageName" : @"cover",
        @"publishTime"    : @"publish_time",
        @"likeCount"      : @"like_count",
        @"readCount"      : @"read_count",
        @"commentCount"   : @"comment_count",
    };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{ @"tags" : [NSString class] };
}

- (NSString *)publishTimeText {
    if (self.publishTime <= 0) { return @""; }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.publishTime];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"MM-dd HH:mm";
    return [formatter stringFromDate:date];
}

@end

@implementation YQAuthor

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{ @"authorID": @"author_id", @"avatarName": @"avatar" };
}

@end
