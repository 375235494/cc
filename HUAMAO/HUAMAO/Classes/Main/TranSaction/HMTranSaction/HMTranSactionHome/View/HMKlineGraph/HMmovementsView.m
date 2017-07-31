//
//  HMmovementsView.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/31.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMmovementsView.h"

#import "Charts/Charts.h"

#import "DateValueFormatter.h"

#import "HMcurveLineModel.h"

#import "HMLine.h"


#import "HMpiceFluctuationsDataSouce.h"

#import "HMcurveLineModel.h"

#import "HMproductPrice.h"

@interface HMmovementsView()
<IChartAxisValueFormatter,IChartValueFormatter>

@property(strong,nonatomic)ChartLimitLine *limitline;

@end

@implementation HMmovementsView{
    
    LineChartView *_linechartView;
}

-(instancetype)initWithFrame:(CGRect)frame {
    
    if(self = [super initWithFrame:frame]){
        
        [self uiConfig];
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(DataChageAction:) name:@"DataChage" object:nil];
        
    }
    
    return self;
    
}



-(void)DataChageAction :(NSNotification *)notifica{
    
    NSLog(@"%@",notifica.userInfo);
    
    NSInteger contractSelct = [notifica.userInfo[@"contractSelct"] integerValue];
    
    NSInteger MovementsSelect = [notifica.userInfo[@"MovementsSelect"] integerValue];
    
    
    if(MovementsSelect != 0) return;
    
    HMpiceFluctuationsDataSouce *souce =  [HMpiceFluctuationsDataSouce sharedpiceFluctuationsDataSouce];

    
    switch (contractSelct) {
        case 0:{
 
            self.limitline.limit =  souce.productPriceMol.curr_4.floatValue;
            
            self.limitline.label =[NSString stringWithFormat:@"%@",souce.productPriceMol.curr_4];
            
             [self LineViewSetDatawithxValues:souce.lineMol.curveLineModel4.arytime andYvalues:souce.lineMol.curveLineModel4.aryVal judgeWithtime:souce.time andVal:souce.productPriceMol.curr_4];
        }
            
            break;
            
        case 1:{
            
            self.limitline.limit =  souce.productPriceMol.curr_1.floatValue;
            
            self.limitline.label =[NSString stringWithFormat:@"%@",souce.productPriceMol.curr_1];
            
            [self LineViewSetDatawithxValues:souce.lineMol.curveLineModel1.arytime andYvalues:souce.lineMol.curveLineModel1.aryVal judgeWithtime:souce.time andVal:souce.productPriceMol.curr_1];
        }
            
            break;
            
        case 2:{
            
            self.limitline.limit =  souce.productPriceMol.curr_2.floatValue;
            
            self.limitline.label =[NSString stringWithFormat:@"%@",souce.productPriceMol.curr_2];
           
            
            [self LineViewSetDatawithxValues:souce.lineMol.curveLineModel2.arytime andYvalues:souce.lineMol.curveLineModel2.aryVal judgeWithtime:souce.time andVal:souce.productPriceMol.curr_2];
        }
            
            break;
            
        default:
            break;
    }

}


-(void)LineViewSetDatawithxValues :(NSArray *)xVals andYvalues:(NSArray *)yVal judgeWithtime:(NSString*)time andVal :(NSNumber *)val{

    // 设置X轴数据
    
     if(yVal.count <= 0 || yVal ==nil) return;
    
     if(xVals.count <= 0 || xVals ==nil) return;
    
    NSArray *xValues ;
    
    NSArray *yValues ;
    
    if([xVals.lastObject isEqualToString:time]){

        xValues= [NSMutableArray arrayWithArray:xVals];
        
        yValues = [NSMutableArray arrayWithArray:yVal];

    }else{
    
        NSMutableArray *xSetMutable = [NSMutableArray arrayWithArray:xVals];
        
        [xSetMutable removeObjectAtIndex:0];
        
        [xSetMutable addObject:time];
        
        NSMutableArray *ySetMutable = [NSMutableArray arrayWithArray:yVal];
        
        [ySetMutable removeObjectAtIndex:0];
        
        [ySetMutable addObject:val];
        
        xValues = xSetMutable;
        
        yValues = ySetMutable;
    }

    
    if (xValues.count > 0) {
        _linechartView.xAxis.valueFormatter = [[DateValueFormatter alloc] initWithDateArr:xValues];
        // 这里将代理赋值为一个类的对象, 该对象需要遵循IChartAxisValueFormatter协议, 并实现其代理方法(我们可以对需要显示的值进行各种处理, 这里对日期进行格式处理)(当然下面的各代理也都可以这样写)
    }
    
    
    NSArray *statistics = @[
                            yValues];
    
    NSLog(@"%@",yVal);
    
    NSArray *legendTitles = @[@"111111111"];
    
    NSArray *colors = @[[UIColor whiteColor]]; // 折线颜色数组
    
    NSMutableArray *dataSets = [[NSMutableArray alloc] init]; //数据集数组
    
    // 这样写的好处是, 无论你传多少条数据, 都可以处理展示
    
    LineChartDataSet *set = [self drawLineWithArr:statistics[0]  title:legendTitles[0] color:colors[0]];
    
    [dataSets addObject:set];
    
    // 赋值数据集数组
    if (dataSets.count > 0) {
        
        LineChartData *data = [[LineChartData alloc] initWithDataSets:dataSets];
        
        
        _linechartView.data = data;
    }
    
    
}


