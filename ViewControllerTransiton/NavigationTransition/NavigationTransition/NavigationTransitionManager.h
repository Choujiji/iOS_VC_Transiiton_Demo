//
//  NavigationTransitionManager.h
//  NavigationTransition
//
//  Created by mac on 2018/8/16.
//  Copyright © 2018年 jiji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NavigationTransitionManager : NSObject <UINavigationControllerDelegate>

/** 标识是否为交互过程 */
@property (assign, nonatomic) BOOL isInteractive;

/** 转场交互对象 */
@property (strong, nonatomic) UIPercentDrivenInteractiveTransition *interactiveTransition;

@end
