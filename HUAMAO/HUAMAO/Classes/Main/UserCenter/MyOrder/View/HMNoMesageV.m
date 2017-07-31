//
//  HMNoMesageV.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/15.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMNoMesageV.h"

@implementation HMNoMesageV

+(instancetype)NomessageV{
    
    return  [[[NSBundle mainBundle]loadNibNamed:@"HMNoMesageV" owner:self options:nil] lastObject];
}

@end
