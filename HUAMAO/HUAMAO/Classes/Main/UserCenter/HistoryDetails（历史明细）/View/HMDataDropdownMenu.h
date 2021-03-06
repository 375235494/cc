//
//  HMDataDropdownMenu.h
//  HUAMAO
//
//  Created by  on 2017/5/24.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMDataDropdownMenu;


@protocol HMDataDropdownMenuDelegate <NSObject>

@optional

- (void)dropdownMenuWillShow:(HMDataDropdownMenu *)menu;    // 当下拉菜单将要显示时调用
- (void)dropdownMenuDidShow:(HMDataDropdownMenu *)menu;     // 当下拉菜单已经显示时调用
- (void)dropdownMenuWillHidden:(HMDataDropdownMenu *)menu;  // 当下拉菜单将要收起时调用
- (void)dropdownMenuDidHidden:(HMDataDropdownMenu *)menu;   // 当下拉菜单已经收起时调用

- (void)detaDropdownMenu:(HMDataDropdownMenu *)menu selectedCellNumber:(NSInteger)number; // 当选择某个选项时调用

@end



@interface HMDataDropdownMenu : UIView <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UIButton * mainBtn;  // 主按钮 可以自定义样式 可在.m文件中修改默认的一些属性

@property (nonatomic, assign) id <HMDataDropdownMenuDelegate>delegate;


- (void)setMenuTitles:(NSArray *)titlesArr rowHeight:(CGFloat)rowHeight;  // 设置下拉菜单控件样式

- (void)showDropDown; // 显示下拉菜单
- (void)hideDropDown; // 隐藏下拉菜单




@end
