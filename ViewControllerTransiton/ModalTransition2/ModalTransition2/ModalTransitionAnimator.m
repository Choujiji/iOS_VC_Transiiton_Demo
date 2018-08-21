//
//  ModalTransitionAnimator.m
//  ModalTransition2
//
//  Created by mac on 2018/8/21.
//  Copyright © 2018年 jiji. All rights reserved.
//

#import "ModalTransitionAnimator.h"

@implementation ModalTransitionAnimator

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = fromVC.view;
    UIView *toView = toVC.view;
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    UIView *containerView = [transitionContext containerView];
    // 展现动画
    if ([toVC isBeingPresented]) {
        // 将presentedView加到containerView上
        [containerView addSubview:toView];
        
        CGSize toViewEndSize = CGSizeMake(2.0 / 3.0 * CGRectGetWidth(containerView.bounds), 2.0 / 3.0 * CGRectGetHeight(containerView.bounds));
        toView.center = containerView.center;
        toView.bounds = CGRectMake(0, 0, 1, toViewEndSize.height);
        
        [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            toView.bounds = CGRectMake(0, 0, toViewEndSize.width, toViewEndSize.height);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
        
    }
    // 消失动画
    if ([fromVC isBeingDismissed]) {
        // custom的presentation方式。默认presentingView在出现后不被移除（并且presentView不是在containerView上），所以不可以再添加到containerView上
        [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            CGFloat fromViewHeight = CGRectGetHeight(fromView.bounds);
            fromView.bounds = CGRectMake(0, 0, 1, fromViewHeight);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.4;
}

@end
