//
//  DEMOLoginView.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 18/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOLoginView.h"
#import "HEROViewFactory.h"
#import "UIView+Frame.h"
#import "DEMOConstants.h"
#import "DEMOExplanationView.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Weverything"
#import <MBProgressHUD/MBProgressHUD.h>
#pragma clang pop


@interface DEMOLoginView()
@property (nonatomic, strong) UILabel* labelLoginExplanation;
@property (nonatomic, strong) DEMOExplanationView* explanationView;
@property (nonatomic, strong) UIButton* buttonLogin;
@end

@implementation DEMOLoginView

-(instancetype)init{
	self = [super init];
	if (!self) {
		return nil;
	}
	[self setupViewPreserveContent:NO];
	
	return self;
}

-(void)userDidSelectLogin:(id)sender{
	[self.delegate userDidSelectLogin];
}

-(void)showProgressIndicator:(BOOL)showProgress{
	if (showProgress) {
		[MBProgressHUD showHUDAddedTo:self animated:YES];
	}
	else{
		[MBProgressHUD hideHUDForView:self animated:YES];
	}
}

-(void)loginIsDisabled:(BOOL)isDisabled{
	self.buttonLogin.enabled = !isDisabled;
}

-(void)layoutSubviews{
	[super layoutSubviews];
	
	CGSize sizeExplanation = [self.explanationView sizeThatFits:(CGSize){self.bounds.size.width/2,self.bounds.size.height}];
	self.explanationView.frame = (CGRect){(self.bounds.size.width - sizeExplanation.width)/2,LAYOUT_BORDER_DEFAULT*2,sizeExplanation};
	
	self.labelLoginExplanation.frame = (CGRect){0,[self.explanationView pointRightBottom].y + LAYOUT_BORDER_DEFAULT,self.bounds.size.width,(self.bounds.size.height/2) - [self.explanationView pointRightBottom].y};
	self.buttonLogin.frame = (CGRect){0,self.bounds.size.height/2,self.bounds.size.width,self.bounds.size.height/2};
}


-(void)updateSizeCategoryInView{
	[self setupViewPreserveContent:YES];
}


-(void)setupViewPreserveContent:(BOOL)preserveContent{
	self.backgroundColor = [UIColor whiteColor];
	[self.labelLoginExplanation removeFromSuperview];
	_labelLoginExplanation = [HEROViewFactory labelWithText:@"Press\n\n\"login\""];
	self.labelLoginExplanation.textAlignment = NSTextAlignmentCenter;
	self.labelLoginExplanation.numberOfLines = 0;
	[self addSubview:self.labelLoginExplanation];
	
	[self.explanationView removeFromSuperview];
	self.explanationView = [DEMOExplanationView new];
	[self.explanationView updateTitle:[NSString stringWithFormat:@"%@",[self class]] subtitle:@"<description>"];
	[self addSubview:self.explanationView];
	
	[self.buttonLogin removeFromSuperview];
	_buttonLogin = [HEROViewFactory buttonWithTitle:@"login" target:self selector:@selector(userDidSelectLogin:)];
	[self addSubview:self.buttonLogin];
}


@end
