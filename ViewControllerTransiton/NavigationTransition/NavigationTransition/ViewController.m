//
//  ViewController.m
//  NavigationTransition
//
//  Created by mac on 2018/8/16.
//  Copyright © 2018年 jiji. All rights reserved.
//

#import "ViewController.h"
#import "NavigationTransitionManager.h"

@interface ViewController ()

@property (strong, nonatomic) NavigationTransitionManager *manager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.manager = [[NavigationTransitionManager alloc] init];
//    self.navigationController.delegate = self.manager;

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    self.navigationController.delegate = self.manager;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
