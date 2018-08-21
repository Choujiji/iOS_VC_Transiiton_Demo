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

@property (strong, nonatomic) NavigationTransitionManager *manager;

@end

@implementation PushedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.manager = [[NavigationTransitionManager alloc] init];
    self.navigationController.delegate = self.manager;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)pop:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
