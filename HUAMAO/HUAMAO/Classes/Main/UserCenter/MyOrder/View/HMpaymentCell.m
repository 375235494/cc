//
//  HMpaymentCell.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/13.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMpaymentCell.h"

#import "HMOrderView.h"



@interface HMpaymentCell ()
@property (weak, nonatomic) IBOutlet UIView *OrderMessageView;
@property (weak, nonatomic) IBOutlet UILabel *GJLabel;
@property (weak, nonatomic) IBOutlet UILabel *HJLable;

@property(weak,nonatomic)HMOrderView * OrderView;
@property (weak, nonatomic) IBOutlet UIButton *cancelbutton;

@property (weak, nonatomic) IBOutlet UIButton *payButton;

@property(copy,nonatomic)ActionBlock cancel;

@property(copy,nonatomic)ActionBlock Pay;


@property (weak, nonatomic) IBOutlet UILabel *OrderNum;

@end

@implementation HMpaymentCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    // Initialization code
    HMOrderView * OrderView = [HMOrderView OrderView];
    
    _OrderView = OrderView;
    
//    OrderView.frame = self.OrderMessageView.bounds;
//    
//    OrderView.width = HMLXScreenWidth - 30;
    
    _OrderView.frame = CGRectMake(15, 50, HMLXScreenWidth - 30, 130);
    
    [self addSubview:OrderView];
    
    self.cancelbutton.layer.borderColor = UIColorFromHex(0x989A99, 1).CGColor;
    
    self.cancelbutton.layer.borderWidth = 1;
    
    self.cancelbutton.layer.cornerRadius = 20/2;
    
    self.payButton.layer.borderColor = UIColorFromHex(0x989A99, 1).CGColor;
    
    self.payButton.layer.borderWidth = 1;
    
    self.payButton.layer.cornerRadius = 20/2;
    
}

-(void)cancelActionBlock:(ActionBlock)cancelAction andPayActionBlock:(ActionBlock)PayBlock{
    
    self.cancel = cancelAction;
    
    self.Pay = PayBlock;
    
}


- (IBAction)CanceAction:(UIButton *)sender {
    
    __weak typeof(self) weakSelf = self;
    
    self.cancel(weakSelf.dicSouce);
    
}
- (IBAction)PayAction:(id)sender {
    
    __weak typeof(self) weakSelf = self;
    
    self.Pay(weakSelf.dicSouce);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)paymentCellWithTableView:(UITableView *)tableView
{
     static NSString *identifier= @"payment";
    
     HMpaymentCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    
     if (cell==nil) {

         cell=[[[NSBundle mainBundle]loadNibNamed:@"HMpaymentCell" owner:nil options:nil]firstObject];
         
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
    
//    self.HJLable.text = [NSString stringWithFormat:@"合计: ￥%.2f", [dicSouce[@"orderReq"][@"shopzonggong"] floatValue]];
    
//    _OrderView.frame = self.OrderMessageView.bounds;
    
}

@end
