//
//  NavigationTransitionManager.m
//  NavigationTransition
//
//  Created by mac on 2018/8/16.
//  Copyright © 2018年 jiji. All rights reserved.
//

#import "NavigationTransitionManager.h"
#import "Animator.h"

@implementation NavigationTransitionManager

- (instancetype)init {
    if (self = [super init]) {
        _interactiveTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
    }
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    // 返回自定义动画对象
    return [[Animator alloc] initWithTransitionType:NavigationControllerType subType:operation];
}

- (nullable id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
        // 返回交互式对象（交互过程才返回交互对象，否则：只要指定了交互控制器，则系统不再自动进行转场，控制权完全转给了交互控制器。若此时没有调用交互控制器或转场上下文对象来更新进度，且在转场过程中，view的交互是禁止的，故界面卡死。因此，只有在需要交互时才返回交互对象，否则只返回nil）
    return self.isInteractive ? self.interactiveTransition : nil;
}

@end
