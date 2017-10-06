//
//  DEMOTabbarTransition.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 20/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOTabbarTransition.h"
#import "DEMOAppColor.h"
#import "HEROViewFactory.h"

#define ANIMATION_DURATION 5.0

@implementation DEMOTabbarTransition

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
	DEMOTabbarTransition* transition = [DEMOTabbarTransition new];
	return transition;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
	DEMOTabbarTransition* transition = [DEMOTabbarTransition new];
	return transition;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
	UIView* containerView = transitionContext.containerView;
	containerView.backgroundColor = [[DEMOAppColor currentTheme] random];
	UILabel* labelTransitionExplanation = [HEROViewFactory labelWithText:@"TRANSITION\nfrom\nLogin\nto\nTabbar"];
	labelTransitionExplanation.textAlignment = NSTextAlignmentCenter;
	[containerView addSubview:labelTransitionExplanation];
	labelTransitionExplanation.frame = containerView.frame;
	
	UIView* fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
	
	
	UIView* toView = [transitionContext viewForKey:UITransitionContextToViewKey];
	toView.frame = fromView.frame;
	
	[containerView addSubview:toView];
	[toView setNeedsLayout];
	
	toView.alpha = 0;
	
	[UIView animateWithDuration:ANIMATION_DURATION*0.25f animations:^{
		fromView.alpha = 0;
	} completion:^(BOOL completed1){
		[fromView removeFromSuperview];
		[UIView animateWithDuration:ANIMATION_DURATION*0.5f animations:^{
			labelTransitionExplanation.center = containerView.center;
		} completion:^(BOOL completed2){
			[UIView animateWithDuration:ANIMATION_DURATION*0.25f animations:^{
				toView.alpha = 1;
			} completion:^(BOOL completed3){
				[fromView removeFromSuperview];
				containerView.backgroundColor = [UIColor clearColor];
				[transitionContext completeTransition:YES];
			}];
			
		}];
	}];
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
	return ANIMATION_DURATION;
}
@end
