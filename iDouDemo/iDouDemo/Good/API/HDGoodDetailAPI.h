//
//  HDGoodDetailAPI.h
//  iDouDemo
//
//  Created by Liuguiliang on 2017/8/22.
//  Copyright © 2017年 HuiDragon. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>

@interface HDGoodDetailAPI : YTKRequest

- (instancetype)initWithGoodsID:(NSString *)goodsID;

@end
