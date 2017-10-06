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

#import "DEMONoteEditingRouter.h"
#import "DEMONoteEditingUsecase.h"
#import "DEMONoteEditingCoordinator.h"
#import "DEMONoteEditingContracts.h"

@interface DEMOContainerWorkflow () <DEMOContainerWorkflowInput, DEMONotesWorkflowInput>
@end

@implementation DEMOContainerWorkflow

- (HEROBaseCoordinator*)createInitialCoordinator{
	DEMOContainerCoordinator* containerCoordinator = [self containerCoordinator];
	DEMOContainerRouter* router = (DEMOContainerRouter*)containerCoordinator.router;
	[router updateMasterRouter:[self editCoordinator].router];
	[router updateDetailRouter:[self notesCoordinator].router];
	return containerCoordinator;
}

#pragma mark - router creation

- (DEMONoteEditingCoordinator*)editCoordinator{
	return (DEMONoteEditingCoordinator*)[self dequeueCoordinatorForRouter:[DEMONoteEditingRouter class] coordinator:[DEMONoteEditingCoordinator class] usecase:[DEMONoteEditingUsecase class]];
}

- (DEMONotesCoordinator*)notesCoordinator{
	return (DEMONotesCoordinator*)[self dequeueCoordinatorForRouter:[DEMONotesRouter class] coordinator:[DEMONotesCoordinator class] usecase:[DEMONotesUsecase class]];
}

- (DEMOContainerCoordinator*)containerCoordinator{
	return (DEMOContainerCoordinator*)[self dequeueCoordinatorForRouter:[DEMOContainerRouter class] coordinator:[DEMOContainerCoordinator class] usecase:[DEMOContainerUsecase class]];
}


#pragma mark - DEMOContainerWorkflowInput

#pragma mark - DEMONotesWorkflowInput


@end
