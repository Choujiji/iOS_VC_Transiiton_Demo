//
//  PresentedViewController.m
//  ModalTransitionTest
//
//  Created by mac on 2018/8/28.
//  Copyright © 2018年 jiji. All rights reserved.
//

#import "PresentedViewController.h"
#import "ModalTransitionManager.h"

@interface PresentedViewController ()

//@property (strong, nonatomic) ModalTransitionManager *tra

@property (strong, nonatomic) UIScreenEdgePanGestureRecognizer *gesture;

@end

@implementation PresentedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(gestureAction:)];
    [self.gesture setEdges:UIRectEdgeLeft];
    [self.view addGestureRecognizer:self.gesture];
}

- (void)gestureAction:(UIScreenEdgePanGestureRecognizer *)gesture {
    CGFloat translationX = [gesture translationInView:self.view].x;
    translationX = fabs(translationX);
    // 比例
    CGFloat progress = translationX / CGRectGetWidth(self.view.bounds);
    
    ModalTransitionManager *transitionManager = (ModalTransitionManager *)self.transitioningDelegate;
    
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan: {
            // 开始交互
            transitionManager.isInteractive = YES;
            // 触发退出
            [self dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        case UIGestureRecognizerStateChanged: {
            // 更新转场进度
            [transitionManager.interactiveTransition updateInteractiveTransition:progress];
        }
            break;
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded: {
            // 结束交互
            if (progress > 0.4) {
                // 完成
                [transitionManager.interactiveTransition finishInteractiveTransition];
            } else {
                // 取消
                [transitionManager.interactiveTransition cancelInteractiveTransition];
            }
            transitionManager.isInteractive = NO;
        }
            break;
        default:
            transitionManager.isInteractive = NO;
            break;
    }
}


- (IBAction)dismissAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc {
    [self.view removeGestureRecognizer:self.gesture];
}

@end
