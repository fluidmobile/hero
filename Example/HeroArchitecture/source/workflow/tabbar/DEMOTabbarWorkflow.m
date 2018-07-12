//
//  DEMOTabbarWorkflow.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 19/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOTabbarWorkflow.h"
#import "DEMOTabbarWorkflowContract.h"
#import "DEMOTabbarRouter.h"
#import "DEMOTabbarTransition.h"

#import "DEMOMainWorkflow.h"
#import "DEMOMainWorkflowContract.h"

#import "DEMOLoginWorkflow.h"
#import "DEMOLoginWorkflowContract.h"

#import "DEMONotesWorkflow.h"
#import "DEMONotesWorkflowContract.h"

#import "DEMOContainerWorkflow.h"
#import "DEMOContainerWorkflowContract.h"

@interface DEMOTabbarWorkflow () <DEMOLoginWorkflowParentInput, DEMOMainWorkflowParentInput, DEMOMainWorkflowOutput, DEMONotesWorkflowParentInput>
@property (nonatomic, strong) DEMOMainWorkflow* workflowMain;
@property (nonatomic, strong) DEMONotesWorkflow* workflowNotes;
@property (nonatomic, strong) DEMOContainerWorkflow* workflowEditing;

@end

@implementation DEMOTabbarWorkflow 

-(HEROBaseCoordinator *)initialCoordinator{
	return [self tabbarCoordinator];
}

-(HEROBaseCoordinator *)tabbarCoordinator{
    HEROBaseCoordinator* coordinator = [self dequeueCoordinatorForRouter:[HEROBaseTabbarRouter class] coordinator:nil usecase:nil];
    HEROBaseTabbarRouter* tabbarRouter = ((HEROBaseTabbarRouter*)coordinator.router);
    if ([tabbarRouter isInitialized]) {
        return coordinator;
    }
	NSArray* coordinators = @[[self.workflowMain initialCoordinator],  [self.workflowNotes initialCoordinator], [self.workflowEditing initialCoordinator]];
    if (!tabbarRouter) {
        coordinator = [[HEROBaseCoordinator alloc] initWithUsecase:nil];
        tabbarRouter = [[DEMOTabbarRouter alloc] initWithCoordinator:coordinator workflowControl:self coordinators:coordinators transition:[DEMOTabbarTransition new] selectedRouter:nil];
        coordinator.router = tabbarRouter;
    }
    else{
        [tabbarRouter updateWithCoordinators:coordinators];
    }
	return coordinator;
}

-(DEMOMainWorkflow*)workflowMain{
	if (!_workflowMain){
		self.workflowMain = [DEMOMainWorkflow new];
		self.workflowMain.parentWorkflow = self;
	}
	return _workflowMain;
}

-(DEMONotesWorkflow*)workflowNotes{
	if (!_workflowNotes){
		self.workflowNotes = [DEMONotesWorkflow new];
		self.workflowNotes.parentWorkflow = self;
	}
	return _workflowNotes;
}

-(DEMOContainerWorkflow *)workflowEditing{
	if (!_workflowEditing){
		self.workflowEditing = [DEMOContainerWorkflow new];
		self.workflowEditing.parentWorkflow = self;
	}
	return _workflowEditing;
}

#pragma mark - DEMOLoginWorkflowParentInput
-(void)loggedInOnRouter:(HEROBaseRouter*)router{
	[(id<DEMOTabbarParentWorkflowInput>)self.parentWorkflow tabbarLoggedInOnRouter:router];
}

#pragma mark - DEMOLoginWorkflowParentInput
- (void)loggedOutOnRouter:(HEROBaseRouter *)router{
	[(id<DEMOTabbarParentWorkflowInput>)self.parentWorkflow tabbarLoggedOutOnRouter:router];
}

#pragma mark - DEMOMainWorkflowOutput
- (void)selectButtonCallWorkflowOnRouter:(HEROBaseRouter *)router{
    HEROBaseCoordinator* coordinator = [self tabbarCoordinator];
    HEROBaseTabbarRouter* tabbarRouter = (HEROBaseTabbarRouter*)coordinator.router;
    [[tabbarRouter tabBarController] setSelectedIndex:1];
}

@end
