//
//  DEMOContainerView.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOContainerView.h"
#import "DEMOSizeCategoryService.h"
#import "UIView+Frame.h"

@interface DEMOContainerView()
@property (nonatomic, strong) UIView* viewMaster;
@property (nonatomic, strong) UIView* viewDetail;
@end

@implementation DEMOContainerView

-(instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
	[self setupViewPreserveContent:NO];
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
	UIUserInterfaceSizeClass sizeClass = [DEMOSizeCategoryService currentKeyWindowHorizontalSizeClass];
	switch (sizeClass) {
		case UIUserInterfaceSizeClassCompact:
			self.viewDetail.frame = (CGRect){0,0,self.bounds.size.width,60.0};
			self.viewMaster.frame = (CGRect){0,[self.viewDetail pointRightBottom].y,self.bounds.size.width,self.bounds.size.height - [self.viewDetail pointRightBottom].y};
			break;
		case UIUserInterfaceSizeClassRegular:
		case UIUserInterfaceSizeClassUnspecified:{
			float minWidth = fmaxf(200.0f, self.bounds.size.width/4);
			self.viewDetail.frame = (CGRect){0,0,minWidth,self.bounds.size.height};
			self.viewMaster.frame = (CGRect){[self.viewDetail pointRightBottom].x,0,self.bounds.size.width - [self.viewDetail pointRightBottom].x,self.bounds.size.width};
		}
		break;
	}
}

-(void)setupViewPreserveContent:(BOOL)preserveContent{
	[self.viewMaster removeFromSuperview];
	[self.viewDetail removeFromSuperview];
	
	if (!preserveContent) {
		self.viewMaster = [UIView new];
		self.viewDetail = [UIView new];
	}
	
	[self addSubview:self.viewMaster];
	[self addSubview:self.viewDetail];
}

-(void)updateMasterView:(UIView *)viewMaster{
	
}

-(void)updateDetailView:(UIView *)viewDetai{
	
}

@end
