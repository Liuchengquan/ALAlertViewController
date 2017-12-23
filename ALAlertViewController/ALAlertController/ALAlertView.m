//
//  ALAlertView.m
//  ALAlertViewController
//
//  Created by liuchengquan on 2017/12/21.
//  Copyright © 2017年 liuchengquan. All rights reserved.
//

#import "ALAlertView.h"
#import "ALAlertAction.h"
/** 间隙*/
const static CGFloat padding = 15.0;
/** 弹窗总宽度 */
const static CGFloat alertWith = 270;

/** 内容宽度*/
const static CGFloat containerWidth = alertWith - 2* padding;

/** 按钮高度 */
const static CGFloat buttonHeight = 40.0f;

@interface ALAlertView()
@property (nonatomic , strong) NSMutableArray<ALAlertAction *> *actions;
@property (nonatomic , strong) NSMutableArray<UIButton *> * buttons;


@property (nonatomic , strong) UIView * containerView;

@property (nonatomic , strong) UIScrollView * scrollView;

@property (nonatomic , strong) UILabel * titleLabel;

@property (nonatomic , strong) UILabel * messageLabel;

//按钮背景 两种 ， 白色 和 灰色
@property (nonatomic , strong) UIImage * whiteImage;
@property (nonatomic , strong) UIImage * blackImage;


@end

@implementation ALAlertView

-(NSMutableArray<UIButton *> *)buttons{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (NSMutableArray<ALAlertAction *> *)actions{
    if (!_actions) {
        _actions = [NSMutableArray array];
    }
    return _actions;
}


/** 初始化方法 */

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message{
    self = [super init];
    if (!self) { return nil; };
    
    self.layer.cornerRadius = 6;
    self.clipsToBounds = YES;
    self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    
    // 初始化
    _containerView = [[UIView alloc] init];
    _scrollView = [[UIScrollView alloc] init];
    _titleLabel = [[UILabel alloc] init];
    _messageLabel = [[UILabel alloc] init];
    
    // 添加到父视图
    [self addSubview:_containerView];
    [_containerView addSubview:_scrollView];
    [_scrollView addSubview:_titleLabel];
    [_scrollView addSubview:_messageLabel];
    _scrollView.backgroundColor = [UIColor purpleColor];
    
    // 设置 containerView
    _containerView.backgroundColor = [UIColor whiteColor];
    _containerView.backgroundColor = [UIColor greenColor];
    
    // 设置 titleLabel
    _titleLabel.text = title;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.numberOfLines = 0;
    _titleLabel.font = [UIFont boldSystemFontOfSize:17.0];
    
    
    // 设置 messageLabel
    _messageLabel.text = message;
    _messageLabel.textAlignment = NSTextAlignmentCenter;
    _messageLabel.numberOfLines = 0;
    _messageLabel.font = [UIFont systemFontOfSize:13.0];
    
    // 添加约束 titleLabel
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint constraintWithItem:_titleLabel
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:containerWidth].active = YES;
    [NSLayoutConstraint constraintWithItem:_titleLabel
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_messageLabel
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0
                                  constant:-padding].active = YES;
    [NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_scrollView
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0
                                  constant:0.0].active = YES;
    [NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeLeft
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_scrollView
                                 attribute:NSLayoutAttributeLeft
                                multiplier:1.0
                                  constant:0.0].active = YES;
    [NSLayoutConstraint constraintWithItem:_titleLabel attribute:NSLayoutAttributeRight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_scrollView
                                 attribute:NSLayoutAttributeRight
                                multiplier:1.0
                                  constant:0.0].active = YES;
    
    // 添加约束 messageLabel
    _messageLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint constraintWithItem:_messageLabel
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:containerWidth].active = YES;
    [NSLayoutConstraint constraintWithItem:_messageLabel
                                 attribute:NSLayoutAttributeLeft
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_scrollView
                                 attribute:NSLayoutAttributeLeft
                                multiplier:1.0
                                  constant:0.0].active = YES;
    [NSLayoutConstraint constraintWithItem:_messageLabel
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_scrollView
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:0.0].active = YES;
    [NSLayoutConstraint constraintWithItem:_messageLabel
                                 attribute:NSLayoutAttributeRight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_scrollView
                                 attribute:NSLayoutAttributeRight
                                multiplier:1.0
                                  constant:0.0].active = YES;
    
    // 添加约束 scrollView
    //    CGFloat scrollViewHeight = titleHeight+messageHeight+padding;
    CGFloat scrollViewHeight = [_titleLabel sizeThatFits:CGSizeMake(containerWidth, 1)].height+[_messageLabel sizeThatFits:CGSizeMake(containerWidth, 1)].height+padding;
    _scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint constraintWithItem:_scrollView
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:containerWidth].active = YES;
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_scrollView
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:scrollViewHeight];
    heightConstraint.priority = UILayoutPriorityDefaultLow;
    heightConstraint.active = YES;
    [NSLayoutConstraint constraintWithItem:_scrollView
                                 attribute:NSLayoutAttributeLeft
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_containerView
                                 attribute:NSLayoutAttributeLeft
                                multiplier:1.0
                                  constant:15.0].active = YES;
    [NSLayoutConstraint constraintWithItem:_scrollView
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_containerView
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0
                                  constant:15.0].active = YES;
    [NSLayoutConstraint constraintWithItem:_scrollView
                                 attribute:NSLayoutAttributeRight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_containerView
                                 attribute:NSLayoutAttributeRight
                                multiplier:1.0
                                  constant:-15.0].active = YES;
    [NSLayoutConstraint constraintWithItem:_scrollView
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_containerView
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:-15.0].active = YES;
    
    
    // 添加约束 containerView
    _containerView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint constraintWithItem:_containerView
                                 attribute:NSLayoutAttributeLeft
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self
                                 attribute:NSLayoutAttributeLeft
                                multiplier:1.0
                                  constant:0.0].active = YES;
    [NSLayoutConstraint constraintWithItem:_containerView
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0
                                  constant:0.0].active = YES;
    [NSLayoutConstraint constraintWithItem:_containerView
                                 attribute:NSLayoutAttributeRight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self
                                 attribute:NSLayoutAttributeRight
                                multiplier:1.0
                                  constant:0.0].active = YES;
    
    // 添加约束 self
    CGFloat maxHeight = [UIScreen mainScreen].bounds.size.height - 100.0;
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint constraintWithItem:self
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationLessThanOrEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:maxHeight].active = YES;
    
    return self;

}


