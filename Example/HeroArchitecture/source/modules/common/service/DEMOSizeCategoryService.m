//
//  DEMOSizeCategoryService.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOSizeCategoryService.h"

@implementation DEMOSizeCategoryService
+(UIUserInterfaceSizeClass)horizontalSizeClassForViewController:(UIViewController*)viewController{
	if (viewController) {
		return [[viewController traitCollection] horizontalSizeClass];
	}
	return [self currentKeyWindowHorizontalSizeClass];
}

+(UIUserInterfaceSizeClass)verticalSizeClassForViewController:(UIViewController*)viewController{
	if (viewController) {
		return [[viewController traitCollection] verticalSizeClass];
	}
	return [self currentKeyWindowVerticalSizeClass];
}

+(UIUserInterfaceSizeClass)currentKeyWindowVerticalSizeClass{
	return [[[[UIApplication sharedApplication] keyWindow] traitCollection] verticalSizeClass];
}

+(UIUserInterfaceSizeClass)currentKeyWindowHorizontalSizeClass{
	return [[[[UIApplication sharedApplication] keyWindow] traitCollection] horizontalSizeClass];
}
@end

