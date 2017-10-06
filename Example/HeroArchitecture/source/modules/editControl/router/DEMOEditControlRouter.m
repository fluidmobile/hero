//
//  DEMOEditControlRouter.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 26.09.17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//

#import "DEMOEditControlRouter.h"
#import "DEMOEditControlViewController.h"
#import "DEMOEditControlContracts.h"

@implementation DEMOEditControlRouter

-(Class)viewControllerClass{
	return [DEMOEditControlViewController class];
}

#pragma mark - DEMOEditControlRouterInput
- (void)switchedToEditingMode:(DEMOEditingMode)editingMode {
	[(id<DEMOEditControlWorkflowInput>)self.workflow editControlSwitchedToEditingMode:editingMode onRouter:self];
}

@end