- (void)uiConfig {
    
    _linechartView = [[LineChartView alloc] init];
    
    _linechartView.backgroundColor = HMUIColorFromRgbAlpha(0x1e1e1e , 1);
    
    
    _linechartView.frame = CGRectMake(30, 0, HMLXScreenWidth-60, 200);
    
    _linechartView.dragEnabled = YES;
    
    _linechartView.pinchZoomEnabled = NO;   //捏合手势
    
    _linechartView.doubleTapToZoomEnabled = NO; //双击手势
    
    _linechartView.scaleYEnabled = NO;  //取消Y轴缩放
    
    _linechartView.legend.form = ChartLegendFormLine;   //说明图标
    
    _linechartView.chartDescription.enabled = NO; //不显示描述label
    
    _linechartView.noDataText = @"暂无数据";
    
    _linechartView.chartDescription.enabled = YES;
    
    //    _linechartView.scaleYEnabled = NO;//取消Y轴缩放
    //    _linechartView.doubleTapToZoomEnabled = NO;//取消双击缩放
    
    _linechartView.dragEnabled = NO;//启用拖拽图标
    //
    //    _linechartView.dragDecelerationEnabled = YES;//拖拽后是否有惯性效果
    //
    //    _linechartView.dragDecelerationFrictionCoef = 0.9;//拖拽后惯性效果的摩擦系数(0~1)，数值越小，惯性越不明显
    //描述及图例样式
    [_linechartView setDescriptionText:@""];
    
    _linechartView.legend.enabled = NO;
    
    [_linechartView animateWithXAxisDuration:0.3];  //赋值动画时长
    
    
    
    // 设置左Y轴
    _linechartView.leftAxis.enabled = NO;
    
    ChartYAxis *rigthAxis = _linechartView.rightAxis;
    
    
    rigthAxis.gridLineDashLengths = @[@3.0f, @3.0f];
    
    rigthAxis.axisLineColor = HMUIColorFromRgbAlpha(0x333333, 1);;
    
    rigthAxis.labelFont = [UIFont systemFontOfSize:11.f];
    
    rigthAxis.labelTextColor = HMUIColorFromRgbAlpha(0xaeadad, 1);//文字颜色
    
    rigthAxis.gridColor = HMUIColorFromRgbAlpha(0x454545, 1);//网格线颜色
    
    rigthAxis.gridAntialiasEnabled = NO;//开启抗锯齿
    
//    rigthAxis.forceLabelsEnabled = NO;
////
//    rigthAxis.labelCount = 6;
    
    // 设置折线数据
    // 这里模拟了3条折线
    
    
    
    ChartLimitLine *limitLine = [[ChartLimitLine alloc] init];
    
    self.limitline = limitLine;

    
    limitLine.lineWidth = 1;
    
    limitLine.lineColor = HMUIColorFromRgbAlpha(0xfe0202, 1);
    
    
    limitLine.lineDashLengths = @[@5.0f, @5.0f];//虚线样式
    
    
    limitLine.labelPosition = ChartLimitLabelPositionRightTop;//位置
    
    
    limitLine.valueTextColor = HMUIColorFromRgbAlpha(0xfe0202, 1);//label文字颜色
    
    
    limitLine.valueFont = [UIFont systemFontOfSize:11.f];//label字体
    
    
    [_linechartView.rightAxis addLimitLine:limitLine];//添加到Y轴上
    
    
//    _linechartView.rightAxis.drawLimitLinesBehindDataEnabled = YES;//设置限制线绘制在折线图的后面
    

    
    // 设置X轴
    ChartXAxis *xAxis = _linechartView.xAxis;
    
    xAxis.granularityEnabled = YES;//设置重复的值不显示
    
    xAxis.labelPosition = XAxisLabelPositionBottom;
    
    xAxis.gridColor = [UIColor yellowColor];
    
    xAxis.labelFont = [UIFont systemFontOfSize:11.f];
    
    xAxis.labelTextColor = HMUIColorFromRgbAlpha(0xaeadad, 1);
    
    xAxis.axisLineColor = HMUIColorFromRgbAlpha(0x333333, 1);
    
    //    xAxis.axisMinValue = -0.3;
    //
    //    xAxis.granularity = 1.0;
    
    xAxis.drawAxisLineEnabled = YES;    //是否画x轴线
    
    xAxis.drawGridLinesEnabled = NO;   //是否画网格
    
    //    xAxis.gridLineDashLengths = @[@5.f, @5.f];

    
    [self addSubview:_linechartView];
}




