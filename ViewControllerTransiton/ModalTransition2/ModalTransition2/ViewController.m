//
//  ViewController.m
//  ModalTransition2
//
//  Created by mac on 2018/8/21.
//  Copyright © 2018年 jiji. All rights reserved.
//

#import "ViewController.h"
#import "ModalTranstionDelegate.h"

@interface ViewController ()

@property (strong, nonatomic) ModalTranstionDelegate *transitionDelegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.transitionDelegate = [[ModalTranstionDelegate alloc] init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // 配置modal样式及代理
    UIViewController *destinationViewController = [segue destinationViewController];
    destinationViewController.modalPresentationStyle = UIModalPresentationCustom; // 自定义样式
    destinationViewController.transitioningDelegate = self.transitionDelegate;
}


@end
