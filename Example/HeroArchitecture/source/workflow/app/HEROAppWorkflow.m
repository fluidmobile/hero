//
//  FMAppWorkflow.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 17/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//
#import "HEROAppWorkflow.h"
#import "DEMOTabbarWorkflow.h"
#import "DEMOLoginWorkflow.h"
#import "DEMOLoginWorkflowContract.h"
#import "DEMOCommonLoginService.h"
#import "DEMOTabbarWorkflowContract.h"
#import "DEMOLoginTransition.h"
#import "DEMOTabbarTransition.h"

@interface HEROAppWorkflow ()<DEMOLoginParentWorkflowInput, DEMOTabbarParentWorkflowInput>
    @property (nonatomic, strong) HEROBaseWorkflow* workflow;
@end

@implementation HEROAppWorkflow

- (HEROBaseCoordinator*)createInitialCoordinator{
    return [[self initialWorkflow] initialCoordinator];
}

-(HEROBaseWorkflow*)loggedInWorkflow{
	HEROBaseWorkflow* workflow = [self workflowForWorkflow:[DEMOTabbarWorkflow class]];
	return workflow;
}

-(HEROBaseWorkflow *)loggedOutWorkflow{
	HEROBaseWorkflow* workflow = [self workflowForWorkflow:[DEMOLoginWorkflow class]];
	return workflow;
}

#pragma mark private methods
-(HEROBaseWorkflow*)initialWorkflow{
	HEROBaseWorkflow* workflow;
	if ([[DEMOCommonLoginService sharedInstance] isloggedIn]){
		workflow = [self loggedInWorkflow];
	}
	else{
		workflow = [self loggedOutWorkflow];
	}
	
	
	return workflow;
}

-(void)setAsRootviewOnWindow:(UIWindow *)window{
	self.workflow = [self initialWorkflow];
	self.workflow.parentWorkflow = self;
	
	HEROBaseCoordinator* coordinator = [self.workflow initialCoordinator];
	BOOL showNavBar = !coordinator.router.hasNavigationInTabBar;
	[self addRouter:coordinator.router];
	[coordinator.router presentOnWindow:window withNavigation:showNavBar];
}

#pragma mark - DEMOLoginWorkflowOutput
-(void)loggedInOnRouter:(HEROBaseRouter *)router{
	self.workflow = [self loggedInWorkflow];
	HEROBaseCoordinator* coordinator = [self.workflow initialCoordinator];
	HEROBaseTransition* transition = [DEMOTabbarTransition new];
	[coordinator.router presentOnRouter:router inNavigationController:NO setAsRootView:YES transition:transition];
}

#pragma mark - DEMOTabbarWorkflowOutput

-(void)tabbarLoggedOutOnRouter:(HEROBaseRouter *)router{
	self.workflow =  [self loggedOutWorkflow];
	HEROBaseCoordinator* coordinator = [self.workflow initialCoordinator];
	HEROBaseTransition* transition = [DEMOLoginTransition new];
	[coordinator.router presentOnRouter:router inNavigationController:YES setAsRootView:YES transition:transition];
}

-(void)tabbarLoggedInOnRouter:(HEROBaseRouter *)router{
	
}

@end
