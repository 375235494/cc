//
//  HMMyPositionCell.m
//  HUAMAO
//
//  Created by 裴小康 on 2017/5/22.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMMyPositionCell.h"

@interface HMMyPositionCell ()
//木头种类
@property (weak, nonatomic) IBOutlet UILabel *woodsType;
//交易时间明细
@property (weak, nonatomic) IBOutlet UILabel *timeDetails;
//交易点位明细
@property (weak, nonatomic) IBOutlet UILabel *pointDetails;
//购卖图标
@property (weak, nonatomic) IBOutlet UILabel *buyOrSellLab;
//周期
@property (weak, nonatomic) IBOutlet UILabel *cycleLab;
//预计盈亏
@property (weak, nonatomic) IBOutlet UILabel *resultLab;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation HMMyPositionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.buyOrSellLab.layer.cornerRadius = 2;
    self.buyOrSellLab.layer.masksToBounds = YES;
    self.buyOrSellLab.textAlignment = NSTextAlignmentCenter;
    
}

- (void)setPositionModel:(HMMyPositionModel *)positionModel
{
    _positionModel = positionModel;
    
    self.woodsType.text = positionModel.name;
    
    self.timeDetails.text = [positionModel.addtimestr  substringFromIndex:11];
    
//    self.pointDetails.text = positionModel.price;
    
    
//    交易金额
    self.pointDetails.text = [self reviseString:positionModel.price];
    

    self.cycleLab.text = [NSString stringWithFormat:@"%lds",positionModel.tzq.integerValue * 60];
    
    self.buyOrSellLab.hidden = YES;
    if ([positionModel.type isEqualToString:@"-1"]) {//购
//        self.buyOrSellLab.text = @"低";
//        self.buyOrSellLab.backgroundColor = HMColor(31, 129, 33);
        self.image.image = [UIImage imageNamed:@"bucguo"];
    }else {
        self.image.image = [UIImage imageNamed:@"cguo"];
//        self.buyOrSellLab.text = @"超";
//        self.buyOrSellLab.backgroundColor = HMColor(251, 13, 27);
    }
    
    double price = [positionModel.price doubleValue];
    
    double endprice =[positionModel.endprice doubleValue];
    
    if (positionModel.type.integerValue == -1) {//看低
        
        if (price > endprice) {//盈利
            
//            self.resultLab.text = @"胜";
            
             self.resultLab.text = [NSString stringWithFormat:@"%.0f豆",positionModel.money.intValue * 0.8];
            
            [self.resultLab setTextColor:HMColor(251, 13, 27)];
            
        }else {//亏
//            self.resultLab.text = @"负";
            
            self.resultLab.text = [NSString stringWithFormat:@"%d豆",-(positionModel.money.intValue)];
            
            [self.resultLab setTextColor:HMColor(31, 129, 33)];
        
        }
    }else if(positionModel.type.integerValue == 1){//竞购
        
        if (price > endprice) {//亏损
            
            self.resultLab.text = @"负";
            [self.resultLab setTextColor:HMColor(31, 129, 33)];
            
        }else {//盈利
            self.resultLab.text = @"胜";
            [self.resultLab setTextColor:HMColor(251, 13, 27)];
        }
    }else{//相等情况，收取手续费（亏）
        
        self.resultLab.text = @"负";
        [self.resultLab setTextColor:HMColor(31, 129, 33)];
    }
}

- (NSString *)reviseString:(NSString *)str
{
    //直接传入精度丢失有问题的Double类型
    double conversionValue = [str doubleValue];
    
    NSString *doubleString = [NSString stringWithFormat:@"%lf", conversionValue];
    
    NSDecimalNumber *decNumber = [NSDecimalNumber decimalNumberWithString:doubleString];
    
    return [decNumber stringValue];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

   }

@end
