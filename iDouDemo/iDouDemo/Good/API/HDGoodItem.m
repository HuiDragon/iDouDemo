//
//  HDGoodItem.m
//  iDouDemo
//
//  Created by Liuguiliang on 2017/8/21.
//  Copyright © 2017年 HuiDragon. All rights reserved.
//

#import "HDGoodItem.h"
#import <MJExtension/MJExtension.h>

@implementation HDGoodItem


+ (NSDictionary *)mj_replacedKeyFromPropertyName {

    return @{@"ID":@"id",
             @"desc":@"description"};
}

@end
