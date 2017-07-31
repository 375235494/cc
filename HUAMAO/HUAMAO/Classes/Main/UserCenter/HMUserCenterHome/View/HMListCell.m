//
//  HMListCell.m
//  HUAMAO
//
//  Created by 孙密 on 17/5/18.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMListCell.h"

#import "HMButtonListView.h"

@interface HMListCell()
<ButtonListViewDelegeat>

@end

@implementation HMListCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self ==[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self CreatUI];
    }
    
    return self;
}

-(void)CreatUI
{
    
    UILabel *title = [[UILabel alloc]init];
    
    title.textColor = [UIColor whiteColor];
    
    title.text = @"个人中心";
    
    title.textColor = HMUIColorFromRgb(0xAEADAD);
    
    title.x = 10;
    
    title.height = 30;
    
    title.width =200;
    
    title.font = HMFontSIZE;
    
    
    title.backgroundColor = [UIColor blackColor];
    
    [self.contentView addSubview:title];
    
        HMButtonListView *ButtonListView = [[HMButtonListView alloc]init];
    
        ButtonListView.x = 0 ;
    
        ButtonListView.y = title.maxY;
    
//        ButtonListView.height = 200 * kHMScreenHeight_Case *2;
    
    ButtonListView.height = 237;
    
        ButtonListView.width = HMLXScreenWidth;
    
        ButtonListView.Delegeat =self;
    
        [ButtonListView ButtonListViewWithImages:@[@"账号中心",@"我的持仓",@"历史明细",@"营销中心",@"客服中心",@"帮助中心",@"APP下载",@"投诉建议",@"关于易购"] andAryTitle:@[@"账号中心",@"我的持仓",@"历史明细",@"推广中心",@"客服中心",@"帮助中心",@"充值记录",@"投诉建议",@"关于易购"]];
        
        [self.contentView addSubview:ButtonListView];
   
    
}

-(void)HMButtonListView:(HMButtonListView *)ButtonListView index:(NSInteger)index{
    
    
    if(self.Delegate && [self.Delegate respondsToSelector:@selector(LinstActionIndex:)]){
        
        
        [self.Delegate LinstActionIndex:index];
    }

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


+(instancetype)SListCellTableview:(UITableView *)tableview
{


    HMListCell *cell = [[self alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"CellSlist"];
    
    
    cell.backgroundColor =  UIColorFromHex(0x1b1b1b, 1);

    
    return cell;
}

+(CGFloat)HMCellHeigth
{
    
//    return 200 * kHMScreenHeight_Case *2 + 25;
    
    return 237;
}

@end
