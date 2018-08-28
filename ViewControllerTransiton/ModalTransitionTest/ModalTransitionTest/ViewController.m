//
//  ViewController.m
//  ModalTransitionTest
//
//  Created by mac on 2018/8/28.
//  Copyright © 2018年 jiji. All rights reserved.
//

#import "ViewController.h"
#import "ModalTransitionManager.h"

@interface ViewController ()

@property (strong, nonatomic) ModalTransitionManager *transitionManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.transitionManager = [[ModalTransitionManager alloc] init];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *presentedVC =  segue.destinationViewController;
    // 展示类型，设置为自定义
    presentedVC.modalPresentationStyle = UIModalPresentationCustom;
    // 挂转场代理
    presentedVC.transitioningDelegate = self.transitionManager;
}


@end
