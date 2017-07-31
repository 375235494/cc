//
//  HMshufflingView.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/7/3.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMshufflingView.h"

#define HMCellIdentifier @"news"

#define HMMaxSections 10000


#define shufflingHeigth 150

#import "HMshufflingCell.h"


@interface HMshufflingView()
<UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, weak) IBOutlet UIPageControl *pageContol;
@property (nonatomic, strong) NSArray *shuffingImage;
@property (nonatomic, strong) NSTimer *timer;

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *shufflingLayout;



@end

@implementation HMshufflingView


+(instancetype)shufflingView{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"HMshufflingView" owner:self options:nil]lastObject];
    
   
}

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    _shuffingImage = @[@"Banner4",@"屏风",@"车载挂件",@"象棋"];
    
    
    self.pageContol.numberOfPages = self.shuffingImage.count;
    

    self.collectionView.backgroundColor = HMUIColorFromRgbAlpha(0x0f0f0f , 1);
    
    self.shufflingLayout.itemSize =  CGSizeMake(HMLXScreenWidth, shufflingHeigth);
//    @property (nonatomic) CGFloat minimumLineSpacing;
//    @property (nonatomic) CGFloat minimumInteritemSpacing;
//    
    self.shufflingLayout.minimumLineSpacing = 0;
    
    self.shufflingLayout.minimumInteritemSpacing = 0;
    
    // 注册cell
    [self.collectionView registerNib:[UINib nibWithNibName:@"HMshufflingCell" bundle:nil] forCellWithReuseIdentifier:HMCellIdentifier];
    
    // 默认显示最中间的那组
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:HMMaxSections/2] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    self.collectionView.pagingEnabled = YES;
    
    self.collectionView.bounces = NO;
    
    // 添加定时器
    [self addTimer];
}


/**
 *  添加定时器
 */
- (void)addTimer
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
}

/**
 *  移除定时器
 */
- (void)removeTimer
{
    // 停止定时器
    [self.timer invalidate];
    
    self.timer = nil;
}

- (NSIndexPath *)resetIndexPath
{
    // 当前正在展示的位置
    NSIndexPath *currentIndexPath = [[self.collectionView indexPathsForVisibleItems] lastObject];
    // 马上显示回最中间那组的数据
    NSIndexPath *currentIndexPathReset = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:HMMaxSections/2];
    [self.collectionView scrollToItemAtIndexPath:currentIndexPathReset atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    return currentIndexPathReset;
}

/**
 *  下一页
 */
- (void)nextPage
{
    // 1.马上显示回最中间那组的数据
    NSIndexPath *currentIndexPathReset = [self resetIndexPath];
    
    // 2.计算出下一个需要展示的位置
    NSInteger nextItem = currentIndexPathReset.item + 1;
    NSInteger nextSection = currentIndexPathReset.section;
    if (nextItem == self.shuffingImage.count) {
        nextItem = 0;
        nextSection++;
    }
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    
    // 3.通过动画滚动到下一个位置
    [self.collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.shuffingImage.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return HMMaxSections;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HMshufflingCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HMCellIdentifier forIndexPath:indexPath];
    
    cell.strimage = self.shuffingImage[indexPath.item];
    
    return cell;
}

#pragma mark  - UICollectionViewDelegate
/**
 *  当用户即将开始拖拽的时候就调用
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}

/**
 *  当用户停止拖拽的时候就调用
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //    NSLog(@"scrollViewDidEndDragging--松开");
    [self addTimer];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = (int)(scrollView.contentOffset.x / scrollView.bounds.size.width + 0.5) % self.shuffingImage.count;
    self.pageContol.currentPage = page;
}

+(CGFloat)shufflingH{
    
    return shufflingHeigth;
}


@end
