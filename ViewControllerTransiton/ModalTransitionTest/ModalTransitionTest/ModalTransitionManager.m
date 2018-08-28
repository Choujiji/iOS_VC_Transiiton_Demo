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

- (nullable id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[TransitonAnimator alloc] init];
}

- (nullable id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[TransitonAnimator alloc] init];
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    return [[PresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

@end
