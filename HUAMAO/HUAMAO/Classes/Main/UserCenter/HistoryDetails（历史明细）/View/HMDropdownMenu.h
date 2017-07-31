//
//  HMDropdownMenu.h
//  HUAMAO
//
//  Created by  on 2017/5/24.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HMDropdownMenu;


@protocol HMDropdownMenuDelegate <NSObject>

@optional

- (void)dropdownMenuWillShow:(HMDropdownMenu *)menu;    // 当下拉菜单将要显示时调用
- (void)dropdownMenuDidShow:(HMDropdownMenu *)menu;     // 当下拉菜单已经显示时调用
- (void)dropdownMenuWillHidden:(HMDropdownMenu *)menu;  // 当下拉菜单将要收起时调用
- (void)dropdownMenuDidHidden:(HMDropdownMenu *)menu;   // 当下拉菜单已经收起时调用

- (void)dropdownMenu:(HMDropdownMenu *)menu selectedCellNumber:(NSInteger)number; // 当选择某个选项时调用

@end


@interface HMDropdownMenu : UIView <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UIButton * mainBtn;  // 主按钮 可以自定义样式 可在.m文件中修改默认的一些属性

@property (nonatomic, assign) id <HMDropdownMenuDelegate>delegate;


- (void)setMenuTitles:(NSArray *)titlesArr rowHeight:(CGFloat)rowHeight;  // 设置下拉菜单控件样式

- (void)showDropDown; // 显示下拉菜单
- (void)hideDropDown; // 隐藏下拉菜单




@end
