//
//  Animator.h
//  NavigationTransition
//
//  Created by mac on 2018/8/16.
//  Copyright © 2018年 jiji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, JJAnimatorTransitionType) {
    NavigationControllerType,
    TabControllerType,
    ModalType
};

typedef NS_ENUM(NSUInteger, JJAnimatorTransitionNavigationControllerSubType) {
    None = UINavigationControllerOperationNone,
    Push = UINavigationControllerOperationPush,
    Pop = UINavigationControllerOperationPop,
};

typedef NS_ENUM(NSUInteger, JJAnimatorTransitionTabControllerSubType) {
    left,
    right
};

typedef NS_ENUM(NSUInteger, JJAnimatorTransitionModalSubType) {
    presention,
    dismissal
};

@interface Animator : NSObject <UIViewControllerAnimatedTransitioning>

- (instancetype)initWithTransitionType:(JJAnimatorTransitionType)transitionType subType:(NSUInteger)subType;

@end
