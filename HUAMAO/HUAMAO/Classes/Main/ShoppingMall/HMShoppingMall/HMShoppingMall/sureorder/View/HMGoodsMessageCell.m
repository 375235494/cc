
//
//  HMGoodsMessageCell.m
//  HUAMAO
//
//  Created by karl_pei on 2017/7/3.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMGoodsMessageCell.h"

@interface HMGoodsMessageCell ()<UITextViewDelegate>
//买家留言
@property (weak, nonatomic) IBOutlet UILabel *userMessage;

@property (weak, nonatomic) IBOutlet UITextView *messageTextView;


//购卖数量
@property (weak, nonatomic) IBOutlet UILabel *PayNumber;

//发货时间
@property (weak, nonatomic) IBOutlet UILabel *sendTime;
//数量
@property (weak, nonatomic) IBOutlet UILabel *goodsNumber;
//商品详询
@property (weak, nonatomic) IBOutlet UILabel *goodsDetails;
//商品图片
@property (weak, nonatomic) IBOutlet UIImageView *goodsImage;
//商品总价
@property (weak, nonatomic) IBOutlet UILabel *totleMoney;

@end

@implementation HMGoodsMessageCell


- (void)awakeFromNib {
    [super awakeFromNib];
    self.messageTextView.hidden = NO;
    self.messageTextView.delegate = self;
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

-(void)textViewDidChange:(UITextView *)textView
{
    self.messageTextView = textView;
    
    if (textView.text.length == 0) {
        self.userMessage.text = @"买家留言：";
    }else{
        self.userMessage.text = @"";
    } 
}

-(void) setOtherDetailsModel:(HMSureOtherModel *)otherDetailsModel
{
    _otherDetailsModel = otherDetailsModel;
    
    self.goodsDetails.text = otherDetailsModel.csummary;
    
    self.goodsNumber.text = [NSString stringWithFormat:@"%@ x%@",otherDetailsModel.cname,_shopnumber];
    
    ;
    
    self.sendTime.text = @"发货时间：72小时内发货";
    
    [self.goodsImage sd_setImageWithURL:[NSURL URLWithString:otherDetailsModel.cimg] placeholderImage:[UIImage imageNamed:@"Zhanwei"]];

}

- (void)setShopnumber:(NSString *)shopnumber
{

    _shopnumber = shopnumber;
    
    self.PayNumber.text = shopnumber;

}

- (void)setAddressMode:(HMAddressModel *)addressMode
{
    
    NSLog(@"%@",addressMode.shopprice);
    _addressMode = addressMode;
   self.totleMoney.text = [NSString stringWithFormat:@"共计%@件商品 %@",_shopnumber,addressMode.shopzonggong];
}



#pragma textViewDelegate

- (void)textViewDidEndEditing:(UITextView *)textView
{

    NSString *messageStr = self.messageTextView.text;
    
    NSDictionary *userInfoDict = @{@"messageStr":messageStr};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"sendMessageStrt" object:self userInfo:userInfoDict];

}


@end
