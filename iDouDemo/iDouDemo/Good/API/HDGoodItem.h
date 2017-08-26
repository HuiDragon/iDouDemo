//
//  HDGoodItem.h
//  iDouDemo
//
//  Created by Liuguiliang on 2017/8/21.
//  Copyright © 2017年 HuiDragon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HDGoodItem : NSObject
/**<#注释#>*/
@property (copy, nonatomic) NSString *available_since;
/**<#注释#>*/
@property (copy, nonatomic) NSString *desc;
/**<#注释#>*/
@property (assign, nonatomic) NSInteger ID;
/**<#注释#>*/
@property (strong, nonatomic) NSArray *images;
/**<#注释#>*/
@property (copy, nonatomic) NSString *price;
/**<#注释#>*/
@property (copy, nonatomic) NSString *title;






@end
