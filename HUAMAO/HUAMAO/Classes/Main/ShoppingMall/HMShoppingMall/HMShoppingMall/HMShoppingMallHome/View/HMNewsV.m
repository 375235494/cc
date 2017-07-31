//
//  HMNewsV.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/6/12.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMNewsV.h"

#import "HMNewCell.h"

@interface HMNewsV ()
<UIScrollViewDelegate>

@property(weak,nonatomic)UIScrollView * scrolV;


@property (nonatomic, retain)NSTimer* rotateTimer;


@property(weak,nonatomic)HMNewCell * leftNewsCell;

@property(weak,nonatomic)HMNewCell *midNewsCell;

@property(weak,nonatomic)HMNewCell * rigthNewsCell;

@property(strong,nonatomic)NSArray * arysouce;


@property(assign,nonatomic)int arrayIndex;

@property(assign,nonatomic)int leftIndex;

@property(assign,nonatomic)int midIndex;

@property(assign,nonatomic)int rigthIndex;

@end

@implementation HMNewsV

-(instancetype)initWithFrame:(CGRect)frame{
    
    if(self == [super initWithFrame:frame]){
        
        _arysouce = @[@[@"金丝楠木臻品手链今日上新，速来围观！",@"高大尚平安车载挂件"],@[@"这里有你想要的宝贝哦!",@"首选精美单品金丝木笔筒盒！"],@[@"金刚菩提血丝凤眼手持把玩紫檀珠",@"卧室客厅照明桃花心木精美台灯"]];
        
        UIImageView * imageV = [[UIImageView alloc]initWithFrame:self.bounds];
        
        imageV.backgroundColor = HMUIColorFromRgb(0x151515);
        
        imageV.contentMode = UIViewContentModeCenter;
        
        imageV.width = 60;
        
        imageV.image = [UIImage imageNamed:@"国翠头条"];
        
        [self addSubview:imageV];
        
        
        UIScrollView * scrolV = [[UIScrollView alloc]init];
        
        scrolV.showsHorizontalScrollIndicator = NO;
        
        scrolV.showsVerticalScrollIndicator = NO;
        
        scrolV.pagingEnabled = YES;
        
        scrolV.bounces = NO;
        
        scrolV.delegate = self;
        
        _scrolV = scrolV;
        
        scrolV.frame = self.bounds;
        
        scrolV.x = imageV.width;
        
        scrolV.width = self.width - scrolV.x;
        
        [self addSubview:scrolV];
        
        [self addCell];
        
        
        [self creatTimer];
        
        self.backgroundColor = HMUIColorFromRgb(0x151515);
        
        scrolV.userInteractionEnabled = NO;

    }
    
    return self;
}

- (void)creatTimer
{
    self.rotateTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(changeScrollViewContentOffset) userInfo:nil repeats:YES] ;
    
    
    [[NSRunLoop mainRunLoop] addTimer:self.rotateTimer forMode:NSRunLoopCommonModes];
}



- (void)changeScrollViewContentOffset
{
    // 每次给scrollView加一个屏幕的偏移量 向右无限滚动
    [self.scrolV setContentOffset:CGPointMake(0 , self.scrolV.contentOffset.y + self.scrolV.height) animated:YES] ;
}



// 当我们手动拖拽时 先将定时器干掉,否则计时器时间到又会滚动图片.
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.rotateTimer invalidate] ;
    
    self.rotateTimer = nil ;
}


// 当手动拖拽结束时 再开启一个新的计时器
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self creatTimer] ;
}

// 当设置偏移量并且带动画效果的时候才会执行该方法
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    
    if (self.scrolV.contentOffset.y == self.scrolV.height) return;
    // 如果是无限向右滚动,由于我们初始时偏移量就在中间,因此一直会执行该段代码
    if (self.scrolV.contentOffset.y > self.scrolV.height)
    {
        // 如果当前下标是数组最后豆素的下标,说明图片已经滚动到最后一张,这是需要重新从第一张开始 否则下标加一
        if (self.arrayIndex == self.arysouce.count - 1)
        {
            self.arrayIndex = 0 ;
        }
        else
        {
            self.arrayIndex ++ ;
        }
    }
    // 如果是无限向左滚动
    else
    {
        if (self.arrayIndex == 0)
        {
            self.arrayIndex = (int)self.arysouce.count - 1 ;
        }
        else
        {
            self.arrayIndex -- ;
        }
    }
    // 当我们计算好数组下标之后,把scrollView的偏移量再重新设置回中间
    [self.scrolV setContentOffset:CGPointMake(0, self.scrolV.height) animated:NO] ; // 此时不用带动画效果

    [self changeSouce:self.arrayIndex] ;
}


// 当减速结束时,改变偏移量,并改变需要显示的图片
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    if (self.scrolV.contentOffset.y == self.scrolV.height) return;
    // 如果是无限向右滚动,由于我们初始时偏移量就在中间,因此一直会执行该段代码
    if (self.scrolV.contentOffset.y > self.scrolV.height)
    {
        // 如果当前下标是数组最后豆素的下标,说明图片已经滚动到最后一张,这是需要重新从第一张开始 否则下标加一
        if (self.arrayIndex == self.arysouce.count - 1)
        {
            self.arrayIndex = 0 ;
        }
        else
        {
            self.arrayIndex ++ ;
        }
    }
    // 如果是无限向左滚动
    else
    {
        if (self.arrayIndex == 0)
        {
            self.arrayIndex = (int)self.arysouce.count - 1 ;
        }
        else
        {
            self.arrayIndex -- ;
        }
    }
    // 当我们计算好数组下标之后,把scrollView的偏移量再重新设置回中间
    [self.scrolV setContentOffset:CGPointMake(0, self.scrolV.height) animated:NO] ; // 此时不用带动画效果
    
    [self changeSouce:self.arrayIndex] ;

}

// 改变imageView显示的图片名称
- (void)changeSouce : (int)index
{
    // 首先取到三个imageView
    //提取imageView


    
    if (index == self.arysouce.count - 1)
    {
        self.midNewsCell.arysouce = self.arysouce[index];
        self.rigthNewsCell.arysouce = self.arysouce[0];
        self.leftNewsCell.arysouce = self.arysouce[index-1];
    }
    else if (index == 0)
    {
        
        self.midNewsCell.arysouce = self.arysouce[index];
        self.rigthNewsCell.arysouce = self.arysouce[1+index];
        self.leftNewsCell.arysouce = self.arysouce.lastObject;
     
    }
    else
    {
        
        self.midNewsCell.arysouce = self.arysouce[index];
        self.rigthNewsCell.arysouce = self.arysouce[1+index];
        self.leftNewsCell.arysouce = self.arysouce[index-1];
    
    }
    
}


-(void)addCell{
    
    for(int i = 0 ; i < 3 ; i++){
        
        HMNewCell  *cell = [HMNewCell NewCell];
        
        cell.x = 0 ;
        
        cell.y = i * self.scrolV.height;
        
        cell.height = self.scrolV.height;
        
        cell.width = self.scrolV.width;
        
        [self.scrolV addSubview:cell];
        
        if(i == 0){
            
            cell.arysouce = [self.arysouce lastObject];
            
            self.leftNewsCell = cell;
            
            
            
        }else if(i == 1){
            
            cell.arysouce = [self.arysouce firstObject];
            
            self.midNewsCell = cell;
            
        }else{
            
            cell.arysouce = self.arysouce[1];
            
            self.leftNewsCell = cell;
        }
        
    }
    
    
    self.scrolV.contentSize = CGSizeMake(0, self.scrolV.height * 3);
    
    
}

@end
