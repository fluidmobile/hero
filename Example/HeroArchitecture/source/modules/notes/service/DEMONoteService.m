//
//  DEMONoteService.m
//  VERWUSPL
//
//  Created by Moritz Ellerbrock on 05.10.17.
//Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMONoteService.h"
#import "DEMONoteEntity.h"

@implementation DEMONoteService
+(void)saveNoteEntity:(DEMONoteEntity*)noteEntity{
	RLMRealm* realm = [RLMRealm defaultRealm];
	[realm beginWriteTransaction];
	[realm addObject:noteEntity];
	[realm commitWriteTransaction];
}
@end

