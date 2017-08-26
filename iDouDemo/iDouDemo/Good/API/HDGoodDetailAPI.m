//
//  HDGoodDetailAPI.m
//  iDouDemo
//
//  Created by Liuguiliang on 2017/8/22.
//  Copyright © 2017年 HuiDragon. All rights reserved.
//

#import "HDGoodDetailAPI.h"

@implementation HDGoodDetailAPI
{
    NSString *_goodsID;
}


- (instancetype)initWithGoodsID:(NSString *)goodsID {
    
    self = [super init];
    if (self) {
        _goodsID = goodsID;
    }
    
    return self;
}

- (NSString *)requestUrl {
    
    return @"/products";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

- (id)requestArgument {
    
    return @{
             @"id":_goodsID
             };
}


@end
