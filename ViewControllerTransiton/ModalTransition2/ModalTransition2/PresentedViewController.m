//
//  PresentedViewController.m
//  ModalTransition2
//
//  Created by mac on 2018/8/21.
//  Copyright © 2018年 jiji. All rights reserved.
//

#import "PresentedViewController.h"

@interface PresentedViewController ()
@property (weak, nonatomic) IBOutlet UIButton *closeButton;

@end

@implementation PresentedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.closeButton.alpha = 0;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:0.4 animations:^{
        self.closeButton.alpha = 1;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)closeView:(id)sender {
    CGAffineTransform applyTransform = CGAffineTransformMakeRotation(3.0 / 2.0 * M_PI);
    applyTransform = CGAffineTransformScale(applyTransform, 0.1, 0.1);
    [UIView animateWithDuration:0.4 animations:^{
        self.closeButton.layer.affineTransform = applyTransform;
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}

@end
