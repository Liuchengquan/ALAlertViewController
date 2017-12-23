//
//  ALAlertController.m
//  ALAlertViewController
//
//  Created by liuchengquan on 2017/12/21.
//  Copyright © 2017年 liuchengquan. All rights reserved.
//

#import "ALAlertController.h"
#import "ALAlertView.h"
#import "ALAlertPresentAnimator.h"
#import "ALAlertDismissAnimator.h"
@interface ALAlertController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ALAlertController

- (instancetype)init{
    self = [super init];
    if (self) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle= UIModalPresentationCustom;
        //设置背景View；
        _backgroundView = [[UIView alloc] init];
        _backgroundView.translatesAutoresizingMaskIntoConstraints = NO;
        _backgroundView.backgroundColor = [UIColor blackColor];
        _backgroundView.alpha = al_backgroundAlpha;        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_backgroundView];
    [self.view addSubview:_alertView];
    
    // 设置灰色半透明背景的约束
    [NSLayoutConstraint constraintWithItem:_backgroundView
                                 attribute:NSLayoutAttributeLeft
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeLeft
                                multiplier:1.0
                                  constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:_backgroundView
                                 attribute:NSLayoutAttributeRight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeRight
                                multiplier:1.0
                                  constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:_backgroundView
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0
                                  constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:_backgroundView
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeBottom
                                multiplier:1.0
                                  constant:0.0].active = YES;
    
    
    // 设置 alertView 在屏幕中心
    [NSLayoutConstraint constraintWithItem:_alertView
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0
                                  constant:0.0].active = YES;
    [NSLayoutConstraint constraintWithItem:_alertView
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1.0
                                  constant:0.0].active = YES;
}


/** 添加action */
- (void)addAction:(ALAlertAction *)action{
    if ([_alertView isMemberOfClass:[ALAlertView class]]) {
        //TODO:  alertView 根据action 初始化
        [(ALAlertView *)_alertView addAction: action];
    }
}

/** 添加action 数组 */
- (void)addActions:(NSArray<ALAlertAction *> *)actions{
    for (ALAlertAction * action  in actions) {
        [self addAction:action];
    }
}

- (void)setAlertViewCornerRadius:(CGFloat)cornerRadius{
    _alertView.layer.cornerRadius = cornerRadius;
}

#pragma mark - 类方法返回实例
/** 默认初始化 */


+ (instancetype)alertWithTitle:(NSString *)title message:(NSString *)messgae{
    ALAlertController * alertController = [[ALAlertController alloc] init];
    alertController.alertView = [[ALAlertView alloc] initWithTitle:title message:messgae];
    ((ALAlertView *)(alertController.alertView)).controller = alertController;
    alertController.presentStyle = ALAlertPresentStyleSystem;
    alertController.dismissStyle = ALAlertDismissStyleFadeOut;
    return alertController;
}

#pragma mark - UIViewControllerTransitioningDelegate

/** present animation */
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    ALAlertPresentAnimator * animator = [[ALAlertPresentAnimator alloc] init];
    animator.presentStyle = self.presentStyle;
    return animator;
}

/** dismiss animation */
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    ALAlertDismissAnimator * animator = [[ALAlertDismissAnimator alloc] init];
    animator.dismissStyle = self.dismissStyle;
    return animator;
}







@end
