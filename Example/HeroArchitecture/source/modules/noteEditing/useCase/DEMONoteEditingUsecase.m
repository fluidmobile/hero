//
//  DEMONoteEditingUsecase.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMONoteEditingUsecase.h"
#import "DEMONoteEditPonso.h"
#import "DEMONoteEntity.h"

@interface DEMONoteEditingUsecase ()
@property (nonatomic, strong) DEMONoteEditPonso* currentNote;
@end

@implementation DEMONoteEditingUsecase
-(instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }

    return self;
}

-(void)requestContentUpdate{
	[(id<DEMONoteEditingUsecaseOutput>)self.coordinator updateNote:self.currentNote];
}

#pragma mark - DEMONoteEditingUsecaseInput
- (void)discardChanges {
	[(id<DEMONoteEditingUsecaseOutput>)self.coordinator didFinishEditing];
}

- (void)modifyTitle:(NSString *)title note:(NSString *)note {
	DEMONoteEntity* noteObject = [DEMONoteEntity objectForBeID:self.currentNote.noteID];
	[noteObject updateTitle:title note:note];
	[(id<DEMONoteEditingUsecaseOutput>)self.coordinator didFinishEditing];
}

- (void)updateNoteID:(NSString *)noteID {
	DEMONoteEntity* noteObject = [DEMONoteEntity objectForBeID:self.currentNote.noteID];
	self.currentNote = [[DEMONoteEditPonso alloc] initWithNoteID:[noteObject beID] title:[noteObject title] text:[noteObject text]];
	[self requestContentUpdate];
}

@end
