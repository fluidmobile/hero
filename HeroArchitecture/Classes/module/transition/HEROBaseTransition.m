//
//  HEROBaseTransition.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 23/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseTransition.h"

@implementation HEROBaseTransition
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
	NSAssert(NO, @"OVERRIDE: transitionDuration: in %@",[[self class] description]);
	return 0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
	NSAssert(NO, @"OVERRIDE: animateTransition: in %@",[[self class] description]);
}

@end
