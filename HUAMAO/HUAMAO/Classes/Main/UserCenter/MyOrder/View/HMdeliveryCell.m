//
//  HMdeliveryCell.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/13.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMdeliveryCell.h"

#import "HMOrderView.h"

@interface HMdeliveryCell ()

@property (weak, nonatomic) IBOutlet UIView *OrderMessageView;

@property(weak,nonatomic)HMOrderView * OrderView;

@property (weak, nonatomic) IBOutlet UILabel *GJLabel;
@property (weak, nonatomic) IBOutlet UILabel *HJLable;

@property (weak, nonatomic) IBOutlet UILabel *PeopelAndAdress;

@property (weak, nonatomic) IBOutlet UILabel *adress;

@property (weak, nonatomic) IBOutlet UILabel *OrderNum;

@property (weak, nonatomic) IBOutlet UIButton *payed;
@end

@implementation HMdeliveryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.payed.layer.borderColor = UIColorFromHex(0x989A99, 1).CGColor;
    
    self.payed.layer.borderWidth = 1;
    
    self.payed.layer.cornerRadius = 20/2;
    
    HMOrderView * OrderView = [HMOrderView OrderView];
    
    _OrderView = OrderView;
    
    
//    OrderView.frame = self.OrderMessageView.bounds;
//    
//    OrderView.width = HMLXScreenWidth - 30;
    _OrderView.frame = CGRectMake(15, 30, HMLXScreenWidth - 30, 130);
    
    
     [self addSubview:OrderView];
}


+(instancetype)deliveryCellWithTableView:(UITableView *)tableView
{
    static NSString *identifier= @"delivery";
    
    HMdeliveryCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell==nil) {
        
        cell=[[[NSBundle mainBundle]loadNibNamed:@"HMdeliveryCell" owner:nil options:nil]firstObject];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return cell;
}

-(void)setDicSouce:(NSDictionary *)dicSouce{
    
    _dicSouce = dicSouce;
    
    NSLog(@"%@",dicSouce);

    self.OrderView.dicSouce = dicSouce;
    
    self.GJLabel.text = [NSString stringWithFormat:@"共%ld件商品",[dicSouce[@"orderReq"][@"shopnumber"]integerValue]];
    
    
//    self.HJLable.text = [NSString stringWithFormat:@"合计: %.f", [dicSouce[@"orderReq"][@"shopzonggong"] floatValue]];
    
     self.HJLable.text = [NSString stringWithFormat:@"%.f", [dicSouce[@"orderReq"][@"shopzonggong"] floatValue]];
    
    self.adress.text = [NSString stringWithFormat:@"地址 :%@",dicSouce[@"address"]];
    
    self.PeopelAndAdress.text = [NSString stringWithFormat:@"收件人: %@  %@",dicSouce[@"oname"],dicSouce[@"phone"]];
    
//    _OrderView.frame = self.OrderMessageView.bounds;
    
    self.OrderNum.text = [NSString stringWithFormat:@"订单号 ：%@",dicSouce[@"orderReq"][@"id"]];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
