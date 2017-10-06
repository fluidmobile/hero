//
//  DEMOLoginTransition.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 20/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOLoginTransition.h"
#import "DEMOAppColor.h"

#define ANIMATION_DURATION 1.0

@implementation DEMOLoginTransition

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
	DEMOLoginTransition* transition = [DEMOLoginTransition new];
	return transition;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
	DEMOLoginTransition* transition = [DEMOLoginTransition new];
	return transition;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
	UIView* containerView = transitionContext.containerView;
	containerView.backgroundColor = [[DEMOAppColor currentTheme] labelBackground];
	
	UIView* fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
	
	
	UIView* toView = [transitionContext viewForKey:UITransitionContextToViewKey];
	toView.frame = fromView.frame;
	
	[containerView addSubview:toView];
	[toView setNeedsLayout];
	
	toView.alpha = 0;
	
	[UIView animateWithDuration:ANIMATION_DURATION*0.7f animations:^{
		fromView.alpha = 0;
	} completion:^(BOOL completed){
		[fromView removeFromSuperview];
		[UIView animateWithDuration:ANIMATION_DURATION*0.3f animations:^{
			toView.alpha = 1;
		} completion:^(BOOL completed3){
			[fromView removeFromSuperview];
			containerView.backgroundColor = [UIColor clearColor];
			[transitionContext completeTransition:YES];
		}];
	}];
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
	return ANIMATION_DURATION;
}

@end
