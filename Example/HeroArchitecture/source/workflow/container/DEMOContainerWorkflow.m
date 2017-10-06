//
//  DEMOContainerWorkflow.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOContainerWorkflow.h"

#import "DEMOContainerRouter.h"
#import "DEMOContainerUsecase.h"
#import "DEMOContainerCoordinator.h"
#import "DEMOContainerContracts.h"

#import "DEMONotesRouter.h"
#import "DEMONotesUsecase.h"
#import "DEMONotesCoordinator.h"
#import "DEMONotesContracts.h"

@interface DEMOContainerWorkflow () <DEMOContainerRouterWorkflowControl, DEMONotesRouterWorkflowControl>
@end

@implementation DEMOContainerWorkflow

- (HEROBaseCoordinator*)createInitialCoordinator{
	
	NSAssert(NO,@"EMPTY ROUTER");
	return nil;
}

#pragma mark - router creation

//- (HEROBaseRouter*)editRouter{
//	HEROBaseRouter* router = [self existingRouterForClass:[<#class#>Router class]];
//	if (!router) {
//		router = [self routerForRouter:[<#class#>Router class] coordinator:[<#class#>Coordinator class] usecase:[<#class#>Usecase class]];
//	}
//	return router;
//}

- (HEROBaseCoordinator*)notesCoordinator{
	HEROBaseRouter* router = [self existingRouterForClass:[DEMONotesRouter class]];
	if (!router) {
		HEROBaseCoordinator* coordinator =  [self coordinatorForRouter:[DEMONotesRouter class] coordinator:[DEMONotesCoordinator class] usecase:[DEMONotesUsecase class]];
		return coordinator;
	}
	return router.coordinator;
}

- (HEROBaseCoordinator*)containerCoordinator{
	HEROBaseRouter* router = [self existingRouterForClass:[DEMOContainerRouter class]];
	if (!router) {
		
		HEROBaseCoordinator* coordinator =  [self coordinatorForRouter:[DEMOContainerRouter class] coordinator:[DEMOContainerCoordinator class] usecase:[DEMOContainerUsecase class]];
		return coordinator;
	}
	return router.coordinator;
}

#pragma mark - DEMOContainerRouterWorkflowControl

#pragma mark - DEMONotesRouterWorkflowControl


@end
