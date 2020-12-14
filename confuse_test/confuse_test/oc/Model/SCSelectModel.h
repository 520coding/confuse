//
//  SCSelectModel.h
//  SCSDK
//
//  Created by SCDever on 2018/12/25.
//  Copyright © 2018 SCDever. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCSelectModel : NSObject
@property (nonatomic, assign) int scSelectId;
@property (nonatomic, strong) NSString *scSelectName;
@property (nonatomic, strong) NSString *scSelectUrl;
@property (nonatomic, strong) NSString *scCode;
@property (nonatomic, assign) BOOL scIsSelect;
@end

@interface SCOrderInfoModel : NSObject

@property (nonatomic, strong) NSString *scOrderKeyString;
@property (nonatomic, strong) NSString *scOrderValueString;

@end

@interface SCSectionsModel : NSObject

@property (nonatomic, strong) NSString *scSectionName;

@end

@interface SCSelectArrayModel : NSObject
@property (nonatomic, strong) NSString *scTitle;
@property (nonatomic, strong) NSArray <SCSelectModel *> *scSelectModels;
@property (nonatomic, strong) NSArray <SCOrderInfoModel *> *scOrderInfoModels;
@property (nonatomic, strong) NSArray <SCSectionsModel *> *scSectionsModels;
@end

NS_ASSUME_NONNULL_END
