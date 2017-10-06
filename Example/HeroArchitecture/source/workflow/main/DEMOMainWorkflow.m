//
//  DEMOMainWorkflow.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 12/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOMainWorkflow.h"
#import "DEMOMainWorkflowContract.h"

#import "DEMOMainCoordinator.h"
#import "DEMOMainUsecase.h"


#import "DEMOMainContracts.h"

//SettingsModule
#import "DEMOSettingsRouter.h"
#import "DEMOSettingsUsecase.h"
#import "DEMOSettingsCoordinator.h"
#import "DEMOSettingsContracts.h"

//NotesModule
#import "DEMONotesRouter.h"
#import "DEMONotesUsecase.h"
#import "DEMONotesCoordinator.h"
#import "DEMONotesContracts.h"

//NotesModule
#import "DEMOPictureRouter.h"
#import "DEMOPictureUsecase.h"
#import "DEMOPictureCoordinator.h"
#import "DEMOPictureContracts.h"


@interface DEMOMainWorkflow() <DEMOMainWorkflowInput, DEMOSettingsWorkflowControl, DEMOPictureWorkflowInput>
@end

@implementation DEMOMainWorkflow
-(HEROBaseCoordinator*)createInitialCoordinator{
	HEROBaseCoordinator* coordinator = [self mainCoordinator];
	[self addRouter:coordinator.router];
	return coordinator;
}

#pragma mark - router creation

- (HEROBaseCoordinator*)mainCoordinator{
	return [self dequeueCoordinatorForRouter:[DEMOMainRouter class] coordinator:[DEMOMainCoordinator class] usecase:[DEMOMainUsecase class]];
}

- (HEROBaseCoordinator*)settingsCoordinator{
	return [self dequeueCoordinatorForRouter:[DEMOSettingsRouter class] coordinator:[DEMOSettingsCoordinator class] usecase:[DEMOSettingsUsecase class]];
}

- (HEROBaseCoordinator*)notesCoordinator{
	return [self dequeueCoordinatorForRouter:[DEMONotesRouter class] coordinator:[DEMONotesCoordinator class] usecase:[DEMONotesUsecase class]];
}

- (HEROBaseCoordinator*)pictureCoordinator{
	return [self dequeueCoordinatorForRouter:[DEMOPictureRouter class] coordinator:[DEMOPictureCoordinator class] usecase:[DEMOPictureUsecase class]];
}


#pragma mark private

- (void)updateDetailCoordinator:(HEROBaseCoordinator*)coordinator{
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
		[(DEMOMainRouter*)([self mainCoordinator].router) presentRouterInDetailView:coordinator.router];
	}
	else{
		[coordinator.router pushOnRouter:[self mainCoordinator].router];
	}
}



#pragma mark - DEMOSettingsWorkflowOutput
-(void)loggedOutOnRouter:(HEROBaseRouter*)router{
	[(id<DEMOMainParentWorkflowInput>)self.parentWorkflow loggedOutOnRouter:router];
}

- (void)selectedSelection:(DEMOMainSelection)selection onRouter:(HEROBaseRouter *)router {
	switch (selection) {
		case DEMOMainSelectionSettings:{
			HEROBaseCoordinator* coordinator = [self settingsCoordinator];
			[coordinator.router presentOnRouter:router inNavigationController:NO setAsRootView:NO transition:nil];
		}
			break;
		case DEMOMainSelectionNotes:
			[self updateDetailCoordinator:[self notesCoordinator]];
			break;
		case DEMOMainSelectionPictures:
			[self updateDetailCoordinator:[self pictureCoordinator]];
			break;
		case DEMOMainSelectionSwitches:
			//TODO: display updated switch/shortcut
			break;
			
		default:
			break;
	}
}

-(void)dismissOnRouter:(HEROBaseRouter*)router{
#warning implement
}

@end
