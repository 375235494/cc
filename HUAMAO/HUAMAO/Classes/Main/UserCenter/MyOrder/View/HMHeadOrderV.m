//
//  HMHeadOrderV.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/13.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMHeadOrderV.h"

@interface HMHeadOrderV ()

@property(weak,nonatomic)UIView * SelectView;

@end

@implementation HMHeadOrderV

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    for(int i = 0 ; i< self.subviews.count ; i++){
        
        UIView * view = self.subviews[i];
        
//        view.tag = 1000+i;
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tagAction:)];
        
        
        [view addGestureRecognizer:tap];
 
        
    }
    
}


-(void)tagAction:(UITapGestureRecognizer *)tap;
{
    UIView * view = tap.view;
    
    
    if(view == self.SelectView) return;
    
    
    
    UILabel * lable = [view viewWithTag:10];
    
    UIView * viewLine = [view viewWithTag:11];
    
    lable.textColor = [UIColor redColor];
    
    viewLine.backgroundColor = [UIColor redColor];
    
    
    UILabel * slectlable = [self.SelectView viewWithTag:10];
    
    UIView * slectviewLie = [self.SelectView viewWithTag:11];
    
    slectlable.textColor = UIColorFromHex(0x989A99, 1);
    
    slectviewLie.backgroundColor = [UIColor blackColor];
    
    
    self.SelectView = view;
    
    
    if(self.Delegeat && [self.Delegeat respondsToSelector:@selector(HeadOrderV:SelectIndex:)]){
        
        [self.Delegeat HeadOrderV:self SelectIndex:tap.view.tag - 1000];
    }
    
}

-(void)setSelectIndex:(NSInteger)selectIndex{
    
    _selectIndex = selectIndex;
    
    UIView * view = [self  viewWithTag:1000 + selectIndex];
    
    self.SelectView = view;
    
    UILabel * lable = [view viewWithTag:10];
    
    UIView * viewLine = [view viewWithTag:11];
    
    lable.textColor = [UIColor redColor];
    
    viewLine.backgroundColor = [UIColor redColor];
    
}

//
+(instancetype)HeadVIew{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"HMHeadOrderV" owner:self options:nil] lastObject];
}

@end
