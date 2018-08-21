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

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    // 返回自定义动画对象
    return [[Animator alloc] initWithTransitionType:NavigationControllerType subType:operation];
}

@end
