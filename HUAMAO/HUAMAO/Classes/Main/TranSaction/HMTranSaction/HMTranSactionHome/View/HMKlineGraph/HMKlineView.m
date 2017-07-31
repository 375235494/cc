//
//  HMKlineView.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/31.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMKlineView.h"

#import "Charts/Charts.h"

#import "HMpiceFluctuationsDataSouce.h"

#import "HMLine.h"

#import "HMKlinemodel.h"

#import "DateValueFormatter.h"

#import "HMTimeChangeModel.h"

#import "HMproductPrice.h"


@interface HMKlineView()
<ChartViewDelegate,
IChartAxisValueFormatter,IChartValueFormatter>

@property(strong,nonatomic)CandleStickChartView * chartView;

@property(strong,nonatomic)ChartLimitLine *limitline;
@end

@implementation HMKlineView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        
        
        [self uiconfigWithframe:frame];
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(DataChageAction:) name:@"DataChage" object:nil];

 
    }
    
    return self;
    
}


-(void)DataChageAction :(NSNotification *)notifica{
    
    
    NSLog(@"%@",notifica.userInfo);
    
    NSInteger contractSelct = [notifica.userInfo[@"contractSelct"] integerValue];
    
    NSInteger MovementsSelect = [notifica.userInfo[@"MovementsSelect"] integerValue];

    HMpiceFluctuationsDataSouce *souce =  [HMpiceFluctuationsDataSouce sharedpiceFluctuationsDataSouce];
    
    switch (contractSelct) {
        case 0:{
            
            self.limitline.limit = [souce.productPriceMol.curr_4 floatValue];
            
            self.limitline.label = [NSString stringWithFormat:@"%@",souce.productPriceMol.curr_4];
            
            if(MovementsSelect == 1){
          
                [self setDataWithxValues:souce.lineMol.Klinemodelmol4_3.xSet andYset:souce.lineMol.Klinemodelmol4_3.ySet judgeWithtime:souce.timeChangeModel.dicSouce[@"line_4_3"][@"time"] andVal:souce.timeChangeModel.dicSouce[@"line_4_3"][@"val"]];
                
            }else if(MovementsSelect == 2){
                
                
                [self setDataWithxValues:souce.lineMol.Klinemodelmol4_5.xSet andYset:souce.lineMol.Klinemodelmol4_5.ySet judgeWithtime:souce.timeChangeModel.dicSouce[@"line_4_5"][@"time"] andVal:souce.timeChangeModel.dicSouce[@"line_4_5"][@"val"]];
                
            }else if(MovementsSelect == 3){
                
                [self setDataWithxValues:souce.lineMol.Klinemodelmol4_15.xSet andYset:souce.lineMol.Klinemodelmol4_15.ySet judgeWithtime:souce.timeChangeModel.dicSouce[@"line_4_15"][@"time"] andVal:souce.timeChangeModel.dicSouce[@"line_4_15"][@"val"]];
            }
            
           
        }
            
            break;
            
        case 1:{
            
            self.limitline.limit = [souce.productPriceMol.curr_1 floatValue];
            
            self.limitline.label = [NSString stringWithFormat:@"%@",souce.productPriceMol.curr_1];
            
            if(MovementsSelect == 1){
                
                [self setDataWithxValues:souce.lineMol.Klinemodelmol1_3.xSet andYset:souce.lineMol.Klinemodelmol1_3.ySet judgeWithtime:souce.timeChangeModel.dicSouce[@"line_1_3"][@"time"] andVal:souce.timeChangeModel.dicSouce[@"line_1_3"][@"val"]];
                
            }else if(MovementsSelect == 2){
                
                [self setDataWithxValues:souce.lineMol.Klinemodelmol1_5.xSet andYset:souce.lineMol.Klinemodelmol1_5.ySet judgeWithtime:souce.timeChangeModel.dicSouce[@"line_1_5"][@"time"] andVal:souce.timeChangeModel.dicSouce[@"line_1_5"][@"val"]];
                
            }else if(MovementsSelect == 3){
                
                [self setDataWithxValues:souce.lineMol.Klinemodelmol1_15.xSet andYset:souce.lineMol.Klinemodelmol1_15.ySet judgeWithtime:souce.timeChangeModel.dicSouce[@"line_1_15"][@"time"] andVal:souce.timeChangeModel.dicSouce[@"line_1_15"][@"val"]];
            }
            
            
            
        }
            
            break;
            
        case 2:{
            
            self.limitline.limit = [souce.productPriceMol.curr_2 floatValue];
            
            self.limitline.label = [NSString stringWithFormat:@"%@",souce.productPriceMol.curr_2];
            
            if(MovementsSelect == 1){
                
                [self setDataWithxValues:souce.lineMol.Klinemodelmol2_3.xSet andYset:souce.lineMol.Klinemodelmol2_3.ySet judgeWithtime:souce.timeChangeModel.dicSouce[@"line_2_3"][@"time"] andVal:souce.timeChangeModel.dicSouce[@"line_2_3"][@"val"]];
                
            }else if(MovementsSelect == 2){
                
                [self setDataWithxValues:souce.lineMol.Klinemodelmol2_5.xSet andYset:souce.lineMol.Klinemodelmol2_5.ySet judgeWithtime:souce.timeChangeModel.dicSouce[@"line_2_5"][@"time"] andVal:souce.timeChangeModel.dicSouce[@"line_2_5"][@"val"]];
                
            }else if(MovementsSelect == 3){
                
                [self setDataWithxValues:souce.lineMol.Klinemodelmol2_15.xSet andYset:souce.lineMol.Klinemodelmol2_15.ySet judgeWithtime:souce.timeChangeModel.dicSouce[@"line_2_15"][@"time"] andVal:souce.timeChangeModel.dicSouce[@"line_2_15"][@"val"]];
            }
            
          
        }
            
            break;
            
        default:
            break;
    }
   
    
}




