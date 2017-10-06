//
//  DEMONoteEntity.m
//  fluidArchitecture
//
//  Created by Thomas Wolters on 18/01/2017.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMONoteEntity.h"
#import "DEMOConstants.h"

@implementation DEMONoteEntity

-(instancetype)initWithTitle:(NSString*)title text:(NSString*)text;{
	self = [super init];
	if (!self) {
		return nil;
	}
	self.title = title;
	self.text = text;
	self.dateCreated = [NSDate date];
	self.dateUpdated = [NSDate date];
	return self;
}

-(void)updateTitle:(NSString*)title note:(NSString*)note{
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
	self.title = title;
	self.text = note;
	self.dateUpdated = [NSDate date];
	[realm commitWriteTransaction];
}

+(instancetype)objectForBeID:(NSString*)beID{
	return [[[DEMONoteEntity objectsWhere:@"beID == %@",beID] valueForKey:@"self"] firstObject];
}
@end
