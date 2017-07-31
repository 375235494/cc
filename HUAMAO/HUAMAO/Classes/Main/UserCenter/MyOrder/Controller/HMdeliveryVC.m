//
//  HMdeliveryVC.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/13.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMdeliveryVC.h"

#import "HMdeliveryCell.h"

#import "HMNoMesageV.h"

@interface HMdeliveryVC ()

@property(strong,nonatomic)HMNoMesageV *nomessageV;

@end

@implementation HMdeliveryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor brownColor];
 
    
     [self getMessageWithType:3];
    
}


-(HMNoMesageV *)nomessageV{
    
    if(_nomessageV == nil){
        
        _nomessageV = [HMNoMesageV NomessageV];
        
    }
    
    return _nomessageV;
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(self.arySouce.count == 0){
        
        [tableView addSubview:self.nomessageV];
        
        self.nomessageV.frame = tableView.bounds ;
        
        self.nomessageV.height = tableView.height /2 + 50;
        
        
    }else{
        
        [self.nomessageV removeFromSuperview];
    }
    
    return self.arySouce.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HMdeliveryCell * cell = [HMdeliveryCell deliveryCellWithTableView:tableView];
    
    cell.dicSouce = self.arySouce[indexPath.row];
    
    return cell;
 
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 310;
}



@end
