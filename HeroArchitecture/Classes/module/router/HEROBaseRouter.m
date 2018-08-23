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
#import "HERONavigationController.h"
#import "HEROViewControllerProtocol.h"

@interface HEROBaseRouter()
@property (nonatomic, strong) HEROBaseTransition* transition;
@end

@implementation HEROBaseRouter


- (instancetype)initWithCoordinator:(HEROBaseCoordinator*)coordinator workflow:(HEROBaseWorkflow*)workflow workflowKey:(NSString*)workflowKey{
	self = [super init];
	if (!self) {
		return nil;
	}
    _workflowKey = workflowKey;
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
        NSAssert(router, @"no router");
		[self presentOnRouter:router inNavigationController:NO setAsRootView:NO transition:nil];
	}
}

- (void)presentOnWindow:(UIWindow*)window withNavigation:(BOOL)hasNavigation{
	UIViewController* viewController = [self viewLayer];
	if (hasNavigation){
		viewController = [[HERONavigationController alloc] initWithRootViewController:viewController];
	}
	window.rootViewController = viewController;

}

- (void)presentOnRouter:(HEROBaseRouter*)router inNavigationController:(BOOL)inNavigationController setAsRootView:(BOOL)setAsRootView transition:(HEROBaseTransition*)transition{
	UIViewController* viewControllerNew;
	UIViewController* viewController = [router viewLayer];
	if (inNavigationController) {
		viewControllerNew = [[HERONavigationController alloc] initWithRootViewController:[self viewLayer]];
	}
	else{
		viewControllerNew = [self viewLayer];
	}
	if (transition) {
		self.transition = transition;
		viewControllerNew.transitioningDelegate = self.transition;
	}
    if (setAsRootView) {
        UIWindow* window = [[UIApplication sharedApplication] keyWindow];
        [window setRootViewController:viewControllerNew];
    }else {
        [viewController presentViewController:viewControllerNew animated:YES completion:^{
            
        }];
    }
}

- (UIViewController *)viewLayer{
	UIViewController* viewLayer;
	if (_viewLayer){
		return _viewLayer;
	}
	else{
		viewLayer = [[self viewControllerClass] new];
		_viewLayer = viewLayer;
		((id<HEROViewControllerProtocol>)_viewLayer).coordinator = self.coordinator;
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

