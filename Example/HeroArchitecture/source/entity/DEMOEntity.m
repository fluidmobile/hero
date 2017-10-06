//
//  DEMOEntity.m
//  fluidArchitecture
//
//  Created by Thomas Wolters on 18/01/2017.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOEntity.h"

@implementation DEMOEntity
- (instancetype)init{
	self = [super init];
	if (!self) {
		return nil;
	}
//    self.beID = [FMUUIDGenerator uuidString];
    self.beID = @"aBeID";
	return self;
}
@end
