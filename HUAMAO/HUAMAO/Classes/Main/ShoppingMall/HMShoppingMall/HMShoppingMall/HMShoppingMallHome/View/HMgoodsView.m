//
//  HMgoodsView.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/7/3.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMgoodsView.h"

@interface HMgoodsView ()

@property (weak, nonatomic) IBOutlet UIImageView *GoodOne;

@property (weak, nonatomic) IBOutlet UIImageView *goodseven;

@property (weak, nonatomic) IBOutlet UIImageView *GoodTwo;

@property (weak, nonatomic) IBOutlet UIImageView *goodSix;

@property (weak, nonatomic) IBOutlet UIImageView *goodThree;
@property (weak, nonatomic) IBOutlet UIImageView *goodFive;
@property (weak, nonatomic) IBOutlet UIImageView *goodeight;

@property (weak, nonatomic) IBOutlet UIImageView *goodFour;
@end




@implementation HMgoodsView

+(instancetype)goodsView{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"HMgoodsView" owner:self options:nil] lastObject];
}

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    
    self.goodeight.userInteractionEnabled = YES;
    
    self.GoodOne.userInteractionEnabled = YES;
    
    self.GoodTwo.userInteractionEnabled = YES;
    
    self.goodThree.userInteractionEnabled = YES;
    
    self.goodFour.userInteractionEnabled = YES;
    
    self.goodFive.userInteractionEnabled = YES;
    
    self.goodSix.userInteractionEnabled = YES;
    
    self.goodseven.userInteractionEnabled = YES;
    
    UITapGestureRecognizer * tapOne = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(GoodSelect:)];
    
    [self.GoodOne addGestureRecognizer:tapOne];
    
    UITapGestureRecognizer * tapTow = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(GoodSelect:)];
    
    [self.GoodTwo addGestureRecognizer:tapTow];
    

    UITapGestureRecognizer * tapThree = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(GoodSelect:)];
    
    [self.goodThree addGestureRecognizer:tapThree];
    
    
    UITapGestureRecognizer * tapFour = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(GoodSelect:)];
    
    [self.goodFour addGestureRecognizer:tapFour];
    
    
    UITapGestureRecognizer * tapFive = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(GoodSelect:)];
    
    [self.goodFive addGestureRecognizer:tapFive];
    
    
    UITapGestureRecognizer * tapSix = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(GoodSelect:)];
    
    [self.goodSix addGestureRecognizer:tapSix];
    
    
    UITapGestureRecognizer * tapSeven = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(GoodSelect:)];
    
    [self.goodseven addGestureRecognizer:tapSeven];
    
    
    UITapGestureRecognizer * tapEigth = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(GoodSelect:)];
    
    [self.goodeight addGestureRecognizer:tapEigth];
}

-(void)GoodSelect:(UITapGestureRecognizer *)tap{
    
    if(self.Delegeat && [self.Delegeat respondsToSelector:@selector(goodsView:SelectIndex:)]){
        
        [self.Delegeat goodsView:self SelectIndex:tap.view.tag];
    }
    
}

@end
