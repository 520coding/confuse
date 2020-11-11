//
//  SCOrder.m
//  SCSDK
//
//  Created by Seven mac on 2018/12/26.
//  Copyright © 2018 SCDever. All rights reserved.
//

#import "SCOrder.h"
@implementation SCOrder

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{ @"ydTotalFee": @"amount",
              @"ydProductId": @"productNo",
              @"ydProductName": @"orderName",
              @"ydRoleName": @"userName",
              @"ydOrderId": @"orderNo",
              @"ydCustomInfo": @"userpara" };
}

- (void)setScTotalFee:(int)totalFee
{
    _scTotalFee = abs(totalFee);
}

@end