-(void)setDataWithxValues:(NSArray *)aryXval andYset:(NSArray *)Yval judgeWithtime:(NSString*)time andVal :(NSArray *)val{
    
    
    
    @synchronized(self){
        
  
            if (aryXval.count <= 0 || aryXval ==nil)  return;
            
            if(Yval.count <= 0 || Yval ==nil) return;
            
            
            // 设置X轴数据
            NSMutableArray *xValues ;//= aryXval;
            
            NSMutableArray *Yset ;//= Yval;
            
            HMpiceFluctuationsDataSouce *souce =  [HMpiceFluctuationsDataSouce sharedpiceFluctuationsDataSouce];
            
            if([souce.timeChangeModel.dicSouce[@"line_4_3"][@"time"] isEqualToString:[souce.lineMol.Klinemodelmol4_3.xSet lastObject]])  {
                
                 xValues = [NSMutableArray arrayWithArray:aryXval];
                
                 Yset = [NSMutableArray arrayWithArray:Yval];
                
                
            }else{
                
                
                
                NSMutableArray *xSetMutable = [NSMutableArray arrayWithArray:aryXval];
                
                
                if(xSetMutable.count ==0) return;
                
                [xSetMutable removeObjectAtIndex:0];
                
                [xSetMutable addObject:time];
                
                NSMutableArray *ySetMutable = [NSMutableArray arrayWithArray:Yval];
                
                [ySetMutable removeObjectAtIndex:0];
                
                [ySetMutable addObject:val];
                
                xValues = xSetMutable;
                
                Yset = ySetMutable;
                
                
            }
            

            NSLog(@"%@",xValues);

                _chartView.xAxis.valueFormatter = [[DateValueFormatter alloc] initWithDateArr:xValues];
                // 这里将代理赋值为一个类的对象, 该对象需要遵循IChartAxisValueFormatter协议, 并实现其代理方法(我们可以对需要显示的值进行各种处理, 这里对日期进行格式处理)(当然下面的各代理也都可以这样写)
                
                NSMutableArray *yVals1 = [[NSMutableArray alloc] init];
                
                for (int i = 0; i < xValues.count; i++)
                {
                    NSArray * arysouce = (NSArray*)Yset[i];
                    
                    double high = (double)  [arysouce[3] floatValue];
                    double low = (double) [arysouce[2] floatValue];
                    double open = (double) [arysouce[0] floatValue];
                    double close = (double) [arysouce[1] floatValue];
                    
                    [yVals1 addObject:[[CandleChartDataEntry alloc] initWithX:i shadowH:high shadowL:low open:open close:close]];
                    
                }
                
                CandleChartDataSet *set1 = [[CandleChartDataSet alloc] initWithValues:yVals1 label:@"Data Set"];
                set1.axisDependency = AxisDependencyLeft;
                [set1 setColor:[UIColor colorWithWhite:80/255.f alpha:1.f]];
                
                set1.drawIconsEnabled = NO;
            
                set1.shadowColorSameAsCandle =YES;
            
                set1.shadowWidth = 0.7;
                set1.decreasingColor = [UIColor colorWithRed:51/255.f green:203/255.f blue:152/255.f alpha:1.f];
                set1.decreasingFilled = YES;
                set1.increasingColor = UIColor.redColor;
                set1.increasingFilled = YES;
                set1.neutralColor = [UIColor colorWithRed:51/255.f green:203/255.f blue:152/255.f alpha:1.f];
            
            
                set1.highlightEnabled = NO;//选中拐点,是否开启高亮效果(显示十字线)
                
                set1.drawValuesEnabled = NO;

                CandleChartData *data = [[CandleChartData alloc]initWithDataSet:set1];
            
                _chartView.data = data;
    
     }
}


