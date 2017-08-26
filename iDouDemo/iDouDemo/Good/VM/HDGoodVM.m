//
//  HDGoodVM.m
//  iDouDemo
//
//  Created by Liuguiliang on 2017/8/21.
//  Copyright © 2017年 HuiDragon. All rights reserved.
//

#import "HDGoodVM.h"

@implementation HDGoodVM

- (void)loadData {

    HDGoodListAPI *goodListAPi = [[HDGoodListAPI alloc] initWithPage:@"&10"];
    
    [goodListAPi startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        NSArray *array  = [HDGoodItem mj_objectArrayWithKeyValuesArray:request.responseObject];
        
        [self.successSubject sendNext:array];
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
    
        
    }];

}

- (void)loadGoodDetail:(NSString *)goodsID {
    
    HDGoodDetailAPI *goodDetailAPI = [[HDGoodDetailAPI alloc] initWithGoodsID:goodsID];
    
    [goodDetailAPI startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
    }];
}

@end
