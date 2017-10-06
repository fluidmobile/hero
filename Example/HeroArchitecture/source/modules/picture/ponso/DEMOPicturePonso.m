//
//  DEMOPicturePonso.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 22.09.17.
//Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOPicturePonso.h"

@interface DEMOPicturePonso()
@property (nonatomic, strong) NSString* imagePath;
@end

@implementation DEMOPicturePonso
-(instancetype)initWithImagePath:(NSString*)imagePath{
	self = [super init];
	if (!self) {
		return nil;
	}
	_imagePath = imagePath;
	return self;
}

-(UIImage *)image{
	UIImage* image = [UIImage imageWithContentsOfFile:self.imagePath];
	if (!image) {
		image = [UIImage imageNamed:self.imagePath];
	}
	return image;
}
@end

