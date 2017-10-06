//
//  DEMOMainRouter.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 12/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//
#import "DEMOMainRouter.h"
#import "DEMOMainViewController.h"
#import "DEMOMainContracts.h"

@implementation DEMOMainRouter
-(Class)viewControllerClass{
	return [DEMOMainViewController class];
}

-(void)selectedSelection:(DEMOMainSelection)selection{
	[(id <DEMOMainWorkflowInput>)self.workflow selectedSelection:selection onRouter:self];
}

- (void)presentRouterInDetailView:(HEROBaseRouter*)router{
	//ipad way
	UIViewController* viewController = [router viewLayer];
	[(id<DEMOMainViewInput>)self.viewLayer setDetailViewController:viewController];
	
}

@end
