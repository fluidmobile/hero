//
//  HEROBaseFont.h
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 20/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface DEMOAppFont : NSObject
+(UIFont*)fontForTextStyle:(UIFontTextStyle)textStyle;
+(void)printAllInstalledSystemFonts;
@end
