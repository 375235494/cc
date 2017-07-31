//
//  HMEndView.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/20.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMEndView.h"

#import "HMServiceTool.h"

#import "HMCHiCHeadView.h"

#import "HMCIcModel.h"

#import "HMCHicCell.h"

#import "HMJYModel.h"

#import "HMJYCell.h"


@interface HMEndView()
<UITableViewDataSource,
UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *CiCButton;

//@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIButton *JYbutton;

@property (weak, nonatomic) IBOutlet UIView *CiCView;

@property (weak, nonatomic) IBOutlet UIView *JYView;

@property(strong,nonatomic) NSMutableArray *aryCicSouce;

@property(strong,nonatomic) NSMutableArray *aryJYSouce;


@property(weak,nonatomic) HMCHiCHeadView *headV;

@property(strong,nonatomic)NSArray *CicHeadary;

@property(strong,nonatomic)NSArray *JYheadAary;

@property(strong,nonatomic)UILabel *labelTextjy;

@property(strong,nonatomic)UILabel *labelTextcicang;



@property(assign,nonatomic)BOOL ChiCangSelect;

@end

@implementation HMEndView

-(NSMutableArray *)aryJYSouce{
    
    if(_aryJYSouce == nil){
        
        _aryJYSouce = [NSMutableArray array];
    }
    
    return _aryJYSouce;
}

-(NSMutableArray *)aryCicSouce{
    
    
    if(_aryCicSouce ==nil){
        
        _aryCicSouce = [NSMutableArray array];
    }
    
    return _aryCicSouce;
    
}

-(UITableView *)ciCangTableView{
    
    if(_ciCangTableView == nil){
       
        _ciCangTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        
         _ciCangTableView.backgroundColor = HMUIColorFromRgbAlpha(0x1e1e1e , 1);
        
        
        _ciCangTableView.delegate = self;
        
        _ciCangTableView.dataSource = self;
        
        // 设置隐藏分割线
        _ciCangTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        // 设置隐藏垂直的滚动条
        _ciCangTableView.showsVerticalScrollIndicator = NO;
        
       
        
        
    }
    
    return _ciCangTableView;
    
}


-(UITableView *)JaoYitableView{
    
    if(_JaoYitableView == nil){
        
        
        
        _JaoYitableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        _JaoYitableView.backgroundColor = HMUIColorFromRgbAlpha(0x1e1e1e , 1);

        _JaoYitableView.delegate = self;
        
        _JaoYitableView.dataSource = self;
        // 设置隐藏分割线
        _JaoYitableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        // 设置隐藏垂直的滚动条
        _JaoYitableView.showsVerticalScrollIndicator = NO;
        
        
        
    }
    
    return _JaoYitableView;
}



- (IBAction)buttonAction:(UIButton*)sender {
    
    switch (sender.tag) {
        case 100:{
            
            [self CiCAction:sender];
            
           
            
        }
            
            break;
            
            
        case 101:{
            
             [self JYAction:sender];
            
            
            
        }
            
            break;
            
        default:
            break;
    }
    
}

-(void)CiCAction:(UIButton *)button{
    
    button.enabled = NO;
    
    self.JYbutton.enabled = YES;
//    
//    self.JYView.backgroundColor =  HMUIColorFromRgbAlpha(0xfdbe19, 1);
//    
//    self.CiCView.backgroundColor = HMUIColorFromRgbAlpha(0xaeadad , 1);
    
 
    
//    self.headV.height = 0;
    
//    self.headV.arytitle = self.CicHeadary;
    
    [self.JaoYitableView removeFromSuperview];
    
    [self addSubview:self.ciCangTableView];
    
//    [self bringSubviewToFront:self.ciCangTableView];
    
    _ChiCangSelect = YES;
    
    if(self.Delegate && [self.Delegate respondsToSelector:@selector(EndViewCiCAction:)]){
        
        [self.Delegate EndViewCiCAction:self];
    }
    
//     [self CiCLoad];
    
}

