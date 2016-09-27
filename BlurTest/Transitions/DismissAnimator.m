//
//  DismissAnimator.m
//  BlurTest
//
//  Created by Alex on 27/09/16.
//  Copyright © 2016 Pixzelle Studio. All rights reserved.
//

#import "DismissAnimator.h"
#import "BlurViewController.h"

@implementation DismissAnimator

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *container = [transitionContext containerView];
    
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    [container addSubview:toView];
    
    [UIView animateWithDuration:0.3 animations:^{
        ((BlurViewController *)fromController).blurView.effect = nil;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
}

@end