- (void)addAction:(ALAlertAction *)action{
    [self.actions addObject:action];
    UIButton * actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [actionButton setTag:[self.actions indexOfObject:action]];
    [actionButton setTitle:action.title forState:UIControlStateNormal];
    [actionButton setTitleColor:action.titleColor forState:UIControlStateNormal];
    [actionButton setBackgroundColor:action.backgroundColor];
    actionButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [actionButton addTarget:self action:@selector(actionButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:actionButton];
    [self.buttons addObject:actionButton];
    [self setNeedsUpdateConstraints];  // 更新约束
    
}

- (void)actionButtonClick:(UIButton *)btn{
    void (^handler) (void) = self.actions[btn.tag].handler;
    if (handler) {
        handler();
    }
    if (_controller) {
        [_controller dismissViewControllerAnimated:YES completion:nil];
    }
}


- (void)updateConstraints{
    // 根据button 数量布局
    switch (self.buttons.count) {
        case 2:
            [self layoutButtonsHorizontal];
            break;
        default:
            [self layoutButtonsVertical];
            break;
    }
    [super updateConstraints];
}


+ (BOOL)requiresConstraintBasedLayout{
    return YES;
}

/** 两个按钮
 
 
 ---------  ----------
 -button1-  -button2 -
 ---------  ----------
 
 */
- (void)layoutButtonsHorizontal{
    UIButton *leftButton = self.buttons[0];
    UIButton *rightButton = self.buttons[1];
    
    // 左边按钮
    leftButton.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint constraintWithItem:leftButton
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:buttonHeight].active = YES;
    [NSLayoutConstraint constraintWithItem:leftButton
                                 attribute:NSLayoutAttributeLeft
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self
                                 attribute:NSLayoutAttributeLeft
                                multiplier:1.0
                                  constant:0.0].active = YES;
    [NSLayoutConstraint constraintWithItem:leftButton
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_containerView
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:0.5].active = YES;
    
    // 右边按钮
    rightButton.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint constraintWithItem:rightButton
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:buttonHeight].active = YES;
    [NSLayoutConstraint constraintWithItem:rightButton
                                 attribute:NSLayoutAttributeRight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self
                                 attribute:NSLayoutAttributeRight
                                multiplier:1.0
                                  constant:0.0].active = YES;
    [NSLayoutConstraint constraintWithItem:rightButton
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:_containerView
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:0.5].active = YES;
    [NSLayoutConstraint constraintWithItem:rightButton
                                 attribute:NSLayoutAttributeLeft
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:leftButton
                                 attribute:NSLayoutAttributeRight
                                multiplier:1.0 constant:0.5].active = YES;
    [NSLayoutConstraint constraintWithItem:rightButton
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:leftButton
                                 attribute:NSLayoutAttributeWidth
                                multiplier:1.0
                                  constant:0.0].active = YES;
    
    // 设置 alert 底部约束
    [NSLayoutConstraint constraintWithItem:self
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:rightButton
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:0.0].active = YES;

    
}

/** 多个按钮
 
 
 -------------------
 -     button1     -
 -------------------

 -------------------
 -     button2     -
 -------------------
 
 -------------------
 -     button3     -
 -------------------


 */

- (void)layoutButtonsVertical{
    
    // 记录最下面的一个view
    UIView *lastView;
    
    // 遍历在数组中的button，添加到alert上
    for(UIButton *button in self.buttons) {
        
        if(!lastView) {
            lastView = _containerView;
        }
        
        button.translatesAutoresizingMaskIntoConstraints = NO;
        [NSLayoutConstraint constraintWithItem:button
                                     attribute:NSLayoutAttributeLeft
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeLeft
                                    multiplier:1.0
                                      constant:0.0].active = YES;
        [NSLayoutConstraint constraintWithItem:button
                                     attribute:NSLayoutAttributeRight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeRight
                                    multiplier:1.0
                                      constant:0.0].active = YES;
        [NSLayoutConstraint constraintWithItem:button
                                     attribute:NSLayoutAttributeHeight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1.0
                                      constant:buttonHeight].active = YES;
        [NSLayoutConstraint constraintWithItem:button
                                     attribute:NSLayoutAttributeTop
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:lastView
                                     attribute:NSLayoutAttributeBottom
                                    multiplier:1.0
                                      constant:0.5].active = YES;
        
        lastView = button;
        
    }
    
    // 设置 alert 底部约束
    [NSLayoutConstraint constraintWithItem:self
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:lastView
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:0.0].active = YES;
}

@end
