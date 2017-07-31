//
//  HMdealCell.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/13.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMdealCell.h"

#import "HMOrderView.h"

@interface HMdealCell ()
@property (weak, nonatomic) IBOutlet UIButton *sureButton;

@property (weak, nonatomic) IBOutlet UIButton *deleatButton;

@property (weak, nonatomic) IBOutlet UIView *OrderMessageView;

@property(weak,nonatomic)HMOrderView * OrderView;


@property (weak, nonatomic) IBOutlet UILabel *GJLabel;
@property (weak, nonatomic) IBOutlet UILabel *HJLable;
@property (weak, nonatomic) IBOutlet UILabel *OrderNum;

@end

@implementation HMdealCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    HMOrderView * OrderView = [HMOrderView OrderView];
    
    _OrderView = OrderView;
    
    
//    OrderView.frame = self.OrderMessageView.bounds;
    
//    OrderView.width = HMLXScreenWidth - 30;
    
    _OrderView.frame = CGRectMake(15, 30, HMLXScreenWidth - 30, 130);
    
     [self addSubview:OrderView];
    
    
    self.sureButton.layer.borderColor = UIColorFromHex(0x989A99, 1).CGColor;
    
    self.sureButton.layer.borderWidth = 1;
    
    self.sureButton.layer.cornerRadius = 20/2;
    
    self.deleatButton.layer.borderColor = UIColorFromHex(0x989A99, 1).CGColor;
    
    self.deleatButton.layer.borderWidth = 1;
    
    self.deleatButton.layer.cornerRadius = 20/2;
}
- (IBAction)deleatOrderAction:(id)sender {
    
    __weak typeof(self)weakSelf = self;
    
    self.DeleatOrder(weakSelf.dicSouce);
}

+(instancetype)dealCellWithTableView:(UITableView *)tableView
{
    static NSString *identifier= @"deal";
    
    HMdealCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell==nil) {
        
        cell=[[[NSBundle mainBundle]loadNibNamed:@"HMdealCell" owner:nil options:nil]firstObject];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return cell;
}

-(void)setDicSouce:(NSDictionary *)dicSouce{
    
    _dicSouce = dicSouce;
    
    NSLog(@"%@",dicSouce);
    
    
    self.OrderView.dicSouce = dicSouce;
    
    self.GJLabel.text = [NSString stringWithFormat:@"共%ld件商品",[dicSouce[@"orderReq"][@"shopnumber"]integerValue]];
    
    
    self.HJLable.text = [NSString stringWithFormat:@"%.f", [dicSouce[@"orderReq"][@"shopzonggong"] floatValue]];
    
    self.OrderNum.text = [NSString stringWithFormat:@"订单号 ：%@",dicSouce[@"orderReq"][@"id"]];
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
