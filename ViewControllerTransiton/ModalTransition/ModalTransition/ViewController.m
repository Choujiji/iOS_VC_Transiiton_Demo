//
//  ViewController.m
//  ModalTransition
//
//  Created by mac on 2018/8/17.
//  Copyright © 2018年 jiji. All rights reserved.
//

#import "ViewController.h"
#import "PresentedViewController.h"
#import "TransitionManager.h"

@interface ViewController ()

@property (strong, nonatomic) TransitionManager *transitionManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.transitionManager = [[TransitionManager alloc] init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // sb切换时，只能在这里给toView设置转场类型
    PresentedViewController *presentedVC =  (PresentedViewController *)segue.destinationViewController;
//    presentedVC.modalPresentationStyle = UIModalPresentationCustom;
    presentedVC.transitioningDelegate = self.transitionManager;
}


@end
