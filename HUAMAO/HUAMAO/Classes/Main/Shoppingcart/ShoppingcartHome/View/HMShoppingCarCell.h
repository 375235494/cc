//
//  HMShoppingCarCell.h
//  HUAMAO
//
//  Created by karl_pei on 2017/7/5.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMShoppingCarModel.h"
#import "HMShoppingDetailsModel.h"


@protocol HMShoppingCarCellDelegate <NSObject>
@optional

- (void)deleteOrder_on:(NSString *)Order_on;

- (void)sendShop_id:(NSString *)shop_id Phone:(NSString *)phone Oname:(NSString *)oname  Address:(NSString *)address Shopzonggong :(NSString *)shopzonggong;

@end


@interface HMShoppingCarCell : UITableViewCell

@property (weak,  nonatomic)id<HMShoppingCarCellDelegate>delegate;

@property(nonatomic, strong) HMShoppingCarModel *shoppingCarModel;

@property(nonatomic, strong) HMShoppingDetailsModel *detailsModel;

@property (weak, nonatomic) IBOutlet UIImageView *isSure;

@end
