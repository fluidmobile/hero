//
//  DEMOLoginWorkflow.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 18/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOLoginWorkflow.h"
#import "DEMOLoginContracts.h"

#import "DEMOLoginTransition.h"

#import "DEMOMainCoordinator.h"
#import "DEMOMainUsecase.h"
#import "DEMOMainRouter.h"

#import "DEMOLoginCoordinator.h"
#import "DEMOLoginRouter.h"
#import "DEMOLoginUsecase.h"

#import "HEROAppWorkflow.h"
@interface DEMOLoginWorkflow () <DEMOLoginWorkflowInput>
@end

NSString *const DEMOLoginModuleIdentifier = @"DEMOLoginModuleIdentifier";

@implementation DEMOLoginWorkflow

- (HEROBaseCoordinator*)initialCoordinator {
	return [self coordinatorLogin];
}

- (void)loggedInOnRouter:(HEROBaseRouter *)router {
	[(id<DEMOLoginWorkflowParentInput>)self.parentWorkflow loggedInOnRouter:router] ;
}

- (HEROBaseCoordinator *)coordinatorLogin {
	return [self dequeueCoordinatorForRouter:[DEMOLoginRouter class] coordinator:[DEMOLoginCoordinator class] usecase:[DEMOLoginUsecase class] workflowKey:DEMOLoginModuleIdentifier];
}


@end
