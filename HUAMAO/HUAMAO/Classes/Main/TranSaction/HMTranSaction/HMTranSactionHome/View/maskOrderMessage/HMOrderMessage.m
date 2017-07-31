//
//  HMOrderMessage.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/1.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMOrderMessage.h"


#import "HMpiceFluctuationsDataSouce.h"

#import "HMproductPrice.h"

#import "HMorderMessageMol.h"


@interface HMOrderMessage ()
@property (weak, nonatomic) IBOutlet UILabel *money;
@property (weak, nonatomic) IBOutlet UILabel *timinglable;

@property (weak, nonatomic) IBOutlet UILabel *contract;

@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *orderType;
@property (weak, nonatomic) IBOutlet UILabel *executiveprice;

@property (weak, nonatomic) IBOutlet UILabel *result;

@property(assign,nonatomic) NSInteger timeNumber;

@property (weak, nonatomic) IBOutlet UIButton *orderSure;

@property(strong,nonatomic)NSTimer *timer;

@end

@implementation HMOrderMessage

+(instancetype)ShowView{
    
    return  [[[NSBundle mainBundle]loadNibNamed:@"HMOrderMessage" owner:self options:nil] lastObject];

}

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    self.layer.cornerRadius = HMCORNERRadius;
    
    self.layer.masksToBounds = YES;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(DataChageAction) name:@"DataChage" object:nil];
    
    self.orderSure.layer.cornerRadius = HMCORNERRadius;
    
    self.orderSure.layer.masksToBounds = YES;
    
}

-(void)scrollTimer{
    
    if(_timeNumber == 0){
        
        [UIView animateWithDuration:0.5 animations:^{
            
            self.superview.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            [self.superview removeFromSuperview];
            
        }];
        
    }
    

    
  
    if(_timeNumber > 0){
        
        _timeNumber --;
        
        self.timinglable.text = [NSString stringWithFormat:@"%lds", _timeNumber];
        
    }
    
}


-(void)DataChageAction{
    

    if([_contract.text isEqualToString:@"  金乌木"]){
        
        NSNumber * CurentPrice = [HMpiceFluctuationsDataSouce sharedpiceFluctuationsDataSouce].productPriceMol.curr_4;
        
        self.price.text = [NSString stringWithFormat:@"  %@", CurentPrice];
        
        if(_molmessage.Executiveprice){
            
            if(CurentPrice.floatValue <  _molmessage.Executiveprice.floatValue){
   
                if(_molmessage.type ==0){
                    
                    _result.text = @"  0";
                    
                }else{
                    
                    _result.text =@"  80%";
                }
                
                
            }else{
                
                if(_molmessage.type ==0){
                    
                   _result.text =@"  80%";
                    
                }else{
                    
                    _result.text = @"  0";
                    
                    
                }
            }
            
        }
        

    }else if([_contract.text isEqualToString:@"  黑檀木"]){
        
        NSNumber * CurentPrice = [HMpiceFluctuationsDataSouce sharedpiceFluctuationsDataSouce].productPriceMol.curr_1;
        
        self.price.text = [NSString stringWithFormat:@"  %@", CurentPrice];
        
        if(_molmessage.Executiveprice){
            
            if(CurentPrice.floatValue <  _molmessage.Executiveprice.floatValue){
                
                
                if(_molmessage.type ==0){
                    
                    _result.text = @"  0";
                    
                }else{
                    
                    _result.text =@"  80%";
                }
                
                
            }else{
                
                if(_molmessage.type ==0){
                    
                    _result.text =@"  80%";
                    
                }else{
                    
                    _result.text = @"  0";
                    
                    
                }
            }
            
        }
        
        
    }else if([_contract.text isEqualToString:@"  红楠木"]){
        
        NSNumber * CurentPrice = [HMpiceFluctuationsDataSouce sharedpiceFluctuationsDataSouce].productPriceMol.curr_2;
        
        self.price.text = [NSString stringWithFormat:@"  %@", CurentPrice];
        
        if(_molmessage.Executiveprice){
            
            if(CurentPrice.floatValue <  _molmessage.Executiveprice.floatValue){
                
                
                if(_molmessage.type ==0){
                    
                    _result.text = @"  0";
                    
                }else{
                    
                    _result.text =@"  80%";
                }
                
                
            }else{
                
                if(_molmessage.type ==0){
                    
                    _result.text =@"  80%";
                    
                }else{
                    
                    _result.text = @"  0";
                    
                    
                }
            }
            
        }
        
    }
    
}



- (IBAction)ComingButtonAction:(UIButton *)sender {
    
     self.ComingAction();
    
}

-(void)setMolmessage:(HMorderMessageMol *)molmessage{
    
    _molmessage = molmessage;
    
    
    if(molmessage.product ==0){
        
        _contract.text = @"  金乌木";
        
    }else if(molmessage.product ==1){
        
        _contract.text = @"  黑檀木";
        
    }else{
        
        _contract.text = @"  红楠木";
    }
    
    if(molmessage.isOrderBegin == YES){
        
        
        if(molmessage.cycelTime ==0){
            
            _timeNumber = 180;
            
        }else if(molmessage.cycelTime ==1){
            
            _timeNumber = 60;
            
        }else{
            
            _timeNumber = 300;
        }
        
    }else{
        
        NSLog(@"%ld",molmessage.cycelTime);
        
        _timeNumber = molmessage.cycelTime;
    }

    if(molmessage.type ==0){
        
        _orderType.text = @"  超过";
        
    }else{
        
        _orderType.text = @"  不超过";
    }
    

     self.executiveprice.text = [NSString stringWithFormat:@"  %.1f", [molmessage.Executiveprice floatValue]];
    

    self.money.text = [NSString stringWithFormat:@"  %ld",[self SelectMoneyWithTag : molmessage.money ]];
    
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(scrollTimer) userInfo:nil repeats:YES];
    
}


-(NSInteger)SelectMoneyWithTag:(NSInteger)tag{
    
    if(tag ==0){
        
        return 5000;
        
    }else if(tag ==1){
        
        return 3000;
        
    }else if(tag ==2){
        
        return 2000;
        
    }else if(tag ==3){
        
        return 1000;
        
    }else if(tag ==4){
        
        return 500;
        
    }else if(tag ==5){
        
        return 300;
        
    }else if(tag ==6){
        
        return 200;
        
    }else{
        
        return 100;
    }
}




-(void)dealloc {
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}

@end
