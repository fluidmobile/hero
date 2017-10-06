//
//  DEMOTabbarWorkflow.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 19/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOTabbarWorkflow.h"

#import "DEMOTabbarRouter.h"

#import "DEMOMainWorkflow.h"
#import "DEMOLoginWorkflow.h"
#import "DEMONotesWorkflow.h"
#import "DEMOContainerWorkflow.h"

#import "DEMOTabbarWorkflowContract.h"

#import "DEMOTabbarTransition.h"

@interface DEMOTabbarWorkflow () <DEMOLoginParentWorkflowInput, DEMOMainParentWorkflowInput>
@property (nonatomic, strong) HEROBaseWorkflow* workflowMain;
@property (nonatomic, strong) HEROBaseWorkflow* workflowNotes;
@property (nonatomic, strong) HEROBaseWorkflow* workflowEditing;

@end

@implementation DEMOTabbarWorkflow 

-(HEROBaseCoordinator *)initialCoordinator{
	return [self tabbarCoordinator];
}

-(HEROBaseCoordinator *)tabbarCoordinator{
	NSArray* coordinators = @[[self.workflowMain initialCoordinator],  [self.workflowNotes initialCoordinator], [self.workflowEditing initialCoordinator]];
	HEROBaseCoordinator* coordinator = [[HEROBaseCoordinator alloc] initWithUsecase:nil];
	DEMOTabbarRouter* router = [[DEMOTabbarRouter alloc] initWithCoordinator:coordinator workflowControl:self coordinators:coordinators transition:[DEMOTabbarTransition new] selectedRouter:nil];
	coordinator.router = router;
	return coordinator;
}

-(HEROBaseWorkflow*)workflowMain{
	if (!_workflowMain){
		self.workflowMain = [DEMOMainWorkflow new];
		self.workflowMain.parentWorkflow = self;
	}
	return _workflowMain;
}

-(HEROBaseWorkflow*)workflowNotes{
	if (!_workflowNotes){
		self.workflowNotes = [DEMONotesWorkflow new];
		self.workflowNotes.parentWorkflow = self;
	}
	return _workflowNotes;
}

-(HEROBaseWorkflow *)workflowEditing{
	if (!_workflowEditing){
		self.workflowEditing = [DEMOContainerWorkflow new];
		self.workflowEditing.parentWorkflow = self;
	}
	return _workflowEditing;
}

-(void)loggedInOnRouter:(HEROBaseRouter*)router{
	[(id<DEMOTabbarParentWorkflowInput>)self.parentWorkflow tabbarLoggedInOnRouter:router];
}

- (void)loggedOutOnRouter:(HEROBaseRouter *)router{
	[(id<DEMOTabbarParentWorkflowInput>)self.parentWorkflow tabbarLoggedOutOnRouter:router];
}

@end
