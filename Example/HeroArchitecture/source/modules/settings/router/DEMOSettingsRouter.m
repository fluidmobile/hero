//
//  DEMOSettingsRouter.m
//  fluidArchitecture
//
//  Created by Moritz Ellerbrock on 13/01/17.
//  Copyright © 2017 fluidmobile GmbH. All rights reserved.
//
#import "DEMOSettingsRouter.h"
#import "DEMOSettingsViewController.h"
#import "DEMOSettingsContracts.h"

@implementation DEMOSettingsRouter

-(Class)viewControllerClass{
    return [DEMOSettingsViewController class];
}

-(void)isLoggedOut{
	[(id<DEMOSettingsWorkflowControl>)self.workflow loggedOutOnRouter:self];
}


-(void)dismiss{
	[(id<DEMOSettingsWorkflowControl>)self.workflow dismissOnRouter:self];
}

@end
