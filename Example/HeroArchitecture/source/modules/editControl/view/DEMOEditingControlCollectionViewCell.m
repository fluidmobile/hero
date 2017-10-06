//
//  DEMOEditingControlCollectionViewCell.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOEditingControlCollectionViewCell.h"
#import "HEROViewFactory.h"
#import "UIView+Frame.h"
#import "DEMOAppColor.h"
#import "DEMOAppFont.h"
#import "DEMOEditingPonso.h"
#import "DEMOConstants.h"

@interface DEMOEditingControlCollectionViewCell ()
@property (nonatomic, strong) UILabel* labelTitle;
@property (nonatomic, strong) UILabel* labelIcon;
@end

@implementation DEMOEditingControlCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
	self = [super initWithFrame:frame];
	if (!self) {
		return nil;
	}
	_labelTitle = [HEROViewFactory labelWithText:@""];
	[self.contentView addSubview:self.labelTitle];
	
	_labelIcon = [HEROViewFactory labelWithText:@""];
	[self.contentView addSubview:self.labelIcon];
	
	return self;
}

-(void)prepareForReuse{
	[super prepareForReuse];
	self.labelTitle.text = @"";
	self.labelIcon.text = @"";
	self.contentView.backgroundColor = [[DEMOAppColor currentTheme] unselectedCollectionViewCell];
}

-(void)layoutSubviews{
	[super layoutSubviews];
	CGSize usableSize = (CGSize){self.bounds.size.width-(2*LAYOUT_BORDER_DEFAULT),self.bounds.size.height-(2*LAYOUT_BORDER_DEFAULT)};
	BOOL isSquareLike = (self.bounds.size.height / self.bounds.size.width) < 1.125f;
	[self setFontForSquareLikeDimensions:isSquareLike];
	CGSize sizeTitle = [self.labelTitle sizeThatFits:usableSize];
	CGSize sizeIcon = [self.labelIcon sizeThatFits:usableSize];
	if (isSquareLike) {
		self.labelIcon.frame = (CGRect){(self.bounds.size.width - sizeIcon.width)/2,LAYOUT_BORDER_DEFAULT,sizeIcon};
		float positionTitleY = fminf([self.labelIcon pointRightBottom].y +LAYOUT_BORDER_DEFAULT, self.bounds.size.height - LAYOUT_BORDER_DEFAULT - sizeIcon.height);
		self.labelTitle.frame = (CGRect){(self.bounds.size.width - sizeTitle.width)/2,positionTitleY,sizeTitle};
	}
	else{
		self.labelIcon.frame = (CGRect){LAYOUT_BORDER_DEFAULT,(self.bounds.size.height - sizeIcon.height)/2,sizeIcon};
		self.labelTitle.frame = (CGRect){[self.labelIcon pointRightBottom].x + LAYOUT_BORDER_DEFAULT,(self.bounds.size.height - sizeTitle.height)/2,sizeTitle};
	}
}

-(void)setFontForSquareLikeDimensions:(BOOL)squareLikeDimensions{
	if (squareLikeDimensions) {
		self.labelTitle.font = [DEMOAppFont fontForTextStyle:UIFontTextStyleCaption1];
		self.labelIcon.font = [DEMOAppFont fontForTextStyle:UIFontTextStyleTitle1];
	}
	else{
		self.labelTitle.font = [DEMOAppFont fontForTextStyle:UIFontTextStyleTitle2];
		self.labelIcon.font = [DEMOAppFont fontForTextStyle:UIFontTextStyleTitle2];
	}
}

-(void)updateEditingControl:(DEMOEditingPonso*)editingControl{
	self.labelTitle.text = editingControl.title;
	self.labelIcon.text = editingControl.iconString;
	self.contentView.backgroundColor = [[DEMOAppColor currentTheme] unselectedCollectionViewCell];
}

@end
