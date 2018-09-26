//
//  HEROBaseView.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 23/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseView.h"


@implementation HEROBaseView

- (instancetype)init{
	self = [super init];
	if (!self) {
		return nil;
	}
	return self;
}

-(void)updateSizeClass:(UIUserInterfaceSizeClass)sizeClass{
    //no different behavior in base
}


@end
