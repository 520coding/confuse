//
//  SCOrder.h
//  SCSDK
//
//  Created by Seven mac on 2018/12/26.
//  Copyright © 2018 SCDever. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCOrder : NSObject



/**
*  金额 单位：分
*/
@property (nonatomic, assign) int scTotalFee;

/**
*  对应的Apple道具产品Id
*/
@property (nonatomic, strong) NSString *ydProductId;

/**
 *  产品Id
 */
@property (nonatomic, strong) NSString *ydToolProductId;

/**
 *  订单号
 */
@property (nonatomic, strong) NSString *ydOrderId;

/**
 *  自定义信息
 */
@property (nonatomic, strong) NSString *ydCustomInfo;


/**
 *  商品名称
 */
@property (nonatomic, strong) NSString *ydProductName;

/**
 *  角色Id
 */
@property (nonatomic, strong) NSString *ydRoleName;

@end

NS_ASSUME_NONNULL_END
