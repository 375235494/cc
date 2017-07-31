//
//  HMJYCell.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/20.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMJYCell.h"

#import "HMJYModel.h"

@interface HMJYCell()
@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *cycle;

@property (weak, nonatomic) IBOutlet UILabel *typeView;
@property (weak, nonatomic) IBOutlet UILabel *startpoint;
@property (weak, nonatomic) IBOutlet UILabel *money;
@property (weak, nonatomic) IBOutlet UILabel *Profit;
@property (weak, nonatomic) IBOutlet UIImageView *ImageType;

@property (weak, nonatomic) IBOutlet UILabel *endTime;
@end

@implementation HMJYCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.typeView.layer.cornerRadius = 3;

    self.typeView.layer.masksToBounds = YES;
}
+(instancetype)JYCell;{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"HMJYCell" owner:self options:nil]lastObject];
    
}

-(void)setModel:(HMJYModel *)model{
    
    _model = model;

    _name.text = model.name;

    _cycle.text =[NSString stringWithFormat:@"%@M",model.cycle];
    
    _endTime.text = [model.endTime substringFromIndex:11];
    
    
//    _endTime.text = [model.endTime substringWithRange:NSMakeRange(8, 8)];
    
    if(model.typeJY ==1){
        
        _ImageType.image = [UIImage imageNamed:@"cguo"];
        
        _typeView.text = @"超1";
        
        _typeView.textColor = [UIColor clearColor];
//        _typeView.backgroundColor =[UIColor redColor];//HMUIColorFromRgb(0xb0219);
    }else{
        
        _ImageType.image = [UIImage imageNamed:@"bucguo"];
        _typeView.text = @"低1";
        
        
        _typeView.textColor = [UIColor clearColor];
        
//        _typeView.backgroundColor = HMUIColorFromRgb(0x18ab26);
    }

    _startpoint.text =[NSString stringWithFormat:@"%@", model.Buyingpoints] ;

    _money.text = model.money;
    
//    _Profit.text = model.Profit;
    
    if(model.ProfitIs ==YES){
        
        _Profit.textColor = HMUIColorFromRgb(0xf91900);
        
        _Profit.text = [NSString stringWithFormat:@"+%@",model.Profit];
        
    }else{
        
        _Profit.textColor = HMUIColorFromRgb(0x18962a);
        
         _Profit.text = model.Profit;
    }
    

}


@end
