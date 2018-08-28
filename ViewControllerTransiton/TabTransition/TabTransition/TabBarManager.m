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

- (instancetype)init {
    if (self = [super init]) {
        _interactiveTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
    }
    return self;
}

- (nullable id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    NSInteger fromIndex = [tabBarController.viewControllers indexOfObject:fromVC];
    NSInteger toIndex = [tabBarController.viewControllers indexOfObject:toVC];
    JJAnimatorTransitionTabControllerSubType subType = (toIndex > fromIndex) ? right : left;
    
    return [[Animator alloc] initWithTransitionType:TabControllerType subType:subType];
}

- (nullable id<UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    // 只要返回交互控制器，则自动转场失效，只能通过交互控制器控制转场进度；所以，在非交互的转场中，返回nil
    return self.isInteractive ? self.interactiveTransition : nil;
}

@end
