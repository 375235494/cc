//
//  HMCHicCell.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/20.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMCHicCell.h"

#import "HMCIcModel.h"

#import "HMpiceFluctuationsDataSouce.h"

#import "HMproductPrice.h"

#import "HMprofitMaskView.h"

#import "HMorderMessageMol.h"

@interface HMCHicCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageType;

@property (weak, nonatomic) IBOutlet UILabel *Name;

@property (weak, nonatomic) IBOutlet UILabel *cycle;

@property (weak, nonatomic) IBOutlet UIButton *startTime;
@property (weak, nonatomic) IBOutlet UIButton *startPrice;
@property (weak, nonatomic) IBOutlet UILabel *money;


@property (weak, nonatomic) IBOutlet UIButton *currPrice;


@property (weak, nonatomic) IBOutlet UILabel *lefttime;

@property (weak, nonatomic) IBOutlet UIImageView *imageSY;

@property (weak, nonatomic) IBOutlet UIImageView *currImage;

@property (weak, nonatomic) IBOutlet UILabel *typeView;


@property(strong,nonatomic)NSNumber *OrderID;

@end

@implementation HMCHicCell




//- (void)CHiCaction:(UITapGestureRecognizer *)tap {
//    
//    self.MessageShow();
//    
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
    self.layer.masksToBounds = YES;
    
    self.layer.cornerRadius = 5;
    
    self.typeView.layer.cornerRadius = 3;
    
    self.typeView.layer.masksToBounds = YES;
    
    
    self.imageSY.userInteractionEnabled = YES;
    
//    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(CHiCaction:)];
//    
//    [self.imageSY addGestureRecognizer:tap];
//    
    
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(DataChageAction) name:@"DataChage" object:nil];
    
 
}

+(instancetype)CHicCell{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"HMCHicCell" owner:self options:nil]lastObject];

}


//-(void)DataChageAction{
//    
//    NSString *textprice;
//    
//    if([_Name.text isEqualToString:@"金乌木"]){
//        
//        
//        textprice = [NSString stringWithFormat:@"%@", [HMpiceFluctuationsDataSouce sharedpiceFluctuationsDataSouce].productPriceMol.curr_4];
//        
//        
//    }else if([_Name.text isEqualToString:@"黑檀木"]){
//        
//        textprice = [NSString stringWithFormat:@"%@", [HMpiceFluctuationsDataSouce sharedpiceFluctuationsDataSouce].productPriceMol.curr_1];
//        
//        
//    }else if([_Name.text isEqualToString:@"红楠木"]){
//        
//        textprice = [NSString stringWithFormat:@"%@", [HMpiceFluctuationsDataSouce sharedpiceFluctuationsDataSouce].productPriceMol.curr_2];
//        
//    }
//    
//    
//    [self.currPrice setTitle:textprice forState:UIControlStateNormal];
//    
//    
//    
//    if(_money.text.floatValue >= textprice.floatValue){
//        
//        self.currImage.image = [UIImage imageNamed:@"进行中"];
//        
//        self.imageSY.image = [UIImage imageNamed:@"红色收益"];
//        
//    }else{
//        
//        self.currImage.image = [UIImage imageNamed:@"亏进行"];
//        
//        
//        self.imageSY.image = [UIImage imageNamed:@"蓝色亏损"];
//    }
//    
//}



-(void)setModel:(HMCIcModel *)model{
    
    _model = model;
    
    _OrderID = model.orderId;
    
    _Name.text = model.name;

    _cycle.text =[NSString stringWithFormat:@" %@M",model.cycle];
   
    _money.text = model.money;
    
    [self.startPrice setTitle:model.startPrice forState:UIControlStateNormal];
    
    
    [self.startTime setTitle:[model.startDate substringFromIndex:10] forState:UIControlStateNormal];
    
    _lefttime.text = [NSString stringWithFormat:@"%@s",model.leftTime];
    
    if(model.typeJY ==1){
        
        _imageType.image = [UIImage imageNamed:@"cguo"];
        
        _typeView.text = @"超1";
        
        _typeView.textColor = [UIColor clearColor];
//        _typeView.backgroundColor =[UIColor redColor];//HMUIColorFromRgb(0xb0219);
    }else{
        
        _imageType.image = [UIImage imageNamed:@"bucguo"];
        _typeView.text = @"低1";
        
        
        _typeView.textColor = [UIColor clearColor];
//
//        _typeView.backgroundColor = HMUIColorFromRgb(0x18ab26);
    }
    
    [self.currPrice setTitle:model.currPrice forState:UIControlStateNormal];
    
     NSLog(@"%f,%f",model.currPrice.floatValue,model.money.floatValue)
    
    if(model.startPrice.floatValue >= model.currPrice.floatValue){
        
        if(model.typeJY ==1){
            
            self.currImage.image = [UIImage imageNamed:@"亏进行"];
            
            self.imageSY.image = [UIImage imageNamed:@"蓝色亏损"];
           
        }else{
            
            self.currImage.image = [UIImage imageNamed:@"进行中"];
            
            self.imageSY.image = [UIImage imageNamed:@"红色收益"];
        
        }
        

     

    }else{
        

        if(model.typeJY ==1){
            
            self.currImage.image = [UIImage imageNamed:@"进行中"];
            
            self.imageSY.image = [UIImage imageNamed:@"红色收益"];
            
   
            
        }else{
            
            self.currImage.image = [UIImage imageNamed:@"亏进行"];
            
            self.imageSY.image = [UIImage imageNamed:@"蓝色亏损"];
            
        }
        

 
    }
    
    [self.currPrice setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -8)];

    [self.startPrice setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -8)];

}

-(void)dealloc{

    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
