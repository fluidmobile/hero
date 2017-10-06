//
//  DEMONotesCoordinator.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 13/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//
#import "DEMONotesCoordinator.h"
@interface DEMONotesCoordinator()
@end

@implementation DEMONotesCoordinator

-(void)createNewNoteWithTitle:(NSString *)title text:(NSString *)text{
	[(id<DEMONotesUsecaseInput>) self.usecase createNewNoteWithTitle:title text:text];
}

-(void)updateWithNotes:(NSArray <DEMONotePonso*>*)notes{
	[(id<DEMONotesViewInput>)self.viewLayer updateWithNotes:notes];
}

@end
