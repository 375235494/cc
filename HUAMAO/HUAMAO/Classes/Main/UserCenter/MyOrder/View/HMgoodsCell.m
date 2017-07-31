//
//  HMgoodsCell.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/13.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMgoodsCell.h"

#import "HMOrderView.h"

@interface HMgoodsCell()

@property (weak, nonatomic) IBOutlet UIView *OrderMessageView;

@property(weak,nonatomic)HMOrderView * OrderView;
@property (weak, nonatomic) IBOutlet UIButton *WLbutton;
@property (weak, nonatomic) IBOutlet UIButton *SHbutton;



@property (weak, nonatomic) IBOutlet UILabel *GJLabel;
@property (weak, nonatomic) IBOutlet UILabel *HJLable;

//@property (weak, nonatomic) IBOutlet UILabel *address;


@property (weak, nonatomic) IBOutlet UILabel *OrderNum;
@end

@implementation HMgoodsCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    // Initialization code
    
    HMOrderView * OrderView = [HMOrderView OrderView];
    
    _OrderView = OrderView;
    
    
//    OrderView.frame = self.OrderMessageView.bounds;
//    
//    OrderView.width = HMLXScreenWidth - 30;
    
     [self addSubview:OrderView];
    
//    
//    self.WLbutton.layer.borderColor = UIColorFromHex(0x989A99, 1).CGColor;
//    
//    self.WLbutton.layer.borderWidth = 1;
//    
//    self.WLbutton.layer.cornerRadius = 20/2;
    
    _OrderView.frame = CGRectMake(15, 30, HMLXScreenWidth - 30, 130);
    
    self.SHbutton.layer.borderColor = UIColorFromHex(0x989A99, 1).CGColor;
    
    self.SHbutton.layer.borderWidth = 1;
    
    self.SHbutton.layer.cornerRadius = 20/2;
}

- (IBAction)SureAction:(id)sender {
    
    
    __weak typeof(self)weakSelf = self;

    self.SureBlock(weakSelf.dicSouce);
    
}

+(instancetype)goodsCellWithTableView:(UITableView *)tableView
{
    static NSString *identifier= @"goods";
    
    HMgoodsCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell==nil) {
        
        cell=[[[NSBundle mainBundle]loadNibNamed:@"HMgoodsCell" owner:nil options:nil]firstObject];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setDicSouce:(NSDictionary *)dicSouce{
    
    _dicSouce = dicSouce;
    
    NSLog(@"%@",dicSouce);
    
    
    self.OrderView.dicSouce = dicSouce;
    
    self.GJLabel.text = [NSString stringWithFormat:@"共%ld件商品",[dicSouce[@"orderReq"][@"shopnumber"]integerValue]];
    
     self.HJLable.text = [NSString stringWithFormat:@"%.f", [dicSouce[@"orderReq"][@"shopzonggong"] floatValue]];
    
//    self.HJLable.text = [NSString stringWithFormat:@"合计: ￥%.2f", [dicSouce[@"orderReq"][@"shopzonggong"] floatValue]];
    
    
//    self.address.text = [NSString stringWithFormat:@"配送方式: %@",dicSouce[@"orderReq"][@"kdname"]];

     self.OrderNum.text = [NSString stringWithFormat:@"订单号 ：%@",dicSouce[@"orderReq"][@"id"]];
//    _OrderView.frame = self.OrderMessageView.bounds;
    
}

@end
