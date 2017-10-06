//
//  DEMONotesWorkflow.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 19/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//
#import "DEMONotesRouter.h"
#import "DEMONotesUsecase.h"
#import "DEMONotesCoordinator.h"
#import "DEMONotesWorkflow.h"

@implementation DEMONotesWorkflow

-(HEROBaseCoordinator *)createInitialCoordinator{
	return [self notesCoordinator];
}

-(HEROBaseCoordinator *)notesCoordinator{
	return [self dequeueCoordinatorForRouter:[DEMONotesRouter class] coordinator:[DEMONotesCoordinator class] usecase:[DEMONotesUsecase class]];
}



@end
