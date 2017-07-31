//
//  HMLine.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/26.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMLine.h"

#import "HMcurveLineModel.h"

#import "HMKlinemodel.h"

@implementation HMLine

-(HMcurveLineModel*)curveLineModel1{
    if(_curveLineModel1 == nil){
        
        _curveLineModel1 = [[HMcurveLineModel alloc]init];
        
    }
    
    return _curveLineModel1;
    
}


-(HMcurveLineModel*)curveLineModel2{
    if(_curveLineModel2 == nil){
        
        _curveLineModel2 = [[HMcurveLineModel alloc]init];
        
    }
    
    return _curveLineModel2;
    
}



-(HMcurveLineModel*)curveLineModel3{
    if(_curveLineModel3 == nil){
        
        _curveLineModel3 = [[HMcurveLineModel alloc]init];
        
    }
    
    return _curveLineModel3;
    
}


-(HMcurveLineModel*)curveLineModel4{
    if(_curveLineModel4 == nil){
        
        _curveLineModel4 = [[HMcurveLineModel alloc]init];
        
    }
    
    return _curveLineModel4;
    
}



-(void)setDicmarket:(NSDictionary *)dicmarket{
    

    _dicmarket = dicmarket;
    
    NSLog(@"%@",dicmarket[@"4"]);

    self.curveLineModel1.curverLineAry = dicmarket[@"1"];
    
    self.curveLineModel2.curverLineAry = dicmarket[@"2"];
    
    self.curveLineModel3.curverLineAry = dicmarket[@"3"];
    
    self.curveLineModel4.curverLineAry = dicmarket[@"4"];
    
}


-(void)setKlinemodel:(NSDictionary *)Klinemodel{
    
    _Klinemodel = Klinemodel;
    
    self.Klinemodelmol1_1.dicSouce = Klinemodel[@"1_1"];
    
    self.Klinemodelmol1_3.dicSouce = Klinemodel[@"1_3"];
    
    self.Klinemodelmol1_5.dicSouce = Klinemodel[@"1_5"];
    
    self.Klinemodelmol1_15.dicSouce = Klinemodel[@"1_15"];
    
    
    
    self.Klinemodelmol2_1.dicSouce = Klinemodel[@"2_1"];
    
    self.Klinemodelmol2_3.dicSouce = Klinemodel[@"2_3"];
    
    self.Klinemodelmol2_5.dicSouce = Klinemodel[@"2_5"];
    
    self.Klinemodelmol2_15.dicSouce = Klinemodel[@"2_15"];
    
    
    self.Klinemodelmol3_1.dicSouce = Klinemodel[@"3_1"];
    
    self.Klinemodelmol3_3.dicSouce = Klinemodel[@"3_3"];
    
    self.Klinemodelmol3_5.dicSouce = Klinemodel[@"3_5"];
    
    self.Klinemodelmol3_15.dicSouce = Klinemodel[@"3_15"];
    
    
    self.Klinemodelmol4_1.dicSouce = Klinemodel[@"4_1"];
    
    self.Klinemodelmol4_3.dicSouce = Klinemodel[@"4_3"];
    
    self.Klinemodelmol4_5.dicSouce = Klinemodel[@"4_5"];
    
    self.Klinemodelmol4_15.dicSouce = Klinemodel[@"4_15"];
    
}

-(HMKlinemodel *)Klinemodelmol1_1{
    
    if(_Klinemodelmol1_1 == nil){
        
        _Klinemodelmol1_1 = [[HMKlinemodel alloc]init];
    }
    
    return _Klinemodelmol1_1;
    
}

-(HMKlinemodel *)Klinemodelmol1_3{
    
    if(_Klinemodelmol1_3 == nil){
        
        _Klinemodelmol1_3 = [[HMKlinemodel alloc]init];
    }
    
    return _Klinemodelmol1_3;
    
}

-(HMKlinemodel *)Klinemodelmol1_5{
    
    if(_Klinemodelmol1_5 == nil){
        
        _Klinemodelmol1_5 = [[HMKlinemodel alloc]init];
    }
    
    return _Klinemodelmol1_5;
    
}

-(HMKlinemodel *)Klinemodelmol1_15{
    
    if(_Klinemodelmol1_15 == nil){
        
        _Klinemodelmol1_15 = [[HMKlinemodel alloc]init];
    }
    
    return _Klinemodelmol1_15;
    
}

-(HMKlinemodel *)Klinemodelmol2_1{
    
    if(_Klinemodelmol2_1 == nil){
        
        _Klinemodelmol2_1 = [[HMKlinemodel alloc]init];
    }
    
    return _Klinemodelmol2_1;
    
}

-(HMKlinemodel *)Klinemodelmol2_3{
    
    if(_Klinemodelmol2_3 == nil){
        
        _Klinemodelmol2_3 = [[HMKlinemodel alloc]init];
    }
    
    return _Klinemodelmol2_3;
    
}


-(HMKlinemodel *)Klinemodelmol2_5{
    
    if(_Klinemodelmol2_5 == nil){
        
        _Klinemodelmol2_5 = [[HMKlinemodel alloc]init];
    }
    
    return _Klinemodelmol2_5;
    
}
-(HMKlinemodel *)Klinemodelmol2_15{
    
    if(_Klinemodelmol2_15 == nil){
        
        _Klinemodelmol2_15 = [[HMKlinemodel alloc]init];
    }
    
    return _Klinemodelmol2_15;
    
}
-(HMKlinemodel *)Klinemodelmol3_1{
    
    if(_Klinemodelmol3_1 == nil){
        
        _Klinemodelmol3_1 = [[HMKlinemodel alloc]init];
    }
    
    return _Klinemodelmol3_1;
    
}

-(HMKlinemodel *)Klinemodelmol3_3{
    
    if(_Klinemodelmol3_3 == nil){
        
        _Klinemodelmol3_3 = [[HMKlinemodel alloc]init];
    }
    
    return _Klinemodelmol3_3;
    
}


-(HMKlinemodel *)Klinemodelmol3_5{
    
    if(_Klinemodelmol3_5 == nil){
        
        _Klinemodelmol3_5 = [[HMKlinemodel alloc]init];
    }
    
    return _Klinemodelmol3_5;
    
}
-(HMKlinemodel *)Klinemodelmol3_15{
    
    if(_Klinemodelmol3_15 == nil){
        
        _Klinemodelmol3_15 = [[HMKlinemodel alloc]init];
    }
    
    return _Klinemodelmol3_15;
    
}

-(HMKlinemodel *)Klinemodelmol4_1{
    
    if(_Klinemodelmol4_1 == nil){
        
        _Klinemodelmol4_1 = [[HMKlinemodel alloc]init];
    }
    
    return _Klinemodelmol4_1;
    
}

-(HMKlinemodel *)Klinemodelmol4_3{
    
    if(_Klinemodelmol4_3 == nil){
        
        _Klinemodelmol4_3 = [[HMKlinemodel alloc]init];
    }
    
    return _Klinemodelmol4_3;
    
}


-(HMKlinemodel *)Klinemodelmol4_5{
    
    if(_Klinemodelmol4_5 == nil){
        
        _Klinemodelmol4_5 = [[HMKlinemodel alloc]init];
    }
    
    return _Klinemodelmol4_5;
    
}
-(HMKlinemodel *)Klinemodelmol4_15{
    
    if(_Klinemodelmol4_15 == nil){
        
        _Klinemodelmol4_15 = [[HMKlinemodel alloc]init];
    }
    
    return _Klinemodelmol4_15;
    
}

@end
