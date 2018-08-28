//
//  SubTabBarController.m
//  TabTransition
//
//  Created by mac on 2018/8/17.
//  Copyright © 2018年 jiji. All rights reserved.
//

#import "SubTabBarController.h"
#import "TabBarManager.h"

@interface SubTabBarController ()

@property (strong, nonatomic) TabBarManager *tabBarControllerManager;

/** 触发交互转场的手势 */
@property (strong, nonatomic) UIPanGestureRecognizer *gesture;

@end

@implementation SubTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gestureAction:)];
    [self.view addGestureRecognizer:self.gesture];
    
    self.tabBarControllerManager = [[TabBarManager alloc] init];
    self.delegate = self.tabBarControllerManager;
}

- (void)dealloc {
    [self.view removeGestureRecognizer:self.gesture];
}

- (void)gestureAction:(UIPanGestureRecognizer *)gesture {
    CGFloat translation = [gesture translationInView:self.view].x;
    // 水平位移
    CGFloat translationAbs = fabs(translation);
    CGFloat translationBase = CGRectGetWidth(self.view.bounds);
    // 进度
    CGFloat progress = translationAbs / translationBase;
    
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan: {
            // 交互转场开始
            self.tabBarControllerManager.isInteractive = YES;
            // 根据速度正负值判定切换的index
            CGFloat speedX = [gesture velocityInView:self.view].x;
            if (speedX > 0) {
                // 往前切换
                if (self.selectedIndex > 0) {
                    self.selectedIndex -= 1;
                }
            } else {
                // 往后切换
                if (self.selectedIndex < self.viewControllers.count - 1) {
                    self.selectedIndex += 1;
                }
            }
        }
            break;
        case UIGestureRecognizerStateChanged: {
            // 更新交互进度
            [self.tabBarControllerManager.interactiveTransition updateInteractiveTransition:progress];
        }
            break;
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded: {
            if (progress > 0.3) {
                [self.tabBarControllerManager.interactiveTransition finishInteractiveTransition];
            } else {
                [self.tabBarControllerManager.interactiveTransition cancelInteractiveTransition];
            }
            // 交互转场结束
            self.tabBarControllerManager.isInteractive = NO;
        }
            break;
        default:
            self.tabBarControllerManager.isInteractive = NO;
            break;
    }
    
}
@end
