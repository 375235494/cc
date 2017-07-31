//
//  HMHelpCenterController.m
//  HUAMAO
//  Created by karl_pei on 2017/6/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "TreeTableView.h"
#import "Node.h"
#import "HMPayMentView.h"

@interface TreeTableView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic , strong) NSArray *data;//传递过来已经组织好的数据（全量数据）

@property (nonatomic , strong) NSMutableArray *tempData;//用于存储数据源（部分数据）

@end


@implementation TreeTableView

-(instancetype)initWithFrame:(CGRect)frame withData : (NSArray *)data{
    
    
    self = [super initWithFrame:frame style:UITableViewStyleGrouped];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        _data = data;
        _tempData = [self createTempData:data];
    }
    return self;
}

/**
 * 初始化数据源
 */
-(NSMutableArray *)createTempData : (NSArray *)data{
    NSMutableArray *tempArray = [NSMutableArray array];
    for (int i=0; i<data.count; i++) {
        Node *node = [_data objectAtIndex:i];
        if (node.expand) {
            [tempArray addObject:node];
        }
    }
    return tempArray;
}


#pragma mark - UITableViewDataSource

#pragma mark - Required

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _tempData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
     static NSString *NODE_CELL_ID = @"node_cell_id";
//     static NSString *NODE_CELL_ID1 = @"node_cell_id";
    
      UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NODE_CELL_ID]; //列出可重用的cell
//     UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:NODE_CELL_ID1]; //列
        if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:NODE_CELL_ID];
     }
//       if (!cell1) {
//          cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:NODE_CELL_ID1];
//    }

   // 显示文字的内容
    Node *node = [_tempData objectAtIndex:indexPath.row];

       //第一二层cell
    if (node.colorCont == 0 || node.colorCont == 3 || node.colorCont == 2) {
       
        cell.backgroundColor = HMColor(31, 31, 31);
         cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        
    }else if(node.colorCont == 1){
       
        cell.backgroundColor = [UIColor clearColor];
        
        cell.accessoryType = UITableViewCellAccessoryNone;
    }if (node.colorCont == 4) {
        
        cell.backgroundColor = HMColor(31, 31, 31);
        
         cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    
    
//    if ( node.colorCont == 10) {
//        
//        NSString *codeStr = [NSString stringWithFormat:@"%ld",indexPath.row];
//        
//        
//        HMPayMentView *payMentV = [[[NSBundle mainBundle] loadNibNamed:@"HMPayMentView" owner:nil options:nil] lastObject];
//        payMentV.code = codeStr;
//        payMentV.frame = cell.bounds;
//        payMentV.backgroundColor = [UIColor blackColor];
//        [cell addSubview:payMentV];
//    }

    UIFont *font = [UIFont systemFontOfSize:14];
    NSString *content = node.name;
    cell.indentationLevel = node.depth; // 缩进级别
    cell.indentationWidth = 20.f; // 每个缩进级别的距离
    // 设置显示文字
    cell.textLabel.text = content;
    
    cell.textLabel.attributedText = [self getAttributedStringWithString:content lineSpace:1];
    // 自动换行
    cell.textLabel.numberOfLines = 0;
    // 设置显示字体(一定要和之前计算是使用字体一致)
    cell.textLabel.font = font;
    cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
   
    //获得当前cell高度
    CGRect frame = [cell frame];
    //设置label的最大行数
    cell.textLabel.numberOfLines = 10;
    CGSize size = CGSizeMake(300, 1000);
    
    CGSize labelSize = [cell.textLabel.text sizeWithFont:cell.textLabel.font constrainedToSize:size lineBreakMode:NSLineBreakByClipping];
    cell.textLabel.frame = CGRectMake(cell.textLabel.frame.origin.x, cell.textLabel.frame.origin.y,labelSize.width, labelSize.height);
    //计算出自适应的高度
    frame.size.height = labelSize.height + 30;
    cell.frame = frame;
    cell.textColor = HMColor(220, 220, 220);
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    
  return cell;
//  return cell1;

}

