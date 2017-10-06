//
//  DEMOSettingsView.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 13/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOSettingsView.h"
#import "HEROViewFactory.h"

@interface DEMOSettingsView ()
@property (nonatomic, strong) UILabel* label;
@property (nonatomic, strong) NSArray* buttons;
@property (nonatomic, strong) UIImageView* imageView;
@end

@implementation DEMOSettingsView

-(instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.backgroundColor = [UIColor whiteColor];
    self.imageView = [HEROViewFactory imageViewWithImageNamed:@"img0.jpg"];
    [self addSubview:self.imageView];
    
    _label = [HEROViewFactory labelWithText:[[self class] description]];
    [self addSubview:self.label];
	
	
    UIButton* buttonLogout = [HEROViewFactory buttonWithTitle:@"Logout!" target:self selector:@selector(actionSelectLogout:)];
	UIButton* buttonDismiss = [HEROViewFactory buttonWithTitle:@"Dismiss!" target:self selector:@selector(actionDismiss:)];
	
	self.buttons = @[buttonLogout,buttonDismiss];
	for (UIView* view in self.buttons){
		[self addSubview:view];
	}

    return self;
}

-(void)actionSelectLogout:(id)sender{
    [self.delegate userDidLogout];
}

-(void)actionDismiss:(id)sender{
	[self.delegate userDidDismiss];
}



- (void)layoutSubviews{
    [super layoutSubviews];
    //primitive layout for demo, NO production code
    self.label.frame = (CGRect){0,0,self.bounds.size.width,44};
	int index = 0;
	for (UIView* button in self.buttons){
		button.frame = (CGRect){0,44*index,self.bounds.size.width,44};
		index++;
	}
	
    self.imageView.frame = self.bounds;
}

@end
