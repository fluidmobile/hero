//
//  DEMOAppColor.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 20/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

typedef NS_ENUM(NSInteger, DEMOAppTheme) {
	DEMOAppThemeDefault = 0,
	DEMOAppThemeDark = 1,
	DEMOAppThemeLight = 2
};

@interface DEMOAppColor : NSObject
//+(UIColor*)colorForType:(HEROBaseColorType)type;
+(instancetype)currentTheme;
-(void)changeThemeTo:(DEMOAppTheme)theme;
-(UIColor*)random;
-(UIColor*)labelText;
-(UIColor*)labelBackground;
-(UIColor*)labelBorder;
-(UIColor*)button;
-(UIColor*)buttonBackground;
-(UIColor*)buttonTitleNormal;
-(UIColor*)buttonTitleHighlighted;
-(UIColor*)buttonTitleDisabled;
-(UIColor*)buttonTitleSelected;
-(UIColor*)buttonTitleFocused;
-(UIColor*)viewBackground;
-(UIColor*)viewBorder;

-(UIColor*)explainableLabel;
-(UIColor*)explainableLabelBackgorund;
-(UIColor*)explainableBackground;
-(UIColor*)explainableBorder;

-(UIColor*)segmentedControlTint;
-(UIColor*)segmentedControlBackground;

-(UIColor*)selectedCollectionViewCell;
-(UIColor*)unselectedCollectionViewCell;


@end
