//
//  HMlistView.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/7/3.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMlistView.h"

@implementation HMlistView

+(instancetype)listView{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"HMlistView" owner:self options:nil] lastObject];
}

@end
