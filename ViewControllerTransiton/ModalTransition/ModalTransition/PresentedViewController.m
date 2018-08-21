//
//  PresentedViewController.m
//  ModalTransition
//
//  Created by mac on 2018/8/17.
//  Copyright © 2018年 jiji. All rights reserved.
//

#import "PresentedViewController.h"
//#import "TransitionManager.h"

@interface PresentedViewController ()
@property (weak, nonatomic) IBOutlet UIButton *closeButton;

//@property (strong, nonatomic) TransitionManager *transitionManager;
@end

@implementation PresentedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.transitionManager = [[TransitionManager alloc] init];
//    self.transitioningDelegate = self.transitionManager;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)closeView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
