//
//  TabBarManager.h
//  TabTransition
//
//  Created by mac on 2018/8/17.
//  Copyright © 2018年 jiji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TabBarManager : NSObject <UITabBarControllerDelegate>

/** 交互状态标识 */
@property (assign, nonatomic) BOOL isInteractive;

/** 交互控制器 */
@property (strong, nonatomic) UIPercentDrivenInteractiveTransition *interactiveTransition;
@end
