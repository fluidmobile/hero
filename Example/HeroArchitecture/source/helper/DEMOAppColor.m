//
//  DEMOAppColor.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 20/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOAppColor.h"

typedef NS_ENUM(NSInteger, HEROBaseColorType){
	HEROBaseColorRandom = 0,
	HEROBaseColorLabel = 1,
	HEROBaseColorLabelText = 2,
	HEROBaseColorLabelBackground = 3,
	HEROBaseColorLabelBorder = 4,
	HEROBaseColorButton = 5,
	HEROBaseColorButtonBackground = 6,
	HEROBaseColorButtonTitleNormal = 7,
	HEROBaseColorButtonTitleHighlighted = 8,
	HEROBaseColorButtonTitleDisabled = 9,
	HEROBaseColorButtonTitleSelected = 10,
	HEROBaseColorButtonTitleFocused = 11,
	HEROBaseColorViewBackground = 12,
	HEROBaseColorViewBorder = 13,
};

@interface DEMOAppColor()
@property (nonatomic, assign) DEMOAppTheme theme;
@end

@implementation DEMOAppColor

-(instancetype)init{
	self = [super init];
	if (!self) {
		return nil;
	}
	_theme = DEMOAppThemeDefault;
	return self;
}


+(instancetype)currentTheme{
	static DEMOAppColor* sharedInstance;
	@synchronized(self)
	{
		if (!sharedInstance) sharedInstance = [[self alloc] init];
		return sharedInstance;
	}
}

-(void)changeThemeTo:(DEMOAppTheme)theme{
	self.theme = theme;
}

//+(UIColor*)colorForType:(HEROBaseColorType)type{
//	switch (type) {
//		case HEROBaseColorRandom:
//			
//		case HEROBaseColorLabel:
//			return [UIColor blueColor];
//		case HEROBaseColorLabelText:
//			return [UIColor blackColor];
//		case HEROBaseColorLabelBorder:
//			return [UIColor cyanColor];
//		case HEROBaseColorLabelBackground:
//			return [UIColor greenColor];
//		case HEROBaseColorButton:
//			return [UIColor darkGrayColor];
//		case HEROBaseColorButtonBackground:
//			return [UIColor lightGrayColor];
//		case HEROBaseColorButtonTitleNormal:
//			return [UIColor blackColor];
//		case HEROBaseColorButtonTitleFocused:
//			return [UIColor magentaColor];
//		case HEROBaseColorButtonTitleDisabled:
//			return [UIColor purpleColor];
//		case HEROBaseColorButtonTitleSelected:
//			return [UIColor yellowColor];
//		case HEROBaseColorButtonTitleHighlighted:
//			return [UIColor orangeColor];
//		case HEROBaseColorViewBorder:
//			return [UIColor redColor];
//		case HEROBaseColorViewBackground:
//			return [UIColor whiteColor];
//  	}
//}

-(UIColor*)random{
	CGFloat hue = arc4random() % 256 / 256.0f;    //  0.0 to 1.0
	CGFloat saturation = (arc4random() % 128 / 256.0f) + 0.5f;    //  0.5 to 1.0, away from white
	CGFloat brightness = (arc4random() % 128 / 256.0f) + 0.5f;    //  0.5 to 1.0, away from black
	return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

-(UIColor*)labelText{
	return [UIColor blackColor];
}

-(UIColor*)labelBackground{
	return [UIColor cyanColor];
}

-(UIColor*)labelBorder{
	return [UIColor darkGrayColor];
}

-(UIColor*)button{
	return [UIColor darkGrayColor];
}

-(UIColor*)buttonBackground{
	return [UIColor lightGrayColor];
}

-(UIColor*)buttonTitleNormal{
	return [UIColor blackColor];
}

-(UIColor*)buttonTitleHighlighted{
	return [UIColor orangeColor];
}

-(UIColor*)buttonTitleDisabled{
	return [UIColor purpleColor];
}

-(UIColor*)buttonTitleSelected{
	return [UIColor yellowColor];
}

-(UIColor*)buttonTitleFocused{
	return [UIColor magentaColor];
}

-(UIColor*)viewBackground{
	return [UIColor whiteColor];
}

-(UIColor*)viewBorder{
	return [UIColor redColor];
}

-(UIColor*)explainableLabel{
	return [UIColor whiteColor];
}

-(UIColor*)explainableLabelBackgorund{
	return [UIColor clearColor];
}

-(UIColor*)explainableBackground{
	return [UIColor blackColor];
}

-(UIColor*)explainableBorder{
	return [UIColor blackColor];
}

-(UIColor*)segmentedControlTint{
	return [UIColor lightGrayColor];
}

-(UIColor*)segmentedControlBackground{
	return [UIColor whiteColor];
}

-(UIColor*)selectedCollectionViewCell{
	return [UIColor lightGrayColor];
}

-(UIColor*)unselectedCollectionViewCell{
	return [UIColor darkGrayColor];
}


@end
