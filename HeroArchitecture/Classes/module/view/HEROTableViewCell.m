//
//  HEROTableViewCell.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 23/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "HEROTableViewCell.h"

@interface HEROTableViewCell()

@end

@implementation HEROTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
	self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
	if (!self){
		return  nil;
	}
	[self setupViewPreserveContent:NO];
	
	
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
//	NSAssert(NO, @"OVERRIDE: setupViewPreserveContent: in %@",[[self class] description]);
}
@end
