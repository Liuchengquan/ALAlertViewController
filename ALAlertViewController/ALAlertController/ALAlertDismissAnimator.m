//
//  ALAlertDismissAnimator.m
//  ALAlertViewController
//
//  Created by liuchengquan on 2017/12/21.
//  Copyright © 2017年 liuchengquan. All rights reserved.
//

#import "ALAlertDismissAnimator.h"
#import "ALAlertController.h"
@implementation ALAlertDismissAnimator





// 过渡时间
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    switch (self.dismissStyle) {
        case ALAlertDismissStyleFadeOut:
            return 0.15;
        case ALAlertDismissStyleContractHorizontal:
            return 0.2;
        case ALAlertDismissStyleContractVertical:
            return 0.2;
        case ALAlertDismissStyleSlideDown:
            return 0.25;
        case ALAlertDismissStyleSlideUp:
            return 0.25;
        case ALAlertDismissStyleSlideLeft:
            return 0.2;
        case ALAlertDismissStyleSlideRight:
            return 0.2;
        case ALAlertDismissStyleFlipFromRight:
            return 1.0;
    }
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    [self animateWithStyle:self.dismissStyle context:transitionContext];
}

- (void)animateWithStyle:(ALAlertDismissStyle)style context:(id<UIViewControllerContextTransitioning>)transitionContext {
    switch (self.dismissStyle) {
        case ALAlertDismissStyleFadeOut:
            [self fadeOutAnimationWithContext:transitionContext];
            break;
        case ALAlertDismissStyleContractHorizontal:
            [self contractHorizontalAnimationWithContext:transitionContext];
            break;
        case ALAlertDismissStyleContractVertical:
            [self contractVerticalAnimationWithContext:transitionContext];
            break;
        case ALAlertDismissStyleSlideDown:
            [self slideDownAnimationWithContext:transitionContext];
            break;
        case ALAlertDismissStyleSlideUp:
            [self slideUpAnimationWithContext:transitionContext];
            break;
        case ALAlertDismissStyleSlideLeft:
            [self slideLeftAnimationWithContext:transitionContext];
            break;
        case ALAlertDismissStyleSlideRight:
            [self slideRightAnimationWithContext:transitionContext];
            break;
        case ALAlertDismissStyleFlipFromRight:
            //TODO: 暂时不添加了
            [self flipFromRightAnimationWithContext:transitionContext];
            break;
    }
}

- (void)fadeOutAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.view.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)contractHorizontalAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    ALAlertController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.backgroundView.alpha = 0;
                         fromVC.alertView.transform = CGAffineTransformMakeScale(0.001, 1);
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)contractVerticalAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    ALAlertController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.backgroundView.alpha = 0;
                         fromVC.alertView.transform = CGAffineTransformMakeScale(1, 0.01);
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)slideDownAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    ALAlertController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.backgroundView.alpha = 0;
                         fromVC.alertView.center = CGPointMake(fromVC.view.center.x, fromVC.view.frame.size.height + fromVC.alertView.frame.size.height/2.0);
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)slideUpAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    ALAlertController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.backgroundView.alpha = 0;
                         fromVC.alertView.center = CGPointMake(fromVC.view.center.x, -fromVC.alertView.frame.size.height/2.0);
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)slideLeftAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    ALAlertController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.backgroundView.alpha = 0;
                         fromVC.alertView.center = CGPointMake(-fromVC.alertView.frame.size.width/2.0, fromVC.view.center.y);
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)slideRightAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    ALAlertController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                     animations:^{
                         fromVC.backgroundView.alpha = 0;
                         fromVC.alertView.center = CGPointMake(fromVC.view.frame.size.width + fromVC.alertView.frame.size.width/2.0, fromVC.view.center.y);
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}




- (void)flipFromRightAnimationWithContext:(id<UIViewControllerContextTransitioning>)transitionContext{
    //TODO: 上下文对象transitionContext包含了参与过渡动画的视图
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    BOOL hasViewForKey = [transitionContext respondsToSelector:@selector(viewForKey:)];
    UIView *fromView = hasViewForKey ? [transitionContext viewForKey:UITransitionContextFromViewKey] : fromVC.view;
    UIView *toView = hasViewForKey ? [transitionContext viewForKey:UITransitionContextToViewKey] : toVC.view;
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toView];
    //TODO: 设置动画视角，将快照视图先沿Y轴旋转到PI/2的位置。
    UIView *snapshot = [toView snapshotViewAfterScreenUpdates:YES];
    snapshot.frame = toView.bounds;
    snapshot.layer.transform = [self yRotation:-M_PI_2];
    snapshot.alpha = 0.0;
    [containerView addSubview:snapshot];
    toView.hidden = YES;
    CGFloat duration = [self transitionDuration:transitionContext];
    [UIView animateKeyframesWithDuration:duration delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.5 animations:^{
            fromView.layer.transform = [self yRotation:M_PI_2];
            fromView.alpha = 0;
        }];
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:1 animations:^{
            snapshot.layer.transform = [self yRotation:0.0];
            snapshot.alpha = 1;
        }];
    } completion:^(BOOL finished){
        toView.hidden = NO; //显示目的视图
        fromView.layer.transform = [self yRotation:0.0]; //恢复第一个视图的位置
        [snapshot removeFromSuperview]; //移除快照视图
        [transitionContext completeTransition:YES]; //通知UIKit动画执行完成
    }
     ];
}

- (CATransform3D)yRotation:(CGFloat)angle {
    return CATransform3DMakeRotation(angle, 0.0, 1.0, 0.0);
}







@end
