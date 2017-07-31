//
//  HMHelpCenterController.m
//  HUAMAO
//  Created by karl_pei on 2017/6/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  每个节点类型
 */
@interface Node : NSObject

@property (nonatomic , assign) int parentId;//父节点的id，如果为-1表示该节点为根节点

@property (nonatomic , assign) int nodeId;//本节点的id

@property (nonatomic , copy) NSString *name;//本节点的名称

@property (nonatomic , assign) int depth;//该节点的深度

@property (nonatomic , assign) BOOL expand;//该节点是否处于展开状态

@property(nonatomic , copy) UIImage *image;//要现实图片

@property (nonatomic , assign) int colorCont;//节点的cell颜色值code

/**
 *快速实例化该对象模型
 */
- (instancetype)initWithParentId:(int)parentId nodeId:(int)nodeId name:(NSString *)name depth:(int)depth  expand: (BOOL)expand Image:(UIImage *)image ColorCont:(int)cont;

@end