-(void)uiconfigWithframe:(CGRect)frame{
    
    _chartView = [[CandleStickChartView alloc]initWithFrame:frame];
    
    _chartView.delegate = self;
    
    _chartView.chartDescription.enabled = NO;
    
    _chartView.maxVisibleCount = 60;
    _chartView.pinchZoomEnabled = NO;
    _chartView.drawGridBackgroundEnabled = NO;
    //
    //        ChartXAxis *xAxis = _chartView.xAxis;
    //        xAxis.labelPosition = XAxisLabelPositionBottom;
    //        xAxis.drawGridLinesEnabled = NO;
    
    //        ChartYAxis *leftAxis = _chartView.leftAxis;
    //        leftAxis.labelCount = 7;
    //        leftAxis.drawGridLinesEnabled = NO;
    //        leftAxis.drawAxisLineEnabled = NO;
    
    //        ChartYAxis *rightAxis = _chartView.rightAxis;
    //        rightAxis.enabled = NO;
    //
    //        _chartView.legend.enabled = NO;
    
//    [self setDataCount:40 + 1 range:100];
    
    
    _chartView.backgroundColor = HMUIColorFromRgbAlpha(0x1e1e1e , 1);
    
    
    _chartView.frame = CGRectMake(30, 0, HMLXScreenWidth-60, 200);
    
    _chartView.dragEnabled = YES;
    
    _chartView.pinchZoomEnabled = NO;   //捏合手势
    
    _chartView.doubleTapToZoomEnabled = NO; //双击手势
    
    _chartView.scaleYEnabled = NO;  //取消Y轴缩放
    
    _chartView.legend.form = ChartLegendFormLine;   //说明图标
    
    _chartView.chartDescription.enabled = NO; //不显示描述label
    
    _chartView.noDataText = @"暂无数据";
    
    _chartView.chartDescription.enabled = YES;
    
    //    _linechartView.scaleYEnabled = NO;//取消Y轴缩放
    //    _linechartView.doubleTapToZoomEnabled = NO;//取消双击缩放
    
    _chartView.dragEnabled = NO;//启用拖拽图标
    //
    //    _linechartView.dragDecelerationEnabled = YES;//拖拽后是否有惯性效果
    //
    //    _linechartView.dragDecelerationFrictionCoef = 0.9;//拖拽后惯性效果的摩擦系数(0~1)，数值越小，惯性越不明显
    //描述及图例样式
    [_chartView setDescriptionText:@""];
    
    _chartView.legend.enabled = NO;
    
    [_chartView animateWithXAxisDuration:0.3];  //赋值动画时长
    
    // 设置左Y轴
    _chartView.leftAxis.enabled = NO;
    
    ChartYAxis *rigthAxis = _chartView.rightAxis;
    
    rigthAxis.gridLineDashLengths = @[@3.0f, @3.0f];
    
    rigthAxis.axisLineColor = HMUIColorFromRgbAlpha(0x333333, 1);;
    
    rigthAxis.labelFont = [UIFont systemFontOfSize:11.0f];
    
    rigthAxis.labelTextColor = HMUIColorFromRgbAlpha(0xaeadad, 1);;//文字颜色
    
    rigthAxis.gridColor = HMUIColorFromRgbAlpha(0x454545, 1);;//网格线颜色
    
    rigthAxis.gridAntialiasEnabled = NO;//开启抗锯齿
    
    ChartLimitLine *limitLine = [[ChartLimitLine alloc] init];
    
//        rigthAxis.forceLabelsEnabled = NO;
//    //
//        rigthAxis.labelCount = 6;
    

    _limitline = limitLine;
    
    limitLine.lineWidth = 1;
    
    limitLine.lineColor = HMUIColorFromRgbAlpha(0xfe0202, 1);
    
    limitLine.lineDashLengths = @[@5.0f, @5.0f];//虚线样式
    
    limitLine.labelPosition = ChartLimitLabelPositionRightTop;//位置
    
    limitLine.valueTextColor = HMUIColorFromRgbAlpha(0xfe0202, 1);//label文字颜色
    
    limitLine.valueFont = [UIFont systemFontOfSize:11];//label字体
    
    [_chartView.rightAxis addLimitLine:limitLine];//添加到Y轴上

//    _chartView.rightAxis.drawLimitLinesBehindDataEnabled = NO;//设置限制线绘制在折线图的后面
    

    // 设置X轴
    ChartXAxis *xAxis = _chartView.xAxis;
    
    xAxis.granularityEnabled = YES;//设置重复的值不显示
    xAxis.labelPosition = XAxisLabelPositionBottom;
    
    xAxis.gridColor = [UIColor yellowColor];
    
    xAxis.labelFont = [UIFont systemFontOfSize:11.f];
    
    xAxis.labelTextColor = HMUIColorFromRgbAlpha(0xaeadad, 1);
    
    xAxis.axisLineColor = HMUIColorFromRgbAlpha(0x333333, 1);;
    
    //    xAxis.axisMinValue = -0.3;
    //
    //    xAxis.granularity = 1.0;
    
    xAxis.drawAxisLineEnabled = YES;    //是否画x轴线
    
    xAxis.drawGridLinesEnabled = NO;   //是否画网格
    
    
    [self addSubview:_chartView];
}

#pragma mark - IChartValueFormatter delegate (折线值)
- (NSString *)stringForValue:(double)value entry:(ChartDataEntry *)entry dataSetIndex:(NSInteger)dataSetIndex viewPortHandler:(ChartViewPortHandler *)viewPortHandler {
    
    return [NSString stringWithFormat:@"%.f", value];
}

#pragma mark - IChartAxisValueFormatter delegate (y轴值) (x轴的值写在DateValueFormatter类里, 都是这个协议方法)
- (NSString *)stringForValue:(double)value axis:(ChartAxisBase *)axis {
    
    
    return [NSString stringWithFormat:@"%.f", value];
}

-(void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
