//
//  DEMOEditingPonso.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOEditingPonso.h"

@implementation DEMOEditingPonso
-(instancetype)initWithTitle:(NSString*)title mode:(DEMOEditingMode)mode{
	self = [super init];
	if (!self) {
		return nil;
	}
	_title = title;
	_mode = mode;
	_isSelected = NO;
	return self;
}

-(NSString*)iconString{
	switch (self.mode) {
		case DEMOEditingModeAdd:
			return @"➕";
			break;
		case DEMOEditingModeEdit:
			return @"🛠";
			break;
		case DEMOEditingModeRemove:
			return @"➖";
			break;
	}
}
@end

