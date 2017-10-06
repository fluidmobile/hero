//
//  DEMOPictureRouter.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 22.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOPictureRouter.h"
#import "DEMOPictureViewController.h"
#import "DEMOPictureContracts.h"

@implementation DEMOPictureRouter

-(Class)viewControllerClass{
	return [DEMOPictureViewController class];
}

@end
