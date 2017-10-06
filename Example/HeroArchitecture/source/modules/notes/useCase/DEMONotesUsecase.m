//
//  DEMONotesUsecase.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 13/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMONotesUsecase.h"
#import "DEMONoteEntity.h"
#import "DEMONoteService.h"
#import "DEMONotePonso.h"

@interface DEMONotesUsecase ()
@property (nonatomic, strong) NSArray<DEMONotePonso*>* notes;
@end

@implementation DEMONotesUsecase

- (void)requestContentUpdate{
	[self refreshNotes];
	dispatch_async(dispatch_get_main_queue(), ^{
		[(id<DEMONotesUsecaseOutput>)self.coordinator updateWithNotes:self.notes];
	});
}

- (void)refreshNotes{
	NSArray<DEMONoteEntity*>* noteObjects = [[DEMONoteEntity allObjects] valueForKey:@"self"];
	self.notes = [self createNotesWithNoteObjects:noteObjects];
}

-(NSArray<DEMONotePonso*>*)createNotesWithNoteObjects:(NSArray<DEMONoteEntity*>*)noteObjects{
	NSMutableArray<DEMONotePonso*>* mutableNotes = [@[] mutableCopy];
	for (DEMONoteEntity* noteObject in noteObjects) {
		DEMONotePonso* note = [[DEMONotePonso alloc] initWithNoteID:noteObject.beID title:noteObject.title text:noteObject.text creationDate:noteObject.dateCreated];
		[mutableNotes addObject:note];
	}
	return mutableNotes;
}

-(void)createNewNoteWithTitle:(NSString *)title text:(NSString *)text{
	DEMONoteEntity* noteEntity =  [[DEMONoteEntity alloc] initWithTitle:title text:text];
	[DEMONoteService saveNoteEntity:noteEntity];
	[self requestContentUpdate];
}

@end
