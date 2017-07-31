//
//  HMBuyShowView.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMBuyShowView.h"

#import "HMpiceFluctuationsDataSouce.h"

#import "HMproductPrice.h"



@interface HMBuyShowView ()
@property (weak, nonatomic) IBOutlet UIButton *button1;

@property (weak, nonatomic) IBOutlet UIButton *button2;

@property (weak, nonatomic) IBOutlet UIButton *button3;

@property (weak, nonatomic) IBOutlet UIButton *button4;

@property (weak, nonatomic) IBOutlet UIButton *button5;

@property (weak, nonatomic) IBOutlet UIButton *button6;

@property (weak, nonatomic) IBOutlet UIButton *button7;

@property (weak, nonatomic) IBOutlet UIButton *button8;

@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@property (weak, nonatomic) IBOutlet UIButton *SureButton;


@property(weak,nonatomic) UIButton *Selectbutton;

@property (weak, nonatomic) IBOutlet UILabel *moneylable;


@property (weak, nonatomic) IBOutlet UILabel *earningslable;

@property (weak, nonatomic) IBOutlet UILabel *contract;


@property (weak, nonatomic) IBOutlet UILabel *timelable;

@property (weak, nonatomic) IBOutlet UILabel *typelable;

@property (weak, nonatomic) IBOutlet UILabel *price;

@end

@implementation HMBuyShowView



-(void)awakeFromNib{
    
    [super awakeFromNib];

    self.button1.layer.cornerRadius = 19;

    self.button1.layer.masksToBounds = YES;
 
    self.button2.layer.cornerRadius = 19;

    self.button2.layer.masksToBounds = YES;
    
    self.button3.layer.cornerRadius = 19;

    self.button3.layer.masksToBounds = YES;
    
    self.button4.layer.cornerRadius = 19;
    
    self.button4.layer.masksToBounds = YES;
    
    self.button5.layer.cornerRadius = 19;
    
    self.button5.layer.masksToBounds = YES;
    
    self.button6.layer.cornerRadius = 19;
    
    self.button6.layer.masksToBounds = YES;
    
    self.button7.layer.cornerRadius = 19;
    
    self.button7.layer.masksToBounds = YES;
    
    self.button8.layer.cornerRadius = 19;
    
    self.button8.layer.masksToBounds = YES;

    self.cancelButton.layer.cornerRadius = 19;
    
    self.cancelButton.layer.masksToBounds = YES;

    self.SureButton.layer.cornerRadius = 19;
    
    self.SureButton.layer.masksToBounds = YES;

    self.button7.enabled = NO;
    
    self.Selectbutton = self.button7;
    
    self.moneylable.text = self.Selectbutton.titleLabel.text;
    
    self.earningslable.text = [NSString stringWithFormat:@"%.0f豆",200*0.8];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(DataChageAction) name:@"DataChage" object:nil];
    
}



-(void)DataChageAction{
    
    if([_contract.text isEqualToString:@"金乌木"]){
        
        
        self.price.text = [NSString stringWithFormat:@"%@", [HMpiceFluctuationsDataSouce sharedpiceFluctuationsDataSouce].productPriceMol.curr_4];
        
        
    }else if([_contract.text isEqualToString:@"黑檀木"]){
        
        self.price.text = [NSString stringWithFormat:@"%@", [HMpiceFluctuationsDataSouce sharedpiceFluctuationsDataSouce].productPriceMol.curr_1];
        
        
    }else if([_contract.text isEqualToString:@"红楠木"]){
        
        self.price.text = [NSString stringWithFormat:@"%@", [HMpiceFluctuationsDataSouce sharedpiceFluctuationsDataSouce].productPriceMol.curr_2];
        
    }

}


+(instancetype)ShowView{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"HMBuyShowView" owner:self options:nil]lastObject];
}



- (IBAction)cancelAction:(UIButton *)sender {
    
    if(self.Delegate && [self.Delegate respondsToSelector:@selector(cancelAction)]){
        
        [self.Delegate cancelAction];
    }
    
}

- (IBAction)SureAction:(UIButton *)sender {
    
    if(self.Delegate && [self.Delegate respondsToSelector:@selector(SureAction)]){
        
        [self.Delegate SureAction];
    }
    
}


- (IBAction)moneySelect:(id)sender {

    UIButton *button = (UIButton *)sender;
    
    NSInteger money = [self SelectMoneyWithTag:button.tag];

    self.moneylable.text = button.titleLabel.text;
    
    self.earningslable.text = [NSString stringWithFormat:@"%.0f豆",money*0.8];

    
    button.enabled = NO;
    
    self.Selectbutton.enabled = YES;

    self.Selectbutton = button;
    
    if(self.Delegate && [self.Delegate respondsToSelector:@selector(moneySelectAction:)]){
        
        [self.Delegate moneySelectAction:button.tag];
        
    }
    
}

-(NSInteger)SelectMoneyWithTag:(NSInteger)tag{
    
    if(tag ==100){
        
        return 5000;
        
    }else if(tag ==101){
        
        return 3000;
        
    }else if(tag ==102){
        
        return 2000;
        
    }else if(tag ==103){
        
        return 1000;
        
    }else if(tag ==104){
        
        return 500;
        
    }else if(tag ==105){
        
        return 300;
        
    }else if(tag ==106){
        
        return 200;
        
    }else{
        
        return 100;
    }
}


-(void)setHY:(NSInteger)HYselect cycleTime:(NSInteger)Timeselect orderType:(NSInteger)Typeselect{
    
    
    if(HYselect ==0){
        
        _contract.text = @"金乌木";
        
    }else if(HYselect ==1){
        
        _contract.text = @"黑檀木";
        
    }else{
        
        _contract.text = @"红楠木";
    }
    
    
    if(Timeselect ==0){
        
        _timelable.text = @"180秒";
        
    }else if(Timeselect ==1){
        
        _timelable.text = @"60秒";
        
    }else{
        
        _timelable.text = @"300秒";
    }
    
    if(Typeselect ==0){
        
        _typelable.text = @"超过";
        
    }else{
        
        _typelable.text = @"不超过";
    }
    
    
}

-(void)dealloc {
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}


@end
