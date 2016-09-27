//
//  PresentationAnimator.m
//  BlurTest
//
//  Created by Alex on 27/09/16.
//  Copyright © 2016 Pixzelle Studio. All rights reserved.
//

#import "PresentationAnimator.h"
#import "BlurViewController.h"

@implementation PresentationAnimator

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *toController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    UIView *container = [transitionContext containerView];
    
    [container addSubview:toController.view];
    
    ((BlurViewController *)toController).blurView.effect = nil;
    
    [UIView animateWithDuration:0.3 animations:^{
        ((BlurViewController *)toController).blurView.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
}

@end
