
//  HMHistoryDetailsCell.m
//  HUAMAO
//  Created by 裴小康 on 2017/5/22.
//  Copyright © 2017年 陈臣. All rights reserved.
#import "HMHistoryDetailsCell.h"

@interface HMHistoryDetailsCell ()
//cell背景框
@property (weak, nonatomic) IBOutlet UIView *bgView;
//交易品种
@property (weak, nonatomic) IBOutlet UILabel *woodsTypeLab;
//开始时间
@property (weak, nonatomic) IBOutlet UILabel *addTimeLab;
//结束时间
@property (weak, nonatomic) IBOutlet UILabel *endTimeLab;
//周期
@property (weak, nonatomic) IBOutlet UILabel *tzpLab;
//下单金额
@property (weak, nonatomic) IBOutlet UILabel *money;

@property (weak, nonatomic) IBOutlet UIImageView *typeImage;

//方向
@property (weak, nonatomic) IBOutlet UILabel *typeLab;
//点位明细
@property (weak, nonatomic) IBOutlet UILabel *priceLab;
//平仓点
@property (weak, nonatomic) IBOutlet UILabel *endPrice;
//进度条图标
@property (weak, nonatomic) IBOutlet UIImageView *progressBarImage;
//角标（盈或亏）
@property (weak, nonatomic) IBOutlet UIImageView *CornerImage;
@property (weak, nonatomic) IBOutlet UILabel *resultTitle;
@property (weak, nonatomic) IBOutlet UIImageView *endTimeImage;


@end

@implementation HMHistoryDetailsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.bgView.layer.cornerRadius = 5;
    self.bgView.layer.masksToBounds = YES;
    self.backgroundColor = HMColor(0, 0, 0);
}

- (void)setHistoryModel:(HMHistoryDetailsModel *)historyModel
{
    _historyModel = historyModel;
    
    self.money.text = [NSString stringWithFormat:@"%@豆",historyModel.money];
    
    //品种
    if (HMLXScreenWidth > 325) {
        self.woodsTypeLab.text = historyModel.name;
        
         self.endTimeLab.text = [historyModel.endtimestr  substringFromIndex:11];
        
    }else{
        
        self.woodsTypeLab.text = historyModel.name;
        self.woodsTypeLab.font = [UIFont systemFontOfSize:19];
        self.endTimeLab.hidden = YES;
        self.endTimeImage.hidden = YES;
    
    }
    //方向
//    self.typeLab.textAlignment = NSTextAlignmentCenter;
//    self.typeLab.layer.cornerRadius = 3;
//    self.typeLab.layer.masksToBounds = YES;
    
    self.typeLab.hidden = YES;
    
    
    if (historyModel.type.integerValue == -1) {//卖
        
        self.typeImage.image = [UIImage imageNamed:@"bucguo"];
//        self.typeLab.text = @"低";
//        self.typeLab.backgroundColor = HMColor(31, 129, 33);
    
    } else {//购
        
        self.typeImage.image = [UIImage imageNamed:@"cguo"];
//        self.typeLab.text = @"超";
//        self.typeLab.backgroundColor = HMColor(251, 13, 27);
    }
    //周期
    self.tzpLab.text = [NSString stringWithFormat:@"%ldM",(long)historyModel.tzq.integerValue];
    
    self.addTimeLab.text = [historyModel.addtimestr  substringFromIndex:11];
    

    
//    //开始交易金额
//    self.priceLab.text = historyModel.price;
//    
//    //结束交易金额
//    self.endPrice.text = historyModel.endprice;
    
    
    //开始交易金额
    self.priceLab.text = [self reviseString:historyModel.price];
    
    //结束交易金额
    self.endPrice.text = [self reviseString:historyModel.endprice];

    
    double price = [historyModel.price doubleValue];
    double endprice =[historyModel.endprice doubleValue];
    

    if (historyModel.type.integerValue == -1) {//看低
        
        if (price > endprice) {//盈利
            
            self.progressBarImage.image = [UIImage imageNamed:@"pying"];
            
            self.CornerImage.image = [UIImage imageNamed:@"jying"];
            
           
            [self.resultTitle setTextColor:HMColor(241,3,3)];
        }else if(price < endprice){//亏损
            self.progressBarImage.image = [UIImage imageNamed:@"pkui"];
            self.CornerImage.image = [UIImage imageNamed:@"jkui-"];
            [self.resultTitle setTextColor:HMColor(31,129,33)];

        }else{//相等（收取手续费，即为亏损状态）
            self.progressBarImage.image = [UIImage imageNamed:@"pkui"];
            self.CornerImage.image = [UIImage imageNamed:@"jkui-"];

            [self.resultTitle setTextColor:HMColor(31,129,33)];
        }
    }else if(historyModel.type.integerValue == 1){//竞购
    
        if (price > endprice) {//亏损
            
            self.progressBarImage.image = [UIImage imageNamed:@"pkui"];
             self.CornerImage.image = [UIImage imageNamed:@"jkui-"];

            [self.resultTitle setTextColor:HMColor(31,129,33)];
            
        }else if(price < endprice){//盈利
            self.progressBarImage.image = [UIImage imageNamed:@"pying"];
            self.CornerImage.image = [UIImage imageNamed:@"jying"];

            [self.resultTitle setTextColor:HMColor(241,3,3)];
        }else{
            self.progressBarImage.image = [UIImage imageNamed:@"pkui"];
            self.CornerImage.image = [UIImage imageNamed:@"jkui-"];
            [self.resultTitle setTextColor:HMColor(31,129,33)];
        }
    }else{//相等情况，收取手续费（）
        
        self.progressBarImage.image = [UIImage imageNamed:@"pkui"];
        self.CornerImage.image = [UIImage imageNamed:@"jkui-"];

        [self.resultTitle setTextColor:HMColor(31,129,33)];
    }
}

-(void)setFrame:(CGRect)frame
{
    frame.size.height -= 10;
    frame.origin.y += 5;
    [super setFrame:frame];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}



- (NSString *)loadHtmlString:(NSString *)string {
    
    float testDouble = [string floatValue];
    
    NSString *doubleString = [NSString stringWithFormat:@"%lf", testDouble];
    
    NSDecimalNumber *decNumber = [NSDecimalNumber decimalNumberWithString:doubleString];
    
    NSLog(@"%@", [decNumber stringValue]);
    
    return [decNumber stringValue];

}

- (NSString *)reviseString:(NSString *)str
{
    //直接传入精度丢失有问题的Double类型
    double conversionValue = [str doubleValue];
    
    NSString *doubleString = [NSString stringWithFormat:@"%lf", conversionValue];
    
    NSDecimalNumber *decNumber = [NSDecimalNumber decimalNumberWithString:doubleString];
    
    return [decNumber stringValue];
}

@end
