//
//  AnimationPresentationController.m
//  ModalTransition2
//
//  Created by mac on 2018/8/21.
//  Copyright © 2018年 jiji. All rights reserved.
//

#import "AnimationPresentationController.h"

@interface AnimationPresentationController ()

@property (strong, nonatomic) UIView *backgroundView;

@end

@implementation AnimationPresentationController

- (void)presentationTransitionWillBegin {
    // 注意：初始化并配置自定义视图需要在这里
    self.backgroundView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.containerView addSubview:self.backgroundView];
    
    self.backgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    self.backgroundView.alpha = 0;
    
    self.backgroundView.center = self.containerView.center;
    self.backgroundView.bounds = self.containerView.bounds;
    // 通过presentedVC的transitionCoordinator对象，调用同时播放的转场动画
    [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.backgroundView.alpha = 1;
    } completion:nil];
}

- (void)dismissalTransitionWillBegin {
    [self.presentedViewController.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.backgroundView.alpha = 0;
    } completion:nil];
}

@end
