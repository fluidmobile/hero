//
//  HEROBaseRouter.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 16/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HEROBaseRouter.h"
#import "HEROBaseCoordinator.h"
#import "HEROBaseTransition.h"
#import "HEROBaseWorkflow.h"
#import "HEROBaseViewController.h"

@interface HEROBaseRouter()
@property (nonatomic, strong) HEROBaseTransition* transition;
@end

@implementation HEROBaseRouter


- (instancetype)initWithCoordinator:(HEROBaseCoordinator*)coordinator workflow:(HEROBaseWorkflow*)workflow{
	self = [super init];
	if (!self) {
		return nil;
	}
	_coordinator = coordinator;
	self.coordinator.router = self;
	_workflow = workflow;
	
	return self;
}

- (void)exposeRouter{
	[HEROBaseRouter dismissAndPopParentsFromViewController:self.viewLayer];
}

+(void)dismissAndPopParentsFromViewController:(UIViewController*)viewController{
	if (viewController.presentedViewController){
		[HEROBaseRouter dismissAndPopParentsFromViewController:viewController.presentedViewController];
		[viewController.presentedViewController dismissViewControllerAnimated:YES completion:^{
			
		}];
	}
	else if (viewController.navigationController.viewControllers){
		[viewController.navigationController popToViewController:viewController animated:YES];
		 }
}


- (void)pushOnRouter:(HEROBaseRouter*)router{
	if ([router viewLayer].navigationController) { // use navigationController
		[[router viewLayer].navigationController pushViewController:[self viewLayer] animated:YES];
	}else { // FALLBACK
		[self presentOnRouter:router inNavigationController:NO setAsRootView:NO transition:nil];
	}
}

- (void)presentOnWindow:(UIWindow*)window withNavigation:(BOOL)hasNavigation{
	UIViewController* viewController = [self viewLayer];
	if (hasNavigation){
		viewController = [[UINavigationController alloc] initWithRootViewController:viewController];
	}
	window.rootViewController = viewController;

}

- (void)presentOnRouter:(HEROBaseRouter*)router inNavigationController:(BOOL)inNavigationController setAsRootView:(BOOL)setAsRootView transition:(HEROBaseTransition*)transition{
	UIViewController* viewControllerNew;
	UIViewController* viewController = [router viewLayer];
	if (inNavigationController) {
		viewControllerNew = [[UINavigationController alloc] initWithRootViewController:[self viewLayer]];
	}
	else{
		viewControllerNew = [self viewLayer];
	}
	
	if (transition) {
		self.transition = transition;
		viewControllerNew.transitioningDelegate = self.transition;
	}
	
	[viewController presentViewController:viewControllerNew animated:YES completion:^{
		if (setAsRootView) {
			UIWindow* window = [[UIApplication sharedApplication] keyWindow];
			[window.rootViewController dismissViewControllerAnimated:NO completion:^{
				NSLog(@"OldRootViewController: %@",[window.rootViewController class]);
				[window setRootViewController:viewControllerNew];
				NSLog(@"NewRootViewController: %@",[window.rootViewController class]);
			}];
			
		}
	}];	
}

- (UIViewController *)viewLayer{
	UIViewController* viewLayer;
	if (_viewLayer){
		return _viewLayer;
		
	}
	else{
		viewLayer = [[self viewControllerClass] new];
		_viewLayer = viewLayer;
		((HEROBaseViewController*)_viewLayer).coordinator = self.coordinator;
		self.coordinator.viewLayer = (HEROBaseViewController*)viewLayer;
	}
	return viewLayer;
}

//stub to remove warning
- (Class)viewControllerClass{
	NSAssert(NO, @"OVERRIDE: viewControllerClass in %@",[[self class] description]);
	return nil;
}

-(NSString *)description{
	return [NSString stringWithFormat:@"%@ workflowControl: %@ coordinator: %@ viewLayer: %@ hasNavigationbar: %@ navigationController: %@",[self class],[self.workflow class], [self.coordinator class], [self.viewLayer class], self.hasNavigationInTabBar?@"NO":@"YES" ,self.viewLayer.navigationController];
}

- (void)dealloc{
#ifdef DEBUG
	NSLog(@"DEALLOC on %@",[[self class] description]);
#endif
}
@end

