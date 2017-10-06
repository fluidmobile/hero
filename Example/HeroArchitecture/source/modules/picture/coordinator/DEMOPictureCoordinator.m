//
//  DEMOPictureCoordinator.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 22.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOPictureCoordinator.h"
#import "HEROBaseRouter.h"

@interface DEMOPictureCoordinator()
@end

@implementation DEMOPictureCoordinator


#pragma mark - DEMOPictureRouterOutput

#pragma mark - DEMOPictureUsecaseOutput
- (void)updatePicture:(DEMOPicturePonso *)picture {
	[(id<DEMOPictureViewInput>)self.viewLayer updatePicture:picture];
}

#pragma mark - DEMOPictureViewOutput

- (void)selectedImage {
	[(id<DEMOPictureUsecaseInput>)self.usecase selectedImage];
}

@end
