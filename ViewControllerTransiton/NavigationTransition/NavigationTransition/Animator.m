//
//  Animator.m
//  NavigationTransition
//
//  Created by mac on 2018/8/16.
//  Copyright © 2018年 jiji. All rights reserved.
//

#import "Animator.h"

@interface Animator ()

@property (assign, nonatomic) JJAnimatorTransitionType transitionType;
@property (assign, nonatomic) NSUInteger subType;

@end

@implementation Animator


- (instancetype)initWithTransitionType:(JJAnimatorTransitionType)transitionType subType:(NSUInteger)subType {
    if (self = [super init]) {
        self.transitionType = transitionType;
        self.subType = subType;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = transitionContext.containerView;
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = fromVC.view;
    UIView *toView = toVC.view;
    
    CGAffineTransform fromViewBeginTransform = CGAffineTransformIdentity;
    CGAffineTransform toViewBeginTransform = CGAffineTransformIdentity;
    CGAffineTransform fromViewEndTransform = CGAffineTransformIdentity;
    CGAffineTransform toViewEndTransform = CGAffineTransformIdentity;
    
    switch (self.transitionType) {
        case NavigationControllerType: {
            CGFloat translation = CGRectGetWidth(containerView.bounds);
            // toView的初始位置：push时，在屏幕右侧；Pop时，在屏幕左侧
            toViewBeginTransform = CGAffineTransformMakeTranslation(self.subType == Push ? translation : -translation, 0);
            // fromView的结束位置：push时，不变；pop时，在屏幕右侧
            fromViewEndTransform = CGAffineTransformMakeTranslation(self.subType == Push ? 0 : translation, 0);
        }
            break;
        default:
            break;
    }
    [containerView addSubview:toView];
    
    // 执行动画
    fromView.transform = fromViewBeginTransform;
    toView.transform = toViewBeginTransform;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromView.transform = fromViewEndTransform;
        toView.transform = toViewEndTransform;
    } completion:^(BOOL finished) {
        fromView.transform = CGAffineTransformIdentity;
        toView.transform = CGAffineTransformIdentity;
        // 转场完成
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}

@end
