//
//  HEROBaseFont.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 20/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOAppFont.h"

//#define APP_FONT @"GillSans-UltraBold"
#define APP_FONT @"HelveticaNeue"

@implementation DEMOAppFont

+(UIFont*)fontForTextStyle:(UIFontTextStyle)textStyle{
	UIFont* systemFont = [UIFont preferredFontForTextStyle:textStyle];
	return [UIFont fontWithName:APP_FONT size:[systemFont pointSize]];
}

+(void)printAllInstalledSystemFonts{
	for (NSString *familyName in [UIFont familyNames]){
		NSLog(@"Family name: %@", familyName);
		for (NSString *fontName in [UIFont fontNamesForFamilyName:familyName]) {
			NSLog(@"--Font name: %@", fontName);
		}
	}
}

@end