#pragma mark - Optional
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.00001;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
     Node *node = [_tempData objectAtIndex:indexPath.row];
    if (node.colorCont == 0 || node.colorCont == 1 || node.colorCont == 3 || node.colorCont == 2 || node.colorCont == 4) {
        // 列款
        CGFloat contentWidth = HMLXScreenWidth;
        // 与上字体保持一致
        UIFont *font = [UIFont systemFontOfSize:14];
        // 显示的内容
        NSString *content = node.name;
        
        // 计算出显示完內容需要的最小尺寸
        CGSize size = [content sizeWithFont:font constrainedToSize:CGSizeMake(contentWidth, 1000.0f) lineBreakMode:UILineBreakModeWordWrap];
        // 返回需要的高度
               
        return size.height + 30;
        
        

    } else {
        
            return HMLXScreenHeight - 100;
    }

}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //先修改数据源
    Node *parentNode = [_tempData objectAtIndex:indexPath.row];
    if (_treeTableCellDelegate && [_treeTableCellDelegate respondsToSelector:@selector(cellClick:Code:)]) {
        [_treeTableCellDelegate cellClick:parentNode Code:1];
    }
    

    NSUInteger startPosition = indexPath.row+1;
    NSUInteger endPosition = startPosition;
    BOOL expand = NO;
    for (int i=0; i<_data.count; i++) {
        Node *node = [_data objectAtIndex:i];
        if (node.parentId == parentNode.nodeId) {
            node.expand = !node.expand;
            if (node.expand) {
                [_tempData insertObject:node atIndex:endPosition];
                expand = YES;
                endPosition++;
            }else{
                expand = NO;
                endPosition = [self removeAllNodesAtParentNode:parentNode];
                
                if (_treeTableCellDelegate && [_treeTableCellDelegate respondsToSelector:@selector(cellClick:Code:)]) {
                    [_treeTableCellDelegate cellClick:parentNode Code:0];
                }
                
                break;

            }
        }
    }
    
    //获得需要修正的indexPath
    NSMutableArray *indexPathArray = [NSMutableArray array];
    for (NSUInteger i=startPosition; i<endPosition; i++) {
        NSIndexPath *tempIndexPath = [NSIndexPath indexPathForRow:i inSection:0];
        [indexPathArray addObject:tempIndexPath];
    }
    
    //插入或者删除相关节点
    if (expand) {
        [self insertRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationNone];
    }else{
        [self deleteRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationNone];
    }
}

/**
 *  删除该父节点下的所有子节点（包括孙子节点）
 *  @param parentNode 父节点
 *  @return 该父节点下一个相邻的统一级别的节点的位置
 */
-(NSUInteger)removeAllNodesAtParentNode : (Node *)parentNode{
    NSUInteger startPosition = [_tempData indexOfObject:parentNode];
    NSUInteger endPosition = startPosition;
    for (NSUInteger i=startPosition+1; i<_tempData.count; i++) {
        Node *node = [_tempData objectAtIndex:i];
        
        endPosition++;
        if (node.depth <= parentNode.depth) {
            break;
        }
        if(endPosition == _tempData.count - 1){
            endPosition++;
            node.expand = NO;
            break;
        }
        node.expand = NO;
    }
    if (endPosition>startPosition) {
        [_tempData removeObjectsInRange:NSMakeRange(startPosition + 1, endPosition-startPosition - 1)];
    }
    
    return endPosition;
    

}


//调整行距
-(NSAttributedString *)getAttributedStringWithString:(NSString *)string lineSpace:(CGFloat)lineSpace {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    paragraphStyle.lineSpacing = lineSpace; // 调整行间距
    
    NSRange range = NSMakeRange(0, [string length]);
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    
    return attributedString;
}


@end
