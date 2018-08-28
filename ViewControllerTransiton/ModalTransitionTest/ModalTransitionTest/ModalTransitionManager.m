//
//  ModalTransitionManager.m
//  ModalTransitionTest
//
//  Created by mac on 2018/8/28.
//  Copyright © 2018年 jiji. All rights reserved.
//

#import "ModalTransitionManager.h"
#import "TransitonAnimator.h"
#import "PresentationController.h"

@implementation ModalTransitionManager

- (instancetype)init {
    if (self = [super init]) {
        // 交互使用
        self.isInteractive = NO;
        self.interactiveTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
    }
    return self;
}

#pragma mark - 动画代理

- (nullable id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[TransitonAnimator alloc] init];
}

- (nullable id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[TransitonAnimator alloc] init];
}

#pragma mark - 展示控制器代理

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    return [[PresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

#pragma mark - 交互代理

- (nullable id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator {
    // 交互状态时，返回交互控制器
    return self.isInteractive ? self.interactiveTransition : nil;
}

- (nullable id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return self.isInteractive ? self.interactiveTransition : nil;
}

@end
