//
//  HDBaseVM.h
//  iDouDemo
//
//  Created by Liuguiliang on 2017/8/21.
//  Copyright © 2017年 HuiDragon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

typedef NS_ENUM(NSInteger, HDLoadDataStatus) {

    HDLoadDataStatusLoading,
    HDLoadDataStatusFinished,
    HDLoadDataStatusFailed
};

@interface HDBaseVM : NSObject

@property (strong, nonatomic) RACSubject *loadingSubject;

@property (strong, nonatomic) RACSubject *alertSubject;

@property (strong, nonatomic) RACSubject *successSubject;

@property (strong, nonatomic) RACSubject *failSubject;

@end
