//
//  PresentationController.m
//  ModalTransitionTest
//
//  Created by mac on 2018/8/28.
//  Copyright © 2018年 jiji. All rights reserved.
//

#import "PresentationController.h"

@interface PresentationController ()

@property (strong, nonatomic) UIView *backgroundView;

@end

@implementation PresentationController

- (void)presentationTransitionWillBegin {
    self.backgroundView = [[UIView alloc] initWithFrame:self.containerView.bounds];
    self.backgroundView.center = self.containerView.center;
    self.backgroundView.backgroundColor = [UIColor blackColor];
    self.backgroundView.alpha = 0;
    [self.containerView addSubview:self.backgroundView];
    
    [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.backgroundView.alpha = 1;
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
    }];
}

- (void)dismissalTransitionWillBegin {
    [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.backgroundView.alpha = 0;
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        [self.backgroundView removeFromSuperview];
    }];
}

- (BOOL)shouldRemovePresentersView {
    // presentation结束后，移除presentingView
    return YES;
}

@end
