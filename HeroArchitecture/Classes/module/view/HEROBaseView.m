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
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(updateSizeCategoryInView)
												 name:UIContentSizeCategoryDidChangeNotification
											   object:nil];
	return self;
}

- (void)dealloc{
	[[NSNotificationCenter defaultCenter] removeObserver:self
													name:UIContentSizeCategoryDidChangeNotification
												  object:nil];
}

- (void)updateSizeCategoryInView{
	[self setupViewPreserveContent:YES];
}


- (void)setupViewPreserveContent:(BOOL)preserveContent{
	NSAssert(NO, @"OVERRIDE: setupViewPreserveContent: in %@",[[self class] description]);
}

@end
