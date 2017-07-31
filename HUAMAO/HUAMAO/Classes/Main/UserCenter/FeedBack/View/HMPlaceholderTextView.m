//
//  HMPlaceholderTextView.m
//  HUAMAO
//
//  Created by 裴小康 on 2017/5/17.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMPlaceholderTextView.h"

@interface HMPlaceholderTextView ()

@end

@implementation HMPlaceholderTextView
#pragma mark - init
- (UILabel *)placeholderLabel
{
    if (!_placeholderLabel) {
        UILabel *placeholderLabel = [[UILabel alloc] init];
        placeholderLabel.x = 4;
        placeholderLabel.y = 8;
        placeholderLabel.numberOfLines = 0;
        [self addSubview:placeholderLabel];
        _placeholderLabel = placeholderLabel;
    
    }
    return _placeholderLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.font = [UIFont systemFontOfSize:15];
        
        self.placeholderColor = [UIColor grayColor];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}



/**
 *  监听文字改变
 */
- (void)textDidChange
{
    self.placeholderLabel.hidden = self.hasText;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置宽度
    self.placeholderLabel.width = self.width - 2 * self.placeholderLabel.x;
    
    // 自动计算高度
    [self.placeholderLabel sizeToFit];
}

#pragma mark - setter
- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = [placeholder copy];
    
    self.placeholderLabel.text = placeholder;
    
    // 重新布局子控件
    [self setNeedsLayout];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    
    self.placeholderLabel.textColor = placeholderColor;
}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    self.placeholderLabel.font = font;
    
    // 重新布局子控件
    [self setNeedsLayout];
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    
    self.placeholderLabel.hidden = self.hasText;
}

- (void)setAttributedText:(NSAttributedString *)attributedText
{
    [super setAttributedText:attributedText];
    
    self.placeholderLabel.hidden = self.hasText;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
