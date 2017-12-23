//
//  ALAlertPresentAnimator.m
//  ALAlertViewController
//
//  Created by liuchengquan on 2017/12/21.
//  Copyright © 2017年 liuchengquan. All rights reserved.
//

#import "ALAlertPresentAnimator.h"
#import "ALAlertController.h"

@implementation ALAlertPresentAnimator


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    switch (self.presentStyle) {
        case ALAlertPresentStyleSystem:
            return 0.3;
        case ALAlertPresentStyleFadeIn:
            return 0.2;
        case ALAlertPresentStyleBounce:
            return 0.42;
        case ALAlertPresentStyleExpandHorizontal:
            return 0.3;
        case ALAlertPresentStyleExpandVertical:
            return 0.3;
        case ALAlertPresentStyleSlideDown:
            return 0.5;
        case ALAlertPresentStyleSlideUp:
            return 0.5;
        case ALAlertPresentStyleSlideLeft:
            return 0.4;
        case ALAlertPresentStyleSlideRight:
            return 0.4;
        case ALAlertPresentStyleFlipFromRight:
            return 1.0;
    }
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    [self animateWithStyle:self.presentStyle context:transitionContext];
}

- (void)animateWithStyle:(ALAlertPresentStyle)style context:(id<UIViewControllerContextTransitioning>)transitionContext{
    switch (style) {
        case ALAlertPresentStyleSystem:
            [self systemAnimationWithContext:transitionContext];
            break;
        case ALAlertPresentStyleFadeIn:
            [self fadeInAnimationWithContext:transitionContext];
            break;
        case ALAlertPresentStyleBounce:
            [self bounceAnimationWithContext:transitionContext];
            break;
        case ALAlertPresentStyleExpandHorizontal:
            [self expandHorizontalAnimationWithContext:transitionContext];
            break;
        case ALAlertPresentStyleExpandVertical:
            [self expandVerticalAnimationWithContext:transitionContext];
            break;
        case ALAlertPresentStyleSlideDown:
            [self slideDownAnimationWithContext:transitionContext];
            break;
        case ALAlertPresentStyleSlideUp:
            [self slideUpAnimationWithContext:transitionContext];
            break;
        case ALAlertPresentStyleSlideLeft:
            [self slideLeftAnimationWithContext:transitionContext];
            break;
        case ALAlertPresentStyleSlideRight:
            [self slideRightAnimationWithContext:transitionContext];
            break;
        case ALAlertPresentStyleFlipFromRight:
            [self flipFromRightAnimationWithContext:transitionContext];
            break;
    }
}

- (void)systemAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    ALAlertController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundView.alpha = 0;
    toVC.alertView.alpha = 0;
    toVC.alertView.transform = CGAffineTransformMakeScale(1.3, 1.3);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         toVC.backgroundView.alpha = al_backgroundAlpha;
                         toVC.alertView.alpha = 1;
                         toVC.alertView.transform = CGAffineTransformIdentity;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)fadeInAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.view.alpha = 0;
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         toVC.view.alpha = 1;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)bounceAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    ALAlertController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundView.alpha = 0;
    toVC.alertView.alpha = 0;
    toVC.alertView.transform = CGAffineTransformMakeScale(0, 0);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:0.7
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         toVC.backgroundView.alpha = al_backgroundAlpha;
                         toVC.alertView.alpha = 1;
                         toVC.alertView.transform = CGAffineTransformIdentity;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)expandHorizontalAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    ALAlertController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundView.alpha = 0;
    toVC.alertView.alpha = 0;
    toVC.alertView.transform = CGAffineTransformMakeScale(0, 1);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:0.75
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         toVC.backgroundView.alpha = al_backgroundAlpha;
                         toVC.alertView.alpha = 1;
                         toVC.alertView.transform = CGAffineTransformIdentity;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)expandVerticalAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    ALAlertController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundView.alpha = 0;
    toVC.alertView.alpha = 0;
    toVC.alertView.transform = CGAffineTransformMakeScale(1, 0);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:0.75
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         toVC.backgroundView.alpha = al_backgroundAlpha;
                         toVC.alertView.alpha = 1;
                         toVC.alertView.transform = CGAffineTransformIdentity;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)slideDownAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    ALAlertController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundView.alpha = 0;
    toVC.alertView.center = CGPointMake(toVC.view.center.x, -toVC.alertView.frame.size.height/2.0);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         toVC.backgroundView.alpha = al_backgroundAlpha;
                         toVC.alertView.center = toVC.view.center;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)slideUpAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    ALAlertController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundView.alpha = 0;
    toVC.alertView.center = CGPointMake(toVC.view.center.x, toVC.view.frame.size.height+toVC.alertView.frame.size.height/2.0);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         toVC.backgroundView.alpha = al_backgroundAlpha;
                         toVC.alertView.center = toVC.view.center;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)slideLeftAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    ALAlertController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundView.alpha = 0;
    toVC.alertView.center = CGPointMake(toVC.view.frame.size.width+toVC.alertView.frame.size.width/2.0, toVC.view.center.y);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:0.7
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         toVC.backgroundView.alpha = al_backgroundAlpha;
                         toVC.alertView.center = toVC.view.center;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)slideRightAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    ALAlertController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    toVC.backgroundView.alpha = 0;
    toVC.alertView.center = CGPointMake(-toVC.alertView.frame.size.width/2.0, toVC.view.center.y);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0
         usingSpringWithDamping:0.7
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         toVC.backgroundView.alpha = al_backgroundAlpha;
                         toVC.alertView.center = toVC.view.center;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}




- (void)flipFromRightAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    //TODO: 上下文对象transitionContext包含了参与过渡动画的视图
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewKey];
    BOOL hasViewForKey = [transitionContext respondsToSelector:@selector(viewForKey:)];
    UIView *fromView = hasViewForKey ? [transitionContext viewForKey:UITransitionContextFromViewKey] : fromVC.view;
    UIView *toView = hasViewForKey ? [transitionContext viewForKey:UITransitionContextToViewKey] : toVC.view;
    UIView *containerView = [transitionContext containerView];

    //TODO: 获取一个目的视图的一个快照。设置初始frame为initFrame。
    UIView *snapshot = [toView snapshotViewAfterScreenUpdates:YES];
    snapshot.frame = toView.bounds;
    //TODO: containerView加入目的视图和快照视图，并先隐藏目的视图。
    [containerView addSubview:toView];
    [containerView addSubview:snapshot];
    toView.hidden = YES;
    //TODO: 设置动画视角，将快照视图先沿Y轴旋转到PI/2的位置。
    snapshot.layer.transform = [self yRotation:M_PI_2];
    snapshot.alpha = 0.0;
    CGFloat duration = [self transitionDuration:transitionContext];
    [UIView animateKeyframesWithDuration:duration delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.5 animations:^{
            fromView.layer.transform = [self yRotation:-M_PI_2];
            fromView.alpha = 0;
        }];
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:1 animations:^{
            snapshot.layer.transform = [self yRotation:0.0];
            snapshot.alpha = 1;
        }];
    } completion:^(BOOL finished){
        toView.hidden = NO; //显示目的视图
        fromView.layer.transform = [self yRotation:0.0]; //恢复第一个视图的位置
        fromView.alpha = 1;
        [snapshot removeFromSuperview]; //移除快照视图
        [transitionContext completeTransition:YES]; //通知UIKit动画执行完成
    }
     ];
}

- (CATransform3D)yRotation:(CGFloat)angle {
    return CATransform3DMakeRotation(angle, 0.0, 1.0, 0.0);
}





@end
