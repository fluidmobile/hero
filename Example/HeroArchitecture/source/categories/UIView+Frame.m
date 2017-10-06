//
//  UIView+FrameResize.m
//  mobilecontentbrowser
//
//  Created by Thomas Wolters on 18/04/14.
//  Copyright (c) 2014 fluidmobile. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)
-(CGPoint)pointRightBottom {
	return (CGPoint) {self.frame.origin.x + self.frame.size.width, self.frame.origin.y + self.frame.size.height};
}

+(float)heightForText:(NSString*)text inWidth:(float)width font:(UIFont*)font{
	
	
	
	return [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
							  options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
						   attributes:@{
										NSFontAttributeName :font
										}
							  context:nil].size.height;
}

+(float)widthForText:(NSString*)text inWidth:(float)width font:(UIFont*)font{
	
	CGRect frame = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
									  options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
								   attributes:@{
												NSFontAttributeName :font
												}
									  context:nil];
	
	return frame.size.width;
}

@end
