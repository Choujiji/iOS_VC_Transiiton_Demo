//
//  TransitionManager.m
//  ModalTransition
//
//  Created by mac on 2018/8/17.
//  Copyright © 2018年 jiji. All rights reserved.
//

#import "TransitionManager.h"
#import "Animator.h"

@implementation TransitionManager

- (nullable id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[Animator alloc] initWithTransitionType:ModalType subType:presention];
}

- (nullable id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[Animator alloc] initWithTransitionType:ModalType subType:dismissal];
}

@end
