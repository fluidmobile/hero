//
//  DEMOExplanationView.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 22.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOExplanationView.h"
#import "HEROViewFactory.h"
#import "DEMOConstants.h"
#import "UIView+Frame.h"
#import "DEMOAppColor.h"
#import "DEMOAppFont.h"

@interface DEMOExplanationView()
@property (nonatomic, strong) UILabel* labelTitle;
@property (nonatomic, strong) UILabel* labelSubtitle;
@property (nonatomic, strong) UIView* viewWrapper;
@end

@implementation DEMOExplanationView

-(instancetype)init{
	self = [super init];
	if (!self) {
		return nil;
	}
	
	
	[self setupViewPreserveContent:NO];
	return self;
}

-(void)updateTitle:(NSString*)title subtitle:(NSString*)subtitle{
	self.labelTitle.text = title;
	self.labelSubtitle.text = subtitle;
	[self setNeedsLayout];
}

-(CGSize)sizeThatFits:(CGSize)size{
	CGSize usableSize = (CGSize){size.width-(2*LAYOUT_BORDER_DEFAULT),MAXFLOAT};
	CGSize sizeTitle = [self.labelTitle sizeThatFits:usableSize];
	CGSize sizeSubtitle = [self.labelSubtitle sizeThatFits:usableSize];
	float width = fmaxf(sizeTitle.width, sizeSubtitle.width) + (2*LAYOUT_BORDER_DEFAULT);
	return (CGSize){fminf(width, usableSize.width),LAYOUT_BORDER_DEFAULT + sizeTitle.height + LAYOUT_BORDER_DEFAULT + sizeSubtitle.height + LAYOUT_BORDER_DEFAULT};
}

-(void)layoutSubviews{
	[super layoutSubviews];
	CGSize usableSize = (CGSize){self.bounds.size.width-(2*LAYOUT_BORDER_DEFAULT),MAXFLOAT};
	CGSize sizeTitle = [self.labelTitle sizeThatFits:usableSize];
	CGSize sizeSubtitle = [self.labelSubtitle sizeThatFits:usableSize];
	
	self.viewWrapper.frame = self.bounds;
	self.labelTitle.frame = (CGRect){(self.bounds.size.width - sizeTitle.width)/2,LAYOUT_BORDER_DEFAULT,sizeTitle};
	self.labelSubtitle.frame = (CGRect){(self.bounds.size.width - sizeSubtitle.width)/2,[self.labelTitle pointRightBottom].y + LAYOUT_BORDER_DEFAULT,sizeSubtitle};
}

-(void)setupViewPreserveContent:(BOOL)preserveContent{
	NSString* title = @"";
	NSString* subtitle = @"";
	if (preserveContent) {
		title = self.labelTitle.text;
		subtitle = self.labelSubtitle.text;
	}
	[self.viewWrapper removeFromSuperview];
	self.viewWrapper = [UIView new];
	self.viewWrapper.backgroundColor = [[DEMOAppColor currentTheme] explainableBackground];
	self.viewWrapper.layer.cornerRadius = LAYOUT_BORDER_DEFAULT;
	self.viewWrapper.layer.borderColor = [[DEMOAppColor currentTheme] explainableBorder].CGColor;
	self.viewWrapper.layer.borderWidth = 2;
	[self addSubview:self.viewWrapper];
	
	[self.labelTitle removeFromSuperview];
	self.labelTitle = [HEROViewFactory labelWithText:title];
	self.labelTitle.textColor = [[DEMOAppColor currentTheme] explainableLabel];
	self.labelTitle.backgroundColor = [[DEMOAppColor currentTheme] explainableBackground];
	self.labelTitle.font = [DEMOAppFont fontForTextStyle:UIFontTextStyleBody];
	self.labelTitle.textAlignment = NSTextAlignmentCenter;
	[self.viewWrapper addSubview:self.labelTitle];
	
	[self.labelSubtitle removeFromSuperview];
	self.labelSubtitle = [HEROViewFactory labelWithText:subtitle];
	self.labelSubtitle.textColor = [[DEMOAppColor currentTheme] explainableLabel];
	self.labelSubtitle.backgroundColor = [[DEMOAppColor currentTheme] explainableBackground];
	self.labelSubtitle.font = [DEMOAppFont fontForTextStyle:UIFontTextStyleFootnote];
	self.labelSubtitle.textAlignment = NSTextAlignmentCenter;
	[self.viewWrapper addSubview:self.labelSubtitle];
}
@end
