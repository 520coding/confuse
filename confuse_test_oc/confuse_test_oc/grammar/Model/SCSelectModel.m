//
//  SCSelectModel.m
//  SCSDK
//
//  Created by SCDever on 2018/12/25.
//  Copyright © 2018 SCDever. All rights reserved.
//

#import "SCSelectModel.h"

@implementation SCSelectModel

+ (NSDictionary *)modelCustomPropertyMapper
{
    return @{
        @"scSelectId": @"id",
        @"scSelectName": @"name",
        @"scSelectUrl": @"icon",
        @"scCode": @"pcode",
        @"scIsSelect": @"isSelect"
    };
}

@end

@implementation SCOrderInfoModel

+ (NSDictionary *)modelCustomPropertyMapper
{
    return @{ @"scOrderKeyString": @"orderKeyString",
              @"scOrderValueString": @"orderValueString" };
}

@end

@implementation SCSectionsModel

+ (NSDictionary *)modelCustomPropertyMapper
{
    return @{ @"scSectionName": @"sectionName" };
}

@end

@implementation SCSelectArrayModel

+ (NSDictionary *)modelCustomPropertyMapper
{
    return @{ @"scTitle": @"title",
              @"scSelectModels": @"content",
              @"scOrderInfoModels": @"orderInfos",
              @"scSectionsModels": @"sections" };
}

+ (NSDictionary *)modelContainerPropertyGenericClass
{
    return @{ @"scSelectModels": [SCSelectModel class],
              @"scOrderInfoModels": [SCOrderInfoModel class],
              @"scSectionsModels": [SCSectionsModel class]};
}

@end
