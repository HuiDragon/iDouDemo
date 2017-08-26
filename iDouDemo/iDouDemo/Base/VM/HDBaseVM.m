//
//  HDBaseVM.m
//  iDouDemo
//
//  Created by Liuguiliang on 2017/8/21.
//  Copyright © 2017年 HuiDragon. All rights reserved.
//

#import "HDBaseVM.h"

@implementation HDBaseVM
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _loadingSubject = [RACSubject subject];
        _alertSubject = [RACSubject subject];
        _successSubject = [RACSubject subject];
        _failSubject = [RACSubject subject];
        
    }
    return self;
}
@end
