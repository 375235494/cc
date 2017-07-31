//
//  HMLoadingErrorVeiw.h
//  HUAMAO
//
//  Created by 裴小康 on 2017/5/25.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol loadingErrorVeiwDelegate<NSObject>
@optional
-(void)loadingErrorViewDidClick;
@end

@interface HMLoadingErrorVeiw : UIView
@property(nonatomic, weak) id<loadingErrorVeiwDelegate> delegate;
@end
