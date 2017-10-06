//
//  DEMONotesVIewTableViewCell.m
//  fluidArchitecture
//
//  Created by Thomas Wolters on 18/01/2017.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMONotesViewTableViewCell.h"
#import "HEROViewFactory.h"

@interface DEMONotesViewTableViewCell()
@property (nonatomic, strong) UILabel* label;
@end

@implementation DEMONotesViewTableViewCell


-(void)setupViewPreserveContent:(BOOL)preserveContent{
	NSString* text = (self.label  && preserveContent ? self.label.text : @"");
	[self.label removeFromSuperview];
	self.label = [HEROViewFactory labelWithText:text];
	[self.contentView addSubview:self.label];
}

-(void)updateText:(NSString*)text{
	self.label.text = text;
	[self setNeedsLayout];
}

-(void)layoutSubviews{
	self.label.frame = self.bounds;
}
@end
