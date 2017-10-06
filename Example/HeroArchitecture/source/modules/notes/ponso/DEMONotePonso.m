//
//  DEMONotesNotePonso.m
//  fluidArchitecture
//
//  Created by Thomas Wolters on 18/01/2017.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMONotePonso.h"

@implementation DEMONotePonso
-(instancetype)initWithNoteID:(NSString*)noteID title:(NSString*)title text:(NSString*)text creationDate:(NSDate*)creationDate{
	self = [super init];
	if (!self) {
		return nil;
	}
	_noteID = noteID;
	_title = title;
	_text = text;
	_creationDate = creationDate;
	return self;
}
@end
