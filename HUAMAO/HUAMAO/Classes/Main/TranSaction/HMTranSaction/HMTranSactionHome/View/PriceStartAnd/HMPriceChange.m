//
//  HMPriceChange.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/20.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMPriceChange.h"

#import "HMpiceFluctuationsDataSouce.h"

#import "HMproductPrice.h"

@interface HMPriceChange()

@property (weak, nonatomic) IBOutlet UILabel *startprice;
@property (weak, nonatomic) IBOutlet UILabel *maxprice;
@property (weak, nonatomic) IBOutlet UILabel *minprice;

@end

@implementation HMPriceChange

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(DataChageAction) name:@"DataChage" object:nil];
    
}


-(void)setTextWithStatus:(BOOL)status startprice:(NSNumber *)startprice  maxprice:(NSNumber *)maxprice  minprice:(NSNumber *)minprice{
 
    
    if(status == YES){
        
        self.startprice.text = [NSString stringWithFormat:@"今开:%@",startprice];
        
        self.maxprice.text = [NSString stringWithFormat:@"最高:%@",maxprice];
        
        self.minprice.text = [NSString stringWithFormat:@"最低:%@",minprice];
        
    }else{
        
        self.startprice.text = @"今开:";
        
        self.maxprice.text = @"最高:";
        
        self.minprice.text = @"最低:";
        
    }

    
}


-(void)DataChageAction{
  
    HMpiceFluctuationsDataSouce *souce =  [HMpiceFluctuationsDataSouce sharedpiceFluctuationsDataSouce];
    
    if(self.Delegate && [self.Delegate respondsToSelector:@selector(PriceChangeSelceted:)]){
        
        NSInteger indexSelect = [self.Delegate PriceChangeSelceted:self];
        
        
        if(indexSelect == 0){
            
            [self setTextWithStatus:souce.status_4 startprice:souce.productPriceMol.day_4 maxprice:souce.productPriceMol.max_4 minprice:souce.productPriceMol.min_4];
 
            
        }else if ( indexSelect ==1){
            
            
             [self setTextWithStatus:souce.status_1 startprice:souce.productPriceMol.day_1 maxprice:souce.productPriceMol.max_1 minprice:souce.productPriceMol.min_1];
            
            
        }else if(indexSelect ==2){
            
              [self setTextWithStatus:souce.status_2 startprice:souce.productPriceMol.day_2 maxprice:souce.productPriceMol.max_2 minprice:souce.productPriceMol.min_2];
            
            
        }
        
    }
    
}


+(instancetype)PriceChange{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"HMPriceChange" owner:self options:nil]lastObject];
}

+(CGFloat)PriceChangeHeigth{
    
    return 33;
}

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end