-(void)JYAction:(UIButton *)button{
    
    button.enabled = NO;
    
    self.CiCButton.enabled = YES;
    
//    self.JYView.backgroundColor =  HMUIColorFromRgbAlpha(0xaeadad , 1);
//    
//    self.CiCView.backgroundColor = HMUIColorFromRgbAlpha(0xfdbe19 , 1);


//    
//    self.headV.arytitle = self.JYheadAary;
//
//    self.headV.height = 40;
//
    
    [self.ciCangTableView removeFromSuperview];
    
    [self addSubview:self.JaoYitableView];
    
//    [self bringSubviewToFront:self.JaoYitableView];
    
    _ChiCangSelect = NO;
    
    if(self.Delegate && [self.Delegate respondsToSelector:@selector(EndViewJYAction:)]){
        
        [self.Delegate EndViewJYAction:self];
    }

//     [self JYLoad];
}


-(void)CicActionLoad{
    
    [self CiCAction:self.CiCButton];
    

}

-(void)JYActionLoad{
    
    [self JYAction:self.JYbutton];
    

}



-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    _ChiCangSelect = YES;
    
    self.backgroundColor = HMUIColorFromRgbAlpha(0x1e1e1e , 1);
    
    [self.JYbutton setTitleColor:HMUIColorFromRgbAlpha(0xadaeae , 1) forState:UIControlStateNormal];
    
    [self.JYbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    
    
    [self.CiCButton setTitleColor:HMUIColorFromRgbAlpha(0xadaeae , 1) forState:UIControlStateNormal];
    
    [self.CiCButton setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    
    self.CiCButton.enabled = NO;
    
    
    HMCHiCHeadView *headV = [HMCHiCHeadView CHiCHeadView];
    
    _headV = headV;
    
//    _CicHeadary = @[@"品种",@"周期",@"开仓时间",@"开仓价格",@"金额",@"详情"];
    
    _JYheadAary = @[@"项目",@"周期",@"竞猜点位",@"金豆",@"胜负",@"结束时间"];
    
    headV.height = 25;
    
    headV.width = self.width;
    
    headV.arytitle = self.JYheadAary;
    
    self.JaoYitableView.tableHeaderView = headV;
    
//    [self CiCAction:self.CiCButton];
    
    [self.JaoYitableView addSubview:self.labelTextjy];
    
     [self.ciCangTableView addSubview:self.labelTextcicang];

    
    self.ciCangTableView.x = 30;
    
    self.ciCangTableView.y = 37;
    
    self.ciCangTableView.height = 150;
    
    
    self.ciCangTableView.width = HMLXScreenWidth -  2 * self.ciCangTableView.x;

    self.JaoYitableView.frame = self.ciCangTableView.frame;
    
    
    [self addSubview:self.JaoYitableView];
    
    [self addSubview:self.ciCangTableView];

}

+(instancetype)EndView{
    
   return [[[NSBundle mainBundle]loadNibNamed:@"HMEndView" owner:self options:nil] lastObject];
}


-(UILabel *)labelTextjy{
    
    if(_labelTextjy ==nil){
        
        _labelTextjy = [[UILabel alloc]init];

        _labelTextjy.x = 0;
        
        _labelTextjy.y = 10;
        
        _labelTextjy.height = 30;
        
        _labelTextjy.width = HMLXScreenWidth - 60;
        
        _labelTextjy.textAlignment = NSTextAlignmentCenter;
        
        _labelTextjy.textColor = HMUIColorFromRgbAlpha(0xAEADAD , 1);
    }
    
    return _labelTextjy;
    
}

-(UILabel *)labelTextcicang{
    
    if(_labelTextcicang ==nil){
        
        _labelTextcicang = [[UILabel alloc]init];
        
        _labelTextcicang.x = 0;
        
        _labelTextcicang.y = 10;
        
        _labelTextcicang.height = 30;
        
        _labelTextcicang.width = HMLXScreenWidth - 60;
        
        _labelTextcicang.textAlignment = NSTextAlignmentCenter;
        
        _labelTextcicang.textColor = HMUIColorFromRgbAlpha(0xAEADAD , 1);
    }
    
    return _labelTextcicang;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(tableView == self.ciCangTableView){
        
        return 1;
        
        
    }else if(tableView == self.JaoYitableView){
        
//        if(self.aryJYSouce.count> 0){
//
//            self.labelTextjy.hidden = YES;
//            
//        }
//        
//        else{
//            
//            self.labelTextjy.hidden = NO;
//            
//            self.labelTextjy.text = @"暂无易购记录";
//            
//        }

        return self.aryJYSouce.count;
        
    }else{
        
        
        return 0;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    

    if(tableView == self.ciCangTableView){
        
        if(self.aryCicSouce.count > 0){
            
            self.labelTextcicang.hidden = YES;
            
        }
        
        else{
            
            self.labelTextcicang.hidden = NO;
            
            self.labelTextcicang.text = @"暂无竞猜订单";
            
        }

        
        NSLog(@"%@",self.aryCicSouce);
        
        return self.aryCicSouce.count;
        
        
        
    }else{
        
        return 1;
        
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if(section == 0){
        
        return 5;
        
    }else{
        
         return 15;
    }
   
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc]init];
    
    view.backgroundColor = HMUIColorFromRgb(0x1e1e1e);
    
    return view;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(tableView == self.ciCangTableView){
        
        HMCHicCell *cell = [HMCHicCell CHicCell];
  
//        __weak typeof(self) weekSelf = self;
        
//        cell.MessageShow = ^{
//            
//            if(weekSelf.Delegate &&[weekSelf.Delegate respondsToSelector:@selector(ChecktheDetails:indexpath:)]){
//   
//                [weekSelf.Delegate ChecktheDetails:weekSelf indexpath:indexPath];
//            }
//            
//        };
        
        cell.Delegeat = (UIViewController *)self.Delegate;
        
        cell.controller = (UIViewController *)self.Delegate;
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        NSLog(@"%@",self.aryCicSouce);
        
        
        
        
        cell.model = self.aryCicSouce[indexPath.section];
        
        return cell;
        
    }else if(tableView == self.JaoYitableView){

        HMJYCell *cell = [HMJYCell JYCell];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
  
        
        cell.model = self.aryJYSouce[indexPath.row];
        
        return cell;
        
        
    }else{
        
        return [[UITableViewCell alloc]init];
    }
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if(tableView == self.ciCangTableView){

        if(self.Delegate &&[self.Delegate respondsToSelector:@selector(ChecktheDetails:indexpath:)]){

            [self.Delegate ChecktheDetails:self indexpath:indexPath];
        }
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(tableView == self.ciCangTableView){
        
        return 88;
        
    }else{
        
        return 40;
    }
}



-(void)reloadateCicangWithAry :(NSMutableArray *)arysouce{
    
    
    @synchronized(self)
    
    {
        
        [self.aryCicSouce removeAllObjects];
        
        
        [self.aryCicSouce addObjectsFromArray:arysouce];
        
        //     self.aryCicSouce = arysouce;
        
        if(_ChiCangSelect == NO) return;
        
        if(_ChiCangSelect == YES ){
            
            
            
            
            
            self.ciCangTableView.height = (15 + 88) * self.aryCicSouce.count + 70;
            
            
            
            
            if(self.aryCicSouce.count == 0){
                
                self.height = 150;
                
            }else{
                
                self.height = (15 + 88) * self.aryCicSouce.count + 110;
            }
            
            
            
            
            if(self.Delegate && [self.Delegate respondsToSelector:@selector(EndViewCiCAction:WithHeigth:)]){
                
                [self.Delegate EndViewCiCAction:self WithHeigth: (15 + 88) * self.aryCicSouce.count + 150 ];
                
            }
            
            
        }
        
        
        [self.ciCangTableView reloadData];
        
    }
   

}

-(void)reloadateJiaYiWithAry :(NSMutableArray *)arysouce{

      [self.aryJYSouce removeAllObjects];
    
      [self.aryJYSouce addObjectsFromArray:arysouce];
    
//        self.aryJYSouce = arysouce;
    
        [self.JaoYitableView reloadData];

    
    
}






@end
