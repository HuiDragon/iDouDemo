//
//  HDGoodListAPI.m
//  iDouDemo
//
//  Created by Liuguiliang on 2017/8/21.
//  Copyright © 2017年 HuiDragon. All rights reserved.
//

#import "HDGoodListAPI.h"

@implementation HDGoodListAPI
{
    NSString *_page;
}


- (instancetype)initWithPage:(NSString *)page {

    self = [super init];
    if (self) {
        _page = page;
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
             @"page":_page
             };
}

@end
