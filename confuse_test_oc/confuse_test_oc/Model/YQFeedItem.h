//
//  YQFeedItem.h
//  confuse_test_oc
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class YQAuthor;

@interface YQFeedItem : NSObject

@property (nonatomic, copy)   NSString *itemID;
@property (nonatomic, copy)   NSString *title;
@property (nonatomic, copy)   NSString *summary;
@property (nonatomic, copy)   NSString *content;
@property (nonatomic, copy)   NSString *coverImageName;
@property (nonatomic, strong) YQAuthor *author;
@property (nonatomic, copy)   NSArray<NSString *> *tags;
@property (nonatomic, assign) NSInteger likeCount;
@property (nonatomic, assign) NSInteger readCount;
@property (nonatomic, assign) NSInteger commentCount;
@property (nonatomic, assign) NSTimeInterval publishTime;

@property (nonatomic, assign, getter=isFavorited) BOOL favorited;
@property (nonatomic, copy, readonly) NSString *publishTimeText;

@end

@interface YQAuthor : NSObject
@property (nonatomic, copy) NSString *authorID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *avatarName;
@end

NS_ASSUME_NONNULL_END
