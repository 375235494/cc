//
//  HMMoreCell.m
//  HUAMAO
//
//  Created by 裴小康 on 2017/5/21.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMMoreCell.h"
#import "HMMoreArrowItem.h"

@implementation HMMoreCell

+ (instancetype)cellWithTableView:(UITableView *)tableView cellStyle:(UITableViewCellStyle)cellStyle
{
    static NSString *ID = @"cell";
    
    HMMoreCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[HMMoreCell alloc] initWithStyle:cellStyle reuseIdentifier:ID];
        
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        
        cell.textLabel.textColor = HMUIColorFromRgbAlpha(0xa0a0a0, 1);
    
        cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
        
         cell.detailTextLabel.textAlignment = NSTextAlignmentCenter;//文字居中
        
        cell.backgroundColor = HMUIColorFromRgbAlpha(0x191919, 1);
        
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

- (void)setItem:(HMMoreItem *)item
{
    _item = item;

    // 设置子控件数据
    [self setUpData];
    // 设置辅助视图
//    [self setUpAccessoryView];
    
}

-(void)setFrame:(CGRect)frame
{
//    frame.size.height -= 1;
    frame.origin.y += 1;
    [super setFrame:frame];
    
}


- (void)setUpData
{
   

    self.imageView.image = _item.image;
    self.textLabel.text = _item.title;
    self.detailTextLabel.text = _item.detailTitle;
}
// 设置辅助视图
- (void)setUpAccessoryView
{
    if ([_item isKindOfClass:[HMMoreArrowItem class]]) {
        // 展示箭头
        UIImageView *arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ios_icon_btn"]];
         self.accessoryView = arrowView;
     
    }else{//显示为空
        
        self.accessoryView = nil;
    
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}


@end