#pragma mark - 根据数据数组 title color 创建折线set
- (LineChartDataSet *)drawLineWithArr:(NSArray *)arr title:(NSString *)title color:(UIColor *)color {
    
     @synchronized(self){
    
            if (arr.count == 0) {
                return nil;
            }
            // 处理折线数据
            NSMutableArray *statistics = [NSMutableArray array];
        //    double leftAxisMin = 0;
        //    double leftAxisMax = 0;
            for (int i = 0; i < arr.count; i++) {
                NSNumber *num = arr[i];
                double value = [num doubleValue];
        //        leftAxisMax = MAX(value, leftAxisMax);
        //        leftAxisMin = MIN(value, leftAxisMin);
                [statistics addObject:[[ChartDataEntry alloc] initWithX:i y:value]];
            }
        //    CGFloat topNum = leftAxisMax * (5.0/4.0);
        //    _linechartView.rightAxis.axisMaxValue = topNum;
        //    if (leftAxisMin < 0) {
        //        CGFloat minNum = leftAxisMin * (5.0/4.0);
        //        _linechartView.rightAxis.axisMinValue = minNum ;
        //    }
            
            // 设置Y轴数据
            _linechartView.rightAxis.valueFormatter = self; //需要遵IChartAxisValueFormatter协议
            
            // 设置折线数据
            LineChartDataSet *set1 = nil;
            
            set1.drawFilledEnabled = YES;
        //    set1.fillColor = [UIColor redColor];//填充颜色
            set1.fillAlpha = 0.3;
            
            
            set1 = [[LineChartDataSet alloc] initWithValues:statistics label:title];
            
            set1.mode = LineChartModeCubicBezier;   // 弧度mode
            
            set1.drawValuesEnabled = NO;
            
            
            
            set1.drawCirclesEnabled = NO;
            [set1 setColor:color];
            [set1 setCircleColor:color];
            set1.lineWidth = 0.7;
            set1.circleRadius = 3.0;
            set1.valueColors = @[color];
            set1.valueFormatter = self; //需要遵循IChartValueFormatter协议
            set1.valueFont = [UIFont systemFontOfSize:12.f];
            
            set1.highlightEnabled = NO;
            
            //第二种填充样式:渐变填充
            set1.drawFilledEnabled = YES;//是否填充颜色
            
            NSArray *gradientColors = @[(id)HMUIColorFromRgbAlpha(0x828080, 1).CGColor,
                                        (id)HMUIColorFromRgbAlpha(0x2d2d2d, 1).CGColor];
            CGGradientRef gradientRef = CGGradientCreateWithColors(nil, (CFArrayRef)gradientColors, nil);
            set1.fillAlpha = 0.7f;//透明度
            set1.fill = [ChartFill fillWithLinearGradient:gradientRef angle:12.f];//赋值填充颜色对象
            CGGradientRelease(gradientRef);//释放gradientRef
            
            return set1;
         
         
         }
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
