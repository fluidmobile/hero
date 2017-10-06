//
//  DEMONoteEditingCoordinator.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMONoteEditingCoordinator.h"
#import "HEROBaseRouter.h"

@implementation DEMONoteEditingCoordinator

#pragma mark - DEMONoteEditingRouterOutput
-(void)updateNoteID:(NSString *)noteID{
	[(id<DEMONoteEditingUsecaseInput>)self.usecase updateNoteID:noteID];
}

#pragma mark - DEMONoteEditingUsecaseOutput
-(void)didFinishEditing{
	[(id<DEMONoteEditingRouterInput>)self.router didFinishEditing];
}

-(void)updateNote:(DEMONoteEditPonso *)note{
	[(id<DEMONoteEditingViewInput>)self.viewLayer updateNote:note];
}

#pragma mark - DEMONoteEditingViewOutput
-(void)discardChanges{
	[(id<DEMONoteEditingUsecaseInput>)self.usecase discardChanges];
}

-(void)modifyTitle:(NSString *)title note:(NSString *)note{
	[(id<DEMONoteEditingUsecaseInput>)self.usecase modifyTitle:title note:note];
}
@end
