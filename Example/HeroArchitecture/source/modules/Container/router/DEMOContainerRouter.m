//
//  DEMOContainerRouter.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOContainerRouter.h"
#import "DEMOContainerViewController.h"
#import "DEMOContainerContracts.h"

@implementation DEMOContainerRouter

-(Class)viewControllerClass{
	return [DEMOContainerViewController class];
}

-(void)updateMasterRouter:(HEROBaseRouter*)router{
	[(id<DEMOContainerViewInput>)self.viewLayer updateMasterViewController:(HEROBaseViewController*)[router viewLayer]];
}

-(void)updateDetailRouter:(HEROBaseRouter*)router{
	[(id<DEMOContainerViewInput>)self.viewLayer updateDetailViewController:(HEROBaseViewController*)[router viewLayer]];
}

@end
