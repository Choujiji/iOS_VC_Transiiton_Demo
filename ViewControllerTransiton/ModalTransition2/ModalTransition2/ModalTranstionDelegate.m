//
//  ModalTranstionDelegate.m
//  ModalTransition2
//
//  Created by mac on 2018/8/21.
//  Copyright © 2018年 jiji. All rights reserved.
//

#import "ModalTranstionDelegate.h"
#import "ModalTransitionAnimator.h"
#import "AnimationPresentationController.h"

@implementation ModalTranstionDelegate

- (nullable id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[ModalTransitionAnimator alloc] init];
}

- (nullable id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[ModalTransitionAnimator alloc] init];
}

- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    return [[AnimationPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

@end
