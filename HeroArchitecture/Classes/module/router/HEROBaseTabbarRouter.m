//
//  HEROBaseTabbarRouter.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 24/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseTabbarRouter.h"
#import "HERORouterReference.h"
#import "HEROBaseCoordinator.h"
#import "HEROBaseWorkflow.h"
#import "HERONavigationController.h"
#import "HEROBaseTabBarController.h"

@interface HEROBaseTabbarRouter ()
@property (nonatomic, strong) NSArray <HEROBaseCoordinator*>* coordinators;
@property (nonatomic, weak) HEROBaseRouter* selectedRouter;

@end

@implementation HEROBaseTabbarRouter
@synthesize viewLayer = _viewLayer;


- (instancetype)initWithCoordinator:(HEROBaseCoordinator*)coordinator workflowControl:(id)workflowControl coordinators:(NSArray <HEROBaseCoordinator*>*)coordinators transition:(HEROBaseTransition*)transition selectedRouter:(HEROBaseRouter *)selectedRouter{
	self = [super initWithCoordinator:coordinator workflow:workflowControl];
	if (!self){
		return nil;
	}
	_selectedRouter = selectedRouter;
	_coordinators = coordinators;
	return self;
}

//NEVER CALL
- (Class)viewControllerClass{
	NSAssert(NO, @"NEVER CALL");
	return nil;
}


- (UIViewController *)viewLayer{
	if (!_viewLayer){
		HEROBaseTabBarController* tabBarController = [HEROBaseTabBarController new];
        NSMutableArray* viewControllers = [self tabbarViewControllers];
		tabBarController.viewControllers = viewControllers;
        tabBarController.coordinator = self.coordinator;
		_viewLayer = tabBarController;
		return tabBarController;
	}
	else{
		return _viewLayer;
	}
}

-(NSArray<UIViewController*>*)tabbarViewControllers{
    NSMutableArray* viewControllers = [@[] mutableCopy];
    for (HEROBaseCoordinator* coordinator in self.coordinators){
        if (coordinator.router.hasNavigationInTabBar) {
            [viewControllers addObject:[coordinator.router viewLayer]];
        }
        else{
            [viewControllers addObject:[[HERONavigationController alloc] initWithRootViewController:[coordinator.router viewLayer]]];
        }
    }
    return viewControllers;
}


#pragma mark - Public
- (BOOL)isInitialized{
    return [self.coordinators count] > 0;
}

- (UITabBarController*)tabBarController{
	return (UITabBarController*)self.viewLayer;
}

- (void)updateWithCoordinators:(NSArray <HEROBaseCoordinator*>*)coordinators{
    self.coordinators = coordinators;
    if (_viewLayer) {
        NSMutableArray* viewControllers = [self tabbarViewControllers];
        [self tabBarController].viewControllers = viewControllers;
    }
}


@end

