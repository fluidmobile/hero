//
//  DEMOPictureUsecase.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 22.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOPictureUsecase.h"
#import "DEMOPicturePonso.h"

@interface DEMOPictureUsecase()
@property (nonatomic,assign) int pictureIndex;
@property (nonatomic,strong) NSArray<NSString*>* imagePaths;
@end

@implementation DEMOPictureUsecase
-(instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
	_imagePaths = [self createImagePaths];
    return self;
}

-(void)requestContentUpdate{
	DEMOPicturePonso* picture = [[DEMOPicturePonso alloc] initWithImagePath:[self currentImagePath]];
	[(id<DEMOPictureUsecaseOutput>)self.coordinator updatePicture:picture];
}

-(NSString*)currentImagePath{
	if (self.pictureIndex>=[self.imagePaths count]) {
		self.pictureIndex = 0;
	}
	return self.imagePaths[self.pictureIndex];
}

-(void)selectedImage{
	self.pictureIndex++;
	[self requestContentUpdate];
}

-(NSArray<NSString*>*)createImagePaths{
	NSMutableArray<NSString*>* images = [@[] mutableCopy];
	[images addObject:@"img0.jpg"];
	[images addObject:@"img1.jpg"];
	return images;
}
@end
