//
//  UIView+FrameResize.h
//  mobilecontentbrowser
//
//  Created by Thomas Wolters on 18/04/14.
//  Copyright (c) 2014 fluidmobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)
-(CGPoint)pointRightBottom;
+(float)heightForText:(NSString*)text inWidth:(float)width font:(UIFont*)font;
+(float)widthForText:(NSString*)text inWidth:(float)width font:(UIFont*)font;
@end

