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

@end

@implementation SubTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBarControllerManager = [[TabBarManager alloc] init];
    self.delegate = self.tabBarControllerManager;
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

@end
