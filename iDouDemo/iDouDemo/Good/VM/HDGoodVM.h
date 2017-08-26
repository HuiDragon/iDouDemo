//
//  HDGoodVM.h
//  iDouDemo
//
//  Created by Liuguiliang on 2017/8/21.
//  Copyright © 2017年 HuiDragon. All rights reserved.
//

#import "HDBaseVM.h"
#import "HDGoodListAPI.h"
#import "HDGoodDetailAPI.h"
#import "HDGoodItem.h"
#import <MJExtension/MJExtension.h>

@interface HDGoodVM : HDBaseVM

@property (strong, nonatomic) NSArray *dataSource;

- (void)loadData;

- (void)loadGoodDetail:(NSString *)goodsID;
@end
