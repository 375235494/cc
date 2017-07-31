//
//  HMHelpCenterController.m
//  HUAMAO
//  Created by karl_pei on 2017/6/19.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "Node.h"

@implementation Node

-(instancetype)initWithParentId:(int)parentId nodeId:(int)nodeId name:(NSString *)name depth:(int)depth expand:(BOOL)expand Image:(UIImage *)image ColorCont:(int)cont
{
    self = [self init];
    if (self) {
        self.parentId = parentId;
        self.nodeId = nodeId;
        self.name = name;
        self.depth = depth;
        self.expand = expand;
        self.image = image;
        self.colorCont = cont;
    }
    return self;
}


@end
