//
//  HMMonyCell.h
//  HUAMAO
//
//  Created by 孙密 on 17/5/18.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol  HMMonyCellDelegate <NSObject>

-(void)withdrawalButtonAction;

-(void)topUUpButtonAction;


@end

@interface HMMonyCell : UITableViewCell

@property(strong,nonatomic) NSNumber *strMony;

@property(weak,nonatomic) id<HMMonyCellDelegate>Delegate;

+(instancetype)MonyCell;

+(CGFloat)MonyCellHeigth;

@end
