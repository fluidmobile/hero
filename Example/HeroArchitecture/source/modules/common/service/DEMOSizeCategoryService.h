//
//  DEMOSizeCategoryService.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface DEMOSizeCategoryService : NSObject
+(UIUserInterfaceSizeClass)horizontalSizeClassForViewController:(UIViewController*)viewController;
+(UIUserInterfaceSizeClass)verticalSizeClassForViewController:(UIViewController*)viewController;
+(UIUserInterfaceSizeClass)currentKeyWindowVerticalSizeClass;
+(UIUserInterfaceSizeClass)currentKeyWindowHorizontalSizeClass;
@end
