//
//  TabBarManager.m
//  TabTransition
//
//  Created by mac on 2018/8/17.
//  Copyright © 2018年 jiji. All rights reserved.
//

#import "TabBarManager.h"
#import "Animator.h"

@implementation TabBarManager

- (nullable id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    NSInteger fromIndex = [tabBarController.viewControllers indexOfObject:fromVC];
    NSInteger toIndex = [tabBarController.viewControllers indexOfObject:toVC];
    JJAnimatorTransitionTabControllerSubType subType = (toIndex > fromIndex) ? right : left;
    
    return [[Animator alloc] initWithTransitionType:TabControllerType subType:subType];
}

@end
