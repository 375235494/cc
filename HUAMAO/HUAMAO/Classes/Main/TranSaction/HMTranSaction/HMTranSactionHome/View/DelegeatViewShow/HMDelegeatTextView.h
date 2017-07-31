//
//  HMDelegeatTextView.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/7/22.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMDelegeatTextView : UIView

+(instancetype)DelegeatTextView;


@property(copy,nonatomic)void(^SureBlock)();

@end
