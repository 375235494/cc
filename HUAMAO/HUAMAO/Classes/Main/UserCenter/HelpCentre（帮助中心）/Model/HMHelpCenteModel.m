//
//  HMHelpCenteModel.m
//  HUAMAO
//
//  Created by  on 2017/5/24.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMHelpCenteModel.h"
#import "HMContModel.h"

@implementation HMHelpCenteModel
+ (NSDictionary *)objectClassInArray {
    
    return @{@"cont": [HMContModel class]
             };
}
@end
