//
//  DEMOPictureView.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 22.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOPictureView.h"
#import "HEROViewFactory.h"
#import "DEMOPicturePonso.h"
#import "DEMOAppColor.h"

@interface DEMOPictureView()
@property (nonatomic, strong) UIImageView* imageView;
@end

@implementation DEMOPictureView

-(instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.backgroundColor = [[DEMOAppColor currentTheme] viewBackground];
	_imageView = [HEROViewFactory imageViewWithImageNamed:@""];
	UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userDidSelectimage:)];
	[self addGestureRecognizer:tapGesture];
	[self addSubview:self.imageView];
    return self;
}

-(void)updatePicture:(DEMOPicturePonso *)picture{
	self.imageView.image = [picture image];
}

- (void)layoutSubviews{
    [super layoutSubviews];
	self.imageView.frame = self.bounds;
}

-(void)userDidSelectimage:(UITapGestureRecognizer*)gestureRecognizer{
	[self.delegate userDidSelectimage];
	
}

@end
