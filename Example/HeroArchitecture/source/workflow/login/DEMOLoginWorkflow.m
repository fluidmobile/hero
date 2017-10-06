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

@implementation DEMOLoginWorkflow


- (HEROBaseCoordinator*)initialCoordinator{
	return [self routerLoggedOut];
}

-(void)loggedInOnRouter:(HEROBaseRouter *)router{
	[(id<DEMOLoginParentWorkflowInput>)self.parentWorkflow loggedInOnRouter:router] ;
}

-(HEROBaseCoordinator *)routerLoggedOut{
	return [self dequeueCoordinatorForRouter:[DEMOLoginRouter class] coordinator:[DEMOLoginCoordinator class] usecase:[DEMOLoginUsecase class]];
}


@end
