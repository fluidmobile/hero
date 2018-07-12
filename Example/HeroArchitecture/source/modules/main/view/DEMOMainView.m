//
//  DEMOMainView.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 12/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOMainView.h"
#import "HEROViewFactory.h"
#import "DEMOExplanationView.h"
#import "UIView+Frame.h"
#import "DEMOAppColor.h"
#import "DEMOConstants.h"

@interface DEMOMainView()
@property (nonatomic, strong) UILabel* label;
@property (nonatomic, strong) UIButton* buttonSettings;
@property (nonatomic, strong) UIButton* buttonCallWorkflow;
@property (nonatomic, strong) UISegmentedControl* segmentedControlView;
@property (nonatomic, strong) DEMOExplanationView* explanationView;
@end
@implementation DEMOMainView

-(instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
	[self setupViewPreserveContent:NO];
    return self;
}

-(void)actionSelectButtonLogout:(id)sender{
    [self.delegate didSelectButton:0];
}

-(void)actionSelectButton1:(id)sender{
    [self.delegate didSelectButton:1];
}

-(void)actionSelectButtonCallWorkflow:(id)sender{
    [self.delegate selectButtonCallWorkflow];
}

- (void)layoutSubviews{
    [super layoutSubviews];
	
	CGSize sizeExplanation = [self.explanationView sizeThatFits:self.bounds.size];
	self.explanationView.frame = (CGRect){(self.bounds.size.width - sizeExplanation.width)/2,LAYOUT_BORDER_DEFAULT,sizeExplanation};
	
    //primitive layout for demo, NO production code
    self.label.frame = (CGRect){0,[self.explanationView pointRightBottom].y + LAYOUT_BORDER_DEFAULT,self.bounds.size.width,44};
    self.buttonSettings.frame = (CGRect){0,[self.label pointRightBottom].y,self.bounds.size.width,44};
    self.buttonCallWorkflow.frame = (CGRect){0,[self.buttonSettings pointRightBottom].y,self.bounds.size.width,44};
    self.segmentedControlView.frame = (CGRect){0,[self.buttonCallWorkflow pointRightBottom].y + LAYOUT_BORDER_DEFAULT,self.bounds.size.width,44};
    self.detailView.frame = (CGRect){LAYOUT_BORDER_DEFAULT*3,[self.segmentedControlView pointRightBottom].y+(LAYOUT_BORDER_DEFAULT*2),self.bounds.size.width-(LAYOUT_BORDER_DEFAULT*6),self.bounds.size.height-[self.segmentedControlView pointRightBottom].y-(LAYOUT_BORDER_DEFAULT*2)};
}

-(void)updateIsLoggedIn:(BOOL)isLoggedIn{
    if (isLoggedIn){
        self.label.text = @"logged in";
    }
    else{
        self.label.text = @"Logged out";
    }
	[self.explanationView updateTitle:[NSString stringWithFormat:@"%@Controller",[self class]] subtitle:[NSString stringWithFormat:@"<description>\n\"%@\"\nstate from service",self.label.text]];
}

-(void)setDetailView:(UIView *)detailView{
    if (self.detailView){
        NSLog(@"view removed");
        [self.detailView removeFromSuperview];
    }
    
    _detailView = detailView;
    [self addSubview:self.detailView];
    [self setNeedsLayout];
}

-(void)setupViewPreserveContent:(BOOL)preserveContent{
	NSString* textLabel = @"";
	if (preserveContent) {
		textLabel = self.label.text;
	}
	
	self.backgroundColor = [[DEMOAppColor currentTheme] viewBackground];
	
	[self.explanationView removeFromSuperview];
	self.explanationView = [DEMOExplanationView new];
	[self.explanationView updateTitle:[NSString stringWithFormat:@"%@",[self class]] subtitle:[NSString stringWithFormat:@"<description>\n%@\nstate from service",textLabel]];
	[self addSubview:self.explanationView];
	
	[self.label removeFromSuperview];
	[self.label removeFromSuperview];
	self.label = [HEROViewFactory labelWithText:@""];
	[self addSubview:self.label];
	
	[self.buttonSettings removeFromSuperview];
	self.buttonSettings = [HEROViewFactory buttonWithTitle:@"Settings" target:self selector:@selector(actionSelectButtonLogout:)];
	[self addSubview:self.buttonSettings];
    
    [self.buttonCallWorkflow removeFromSuperview];
    self.buttonCallWorkflow = [HEROViewFactory buttonWithTitle:@"CallWorkflow" target:self selector:@selector(actionSelectButtonCallWorkflow:)];
    [self addSubview:self.buttonCallWorkflow];
	
	[self.segmentedControlView removeFromSuperview];
	self.segmentedControlView = [[UISegmentedControl alloc] initWithItems:@[@"Notes",@"Pictures",@"Switches"]];
	[self.segmentedControlView addTarget:self action:@selector(segmentChanged:) forControlEvents: UIControlEventValueChanged];
	[self.segmentedControlView setTintColor:[[DEMOAppColor currentTheme] segmentedControlTint]];
	self.segmentedControlView.backgroundColor = [[DEMOAppColor currentTheme] segmentedControlBackground];
	[self addSubview:self.segmentedControlView];
}

-(void)segmentChanged:(UISegmentedControl*)segmentedControl{
	[self.delegate selectedSegmentAtIndex:(int)self.segmentedControlView.selectedSegmentIndex];
}

@end
