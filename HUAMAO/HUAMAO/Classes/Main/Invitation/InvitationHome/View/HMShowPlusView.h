//
//  HMShowPlusView.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/6.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMShowPlusView : UIView

@property(copy,nonatomic) NSString *yqmcode;

@property(copy,nonatomic) NSString *qrcode;


+(instancetype)ShowView;
@end
