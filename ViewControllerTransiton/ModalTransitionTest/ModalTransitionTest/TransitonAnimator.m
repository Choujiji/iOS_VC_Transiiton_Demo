//
//  TransitonAnimator.m
//  ModalTransitionTest
//
//  Created by mac on 2018/8/28.
//  Copyright © 2018年 jiji. All rights reserved.
//

#import "TransitonAnimator.h"

@interface TransitonAnimator ()

@end

@implementation TransitonAnimator

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    // 转场容器视图
    UIView *containerView = [transitionContext containerView];
    // VC
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    // View
    UIView *fromView = fromVC.view;
    UIView *toView = toVC.view;

    
    CGFloat containerHeight = CGRectGetHeight(containerView.bounds);
    
    // 起止状态
    CGRect toViewStartFrame = CGRectMake(0, containerHeight, CGRectGetWidth(toView.bounds), CGRectGetHeight(toView.bounds));
    CGRect toViewEndFrame = CGRectMake(0, 0, CGRectGetWidth(toView.bounds), CGRectGetHeight(toView.bounds));
    
    // presentation过程
    if (toVC.isBeingPresented) {
        // 从下到上出现
        
        // 给fromView添加缩小动画
        CGAffineTransform fromViewStartTransform = CGAffineTransformIdentity;
        CGAffineTransform fromViewEndTransform = CGAffineTransformScale(fromViewStartTransform, 0.8, 0.8);
        
        // 将toView加到容器上
        toView.frame = toViewStartFrame;
        [containerView addSubview:toView];
        
        fromView.transform = fromViewStartTransform;

        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            toView.frame = toViewEndFrame;
            fromView.transform = fromViewEndTransform;
        } completion:^(BOOL finished) {
            // 结束转场
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }
    
    // dismissal过程
    if (fromVC.isBeingDismissed) {
        // 从上到下消失
        
        if (transitionContext.presentationStyle != UIModalPresentationCustom) {
                // 非自定义展示样式，此时，presentingView（toView）不在containerView上，需要加上
            [containerView insertSubview:toView atIndex:0];
        }
        
        // 给presentingView添加动画
        [containerView insertSubview:toView atIndex:0];
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            fromView.frame = toViewStartFrame;
            
            toView.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
                // 结束转场
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

@end
