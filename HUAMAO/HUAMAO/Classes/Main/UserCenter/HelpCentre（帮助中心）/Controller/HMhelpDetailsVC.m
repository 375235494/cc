
//  HMhelpDetailsVC.m
//  HUAMAO
//  Created by  on 2017/5/19.
//  Copyright © 2017年 陈臣. All rights reserved.

#import "HMhelpDetailsVC.h"

#import "MJExtension.h"

@interface HMhelpDetailsVC ()
//标题
@property (weak, nonatomic) IBOutlet UILabel *titleL;
//时间
@property (weak, nonatomic) IBOutlet UILabel *timelab;
//显示内容
@property (weak, nonatomic) IBOutlet UILabel *detailsL;
//图片的bgview
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@property (nonatomic, strong) HMContModel *contModel;

//消息的数组
@property(nonatomic, strong) NSMutableArray *contArray;

@end

@implementation HMhelpDetailsVC

- (NSMutableArray *)contArray
{
    if (!_contArray) {
        _contArray = [NSMutableArray array];
    }
    return _contArray;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"帮助详情";
    self.view.backgroundColor = HMColor(31, 31, 31) ;
    
    [self setUpLable];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}

- (void)setUpLable
{
    self.titleL.text = self.helpCenteMode.title;
    self.timelab.text = self.helpCenteMode.addtimestr;
    
    [self.bgImageView sd_setImageWithURL:[NSURL URLWithString:self.helpCenteMode.img]];
    
    self.contArray = [HMContModel mj_keyValuesArrayWithObjectArray:self.helpCenteMode.cont];
    
    self.contArray = self.helpCenteMode.cont;
    
    HMContModel *contModel = [self.contArray firstObject];
    
    //判断是否包含换行符号
    if ([contModel.val containsString:@"<BR>"]) {
        
        //包含HTML的换行符将其转换成OC的换行符\n 的形式
        NSArray *arry = [contModel.val componentsSeparatedByString:@"<BR>"];
        
        NSString *detailsStr = [[NSString alloc]init];
        
        for (NSString *str in arry) {
            detailsStr = [detailsStr stringByAppendingFormat:@"\n%@",str];
        }
        NSLog(@"details====%@",detailsStr);
        
        self.detailsL.text = detailsStr;
        
    }else{
        
       self.detailsL.text = contModel.val;
    }
}
@end
