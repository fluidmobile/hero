

//
//  DEMONoteEditPonso.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMONoteEditPonso.h"

@implementation DEMONoteEditPonso
-(instancetype)initWithNoteID:(NSString*)noteID title:(NSString*)title note:(NSString*)note{
	self = [super init];
	if (!self) {
		return nil;
	}
	_noteID = noteID;
	_title = title;
	_note = note;
	return self;
}

@end

