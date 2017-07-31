//
//  HMOrderCell.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/29.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMOrderCell.h"



@implementation HMOrderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    for(int i = 0 ; i < self.contentView.subviews.count ; i++){
        
        UIView * view = self.contentView.subviews[i];
        
        if(view.tag >= 100 ){
        
            UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapAction:)];
            
            [view addGestureRecognizer:tap];
            
        }
  
    }
    
}

-(void)TapAction:(UITapGestureRecognizer *)tap{
    
    if(self.Delegeat &&  [self.Delegeat respondsToSelector:@selector(cellAction:SelectIndex:)]){
        
        [self.Delegeat cellAction:self SelectIndex:tap.view.tag - 100];
    }
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
