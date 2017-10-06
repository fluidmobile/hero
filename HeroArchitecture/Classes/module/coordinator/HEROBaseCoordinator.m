//
//  HEROBaseCoordinator.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 16/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROBaseCoordinator.h"
#import "HEROBaseUsecase.h"
#import "HEROBaseRouter.h"

@implementation HEROBaseCoordinator

- (instancetype)initWithUsecase:(HEROBaseUsecase*)usecase{
	self = [super init];
	if (!self) {
		return nil;
	}
	_usecase = usecase;
	self.usecase.coordinator = self;
	return self;
}

- (void)requestContentUpdate{
	[self.usecase requestContentUpdate];
}

- (void)dealloc{
#ifdef DEBUG
	NSLog(@"DEALLOC on %@",[[self class] description]);
#endif
}
@end

