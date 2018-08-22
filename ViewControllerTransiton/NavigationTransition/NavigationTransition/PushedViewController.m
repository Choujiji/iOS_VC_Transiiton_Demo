//
//  PushedViewController.m
//  NavigationTransition
//
//  Created by mac on 2018/8/16.
//  Copyright © 2018年 jiji. All rights reserved.
//

#import "PushedViewController.h"
#import "NavigationTransitionManager.h"

@interface PushedViewController ()

/** 边缘拖拽手势（用于触发交互式动画使用） */
@property (strong, nonatomic) UIScreenEdgePanGestureRecognizer *gesture;

@property (strong, nonatomic) NavigationTransitionManager *manager;
@end

@implementation PushedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(gestureAction:)];
    self.gesture.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:self.gesture];
}

- (void)gestureAction:(UIScreenEdgePanGestureRecognizer *)gesture {
    // 由于手势触发在屏幕左边缘，所以只看水平位移
    CGFloat translation = [gesture translationInView:self.view].x;
    CGFloat translationAbs = fabs(translation); // 绝对值
    CGFloat finishFlagWidth = 1.0 / 3.0 * CGRectGetWidth(self.view.bounds);
    // 百分比
    CGFloat percent = (translationAbs > finishFlagWidth) ? 1.0 : (translationAbs / finishFlagWidth);
    
    NSLog(@"percent - %f", percent);
    
    
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan: {
            // 转换delegate
            NavigationTransitionManager *delegate =  (NavigationTransitionManager *)self.navigationController.delegate;
            // 记录下来（原因是，当转场的过程中，self.navigationController会为nil，delegate也就获取不到）
            self.manager = delegate;
            // 标识交互转场开始
            self.manager.isInteractive = YES;
            // 触发代理方法（调用这个，执行的过程中，self.navigationController是nil）
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;
        case UIGestureRecognizerStateChanged:
            // 更新交互状态百分比
            [self.manager.interactiveTransition updateInteractiveTransition:percent];
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled: {
            // 根据比例，决定转场是否完成
            if (percent > 0.5) {
                [self.manager.interactiveTransition finishInteractiveTransition];
            } else {
                [self.manager.interactiveTransition cancelInteractiveTransition];
            }
            // 标识交互转场结束
            self.manager.isInteractive = NO;
        }
            break;
        default:
            self.manager.isInteractive = NO;
            break;
    }
}

- (IBAction)pop:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc {
    [self.view removeGestureRecognizer:self.gesture];
}

@end
